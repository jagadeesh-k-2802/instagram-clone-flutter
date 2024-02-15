import mv from 'mv';
import path from 'path';
import { Response } from 'express';
import crypto from 'crypto';
import { formidable } from 'formidable';
import { UserType, User } from '@models/User';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';
import Email from '@utils/email';
import { isAuthenticated } from '@middlewares/auth';
import { bytesToMB } from '@utils/functions';
import { zParse } from '@validation/index';
import * as authValidation from '@validation/auth';

/**
 * @route POST /api/auth/login
 * @desc let the user login
 * @secure false
 */
export const login = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.login, req);
  const { email, password, fcmToken } = body;

  // Validate email & password
  if (!email || !password) {
    return next(new ErrorResponse('Please provide an email and password', 400));
  }

  const user = await User.findOne({ email }).select('+password');

  // User Not Found In DB
  if (!user) {
    return next(new ErrorResponse('Invalid Email Or Password', 401));
  }

  const isPasswordMatched = await user.matchPassword(password);

  // Wrong Password
  if (!isPasswordMatched) {
    return next(new ErrorResponse('Invalid Email Or Password', 401));
  }

  await User.findByIdAndUpdate(user.id, { fcmToken });
  sendTokenResponse(user, 200, res);
});

/**
 * @route POST /api/auth/register
 * @desc let the user register
 * @secure false
 */
export const register = catchAsync(async (req, res) => {
  const { body } = await zParse(authValidation.register, req);

  const {
    name,
    avatar = 'default-avatar.jpg',
    email,
    password,
    phone,
    fcmToken
  } = body;

  const user = await User.create({
    name,
    avatar,
    email,
    phone,
    fcmToken,
    password
  });

  await new Email(user, {}).sendWelcome();
  sendTokenResponse(user, 200, res);
});

/**
 * @route GET /api/auth/logout
 * @desc Returns the current user
 * @secure false
 */
export const getCurrentUser = catchAsync(async (req, res) => {
  await isAuthenticated(req); // Injects req.user
  res.status(200).json({ success: true, data: req.user });
});

/**
 * @route GET /api/auth/logout
 * @desc let the user logout
 * @secure true
 */
export const logout = catchAsync(async (req, res) => {
  const user = req.user;
  await User.findByIdAndUpdate(user.id, { fcmToken: null });

  res.status(200).json({
    success: true,
    message: 'Logout Sucessful'
  });
});

/**
 * @route POST /api/auth/update-details
 * @desc Let a user update their details
 * @secure true
 */
export const updateDetails = catchAsync(async (req, res) => {
  const { body } = await zParse(authValidation.updateDetails, req);
  const { name, email, phone } = body;
  const user = req.user;

  const fieldsToUpdate = {
    name,
    email,
    phone
  };

  await User.findByIdAndUpdate(user.id, fieldsToUpdate, {
    new: true,
    runValidators: true
  });

  res.status(200).json({
    success: true,
    message: 'Profile Details Updated Sucessfully'
  });
});

/**
 * @route POST /api/auth/update-password
 * @desc Let a user update their password
 * @secure true
 */
export const updatePassword = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.updatePassword, req);
  const { currentPassword, newPassword } = body;
  const user = await User.findById(req.user.id).select('+password');

  if (!user) {
    return next(new ErrorResponse('User not found', 404));
  }

  // Check current password
  if (!(await user.matchPassword(currentPassword))) {
    return next(new ErrorResponse('Password is incorrect', 401));
  }

  // Check whether new password matches current password
  if (await user.matchPassword(newPassword)) {
    return next(
      new ErrorResponse(
        'This password is already in use, Kindly create another one',
        401
      )
    );
  }

  user.password = newPassword;
  await user.save();
  sendTokenResponse(user, 200, res);
});

/**
 * @route POST /api/auth/update-avatar
 * @desc Let a user update their profile picture
 * @secure true
 */
export const updateAvatar = catchAsync(async (req, res, next) => {
  const form = formidable();
  const user = req.user;
  const filename = `${user.name.replace(' ', '-')}.jpg`;

  // Move The File From Temp To Avatar Dir
  const moveFromTemp = async file => {
    try {
      const dest = path.join(__dirname, '../public/avatar', filename);
      mv(file.avatar[0].filepath, dest, { mkdirp: true }, err => {
        console.error(err);
      });
    } catch (err) {
      next(err);
    }
  };

  // Parse form
  form.parse(req, async (err, fields, file) => {
    const avatar = file.avatar?.at(0);

    if (avatar === undefined) {
      return next(new ErrorResponse('No avatar uploaded', 404));
    }

    const size = bytesToMB(avatar.size);

    if (size > 3) {
      return next(
        new ErrorResponse('File size cannot be greater than 3 MB', 401)
      );
    }

    if (err) {
      return next(err);
    }

    moveFromTemp(file);
    const fieldsToUpdate = { avatar: filename };

    // Update user in DB
    await User.findByIdAndUpdate(user.id, fieldsToUpdate, {
      new: true,
      runValidators: true
    });

    res.status(200).json({
      success: true,
      message: 'Profile Photo Updated Sucessfully'
    });
  });
});

/**
 * @route POST /api/auth/forgot-password
 * @desc Sends a mail with reset token to the given email address
 * @secure false
 */
export const forgotPassword = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.forgotPassword, req);
  const { email } = body;
  const user = await User.findOne({ email });

  if (!user) {
    return next(
      new ErrorResponse('No User found with that email address', 404)
    );
  }

  const token = user.getResetPasswordToken();
  await new Email(user, { otp: token }).sendPasswordReset();

  try {
    res.status(200).json({
      success: true,
      message: 'Password reset OTP sent to your E-mail ID'
    });
  } catch (err) {
    user.resetPasswordToken = undefined;
    user.resetPasswordExpire = undefined;
    await user.save();
    return next(new ErrorResponse('Could not send email', 500));
  }

  await user.save();
});

/**
 * @route POST /api/auth/reset-password/
 * @desc Resets a user's password when requested with right reset token
 * @secure false
 */
export const resetPassword = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.resetPassword, req);
  const { token, password } = body;

  const resetPasswordToken = crypto
    .createHash('sha256')
    .update(token)
    .digest('hex');

  // Find The Hashed version
  const user = await User.findOne({
    resetPasswordToken,
    resetPasswordExpire: { $gt: Date.now() }
  });

  // Token expired or invalid token
  if (!user) {
    return next(new ErrorResponse('Invalid or Expired OTP', 404));
  }

  // Update user with new password
  user.password = password;
  user.resetPasswordToken = undefined;
  user.resetPasswordExpire = undefined;
  await user.save();

  res.status(200).json({
    success: true,
    message: 'Password has been changed, Use your new password to login'
  });
});

// Creates a JWT Token and returns it
const sendTokenResponse = (
  user: UserType,
  statusCode: number,
  res: Response
) => {
  const token = user.getSignedJwtToken();
  user.password = undefined;

  res.status(statusCode).json({
    success: true,
    user,
    token
  });
};
