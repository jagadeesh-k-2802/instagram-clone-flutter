import { Response } from 'express';
import { formidable } from 'formidable';
import { StreamChat } from 'stream-chat';
import { UserType, User } from '@models/User';
import { Confirmation } from '@models/Confirmations';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';
import Email from '@utils/email';
import { isAuthenticated } from '@middlewares/auth';
import { zParse } from '@validation/index';
import * as functions from '@utils/functions';
import * as authValidation from '@validation/auth';
import { Notification } from '@models/Notification';
import mongoose from 'mongoose';

/**
 * @route POST /api/auth/login
 * @desc let the user login
 * @secure false
 */
export const login = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.login, req);
  const { identifier, password, fcmToken } = body;

  const user = await User.findOne({
    $or: [
      { email: identifier },
      { username: identifier },
      { phone: identifier }
    ]
  }).select('+password');

  // User Not Found In DB
  if (!user) {
    return next(new ErrorResponse('Invalid credentials', 401));
  }

  const isPasswordMatched = await user.matchPassword(password);

  // Wrong Password
  if (!isPasswordMatched) {
    return next(new ErrorResponse('Invalid credentials', 401));
  }

  await User.findByIdAndUpdate(user.id, { fcmToken });
  sendTokenResponse(user, 200, res);
});

/**
 * @route POST /api/auth/register
 * @desc let the user register
 * @secure false
 */
export const register = catchAsync(async (req, res, next) => {
  const form = formidable();
  const [fields, files] = await form.parse(req);
  const customFields = {};

  // Transform form data to object
  for (const [key, value] of Object.entries(fields)) {
    customFields[key] = value?.at(0) ?? null;
  }

  const {
    name,
    username,
    birthday,
    email,
    gender,
    password,
    confirmationCode,
    fcmToken
  } = await zParse(authValidation.register, customFields);

  const confirmation = await Confirmation.findOne({
    email,
    code: confirmationCode
  });

  if (!confirmation) {
    return next(new ErrorResponse('Cannot sign up without verification', 401));
  }

  let filename = 'default-profile.png';
  const avatarFile = files.avatar?.at(0);

  // If user has uploaded avatar while creating account
  if (avatarFile !== undefined) {
    filename = `${username.replace(' ', '-')}.jpg`;
    await functions.moveFromTemp(avatarFile, '../public/avatar', filename);
  }

  // Stream Chat Setup
  const serverClient = StreamChat.getInstance(
    process.env.STREAM_API_KEY,
    process.env.STREAM_SECRET
  );

  const objectId = new mongoose.Types.ObjectId();
  const streamToken = serverClient.createToken(objectId.toString());

  await serverClient.upsertUsers([
    { id: objectId.toString(), name, role: 'user' }
  ]);

  const user = await User.create({
    _id: objectId,
    name,
    username,
    avatar: filename,
    birthday,
    email,
    gender,
    password,
    fcmToken,
    streamToken
  });

  await Confirmation.deleteOne({
    email,
    code: confirmationCode
  });

  await new Email(name, email, {}).sendWelcome();
  sendTokenResponse(user, 200, res);
});

/**
 * @route POST /api/auth/valid-username
 * @desc Check whether the following username is valid
 * @secure false
 */
export const verifyValidUsername = catchAsync(async (req, res) => {
  const { body } = await zParse(authValidation.verifyValidUsername, req);
  const { username } = body;
  const user = await User.findOne({ username });

  if (user) {
    res.status(400).json({ success: false, message: 'Username already taken' });
  } else {
    res.status(200).json({ success: true, message: 'Username exists' });
  }
});

/**
 * @route POST /api/auth/send-confirmation
 * @desc sends confirmation code to the user entered email address
 * @secure false
 */
export const sendConfirmationCode = catchAsync(async (req, res) => {
  const { body } = await zParse(authValidation.sendConfirmationCode, req);
  const { email } = body;
  const otp = functions.generateSixDigitRandomNumber().toString();

  const confirmation = await Confirmation.findOne({ email });

  if (confirmation != null) {
    await Confirmation.updateOne({ email }, { email, code: otp });
  } else {
    await Confirmation.create({ code: otp, email });
  }

  await new Email(email, email, { otp }).sendConfirmationCode();

  res.status(200).json({
    success: true,
    message: 'Confirmation code sent sucessfully'
  });
});

/**
 * @route POST /api/auth/verify-confirmation
 * @desc verify the confirmation code sent to the user
 * @secure false
 */
export const verifyConfirmationCode = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.verifyConfirmationCode, req);
  const { email, code } = body;
  const confirmation = await Confirmation.findOne({ email, code });

  if (!confirmation) {
    return next(new ErrorResponse('Invalid code entered or expired', 401));
  }

  res.status(200).json({
    success: true,
    message: 'Confirmation code verified sucessfully'
  });
});

/**
 * @route GET /api/auth/logout
 * @desc Returns the current user
 * @secure false
 */
export const getCurrentUser = catchAsync(async (req, res) => {
  await isAuthenticated(req); // Injects req.user
  const user = req.user.toObject();

  const unReadNotificationsCount = await Notification.countDocuments({
    user: user,
    isRead: false
  });

  res.status(200).json({
    success: true,
    data: { ...user, unReadNotificationsCount }
  });
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
  const { name, username, email, phone, bio, gender, isPrivateAccount } = body;
  const user = req.user;

  const fieldsToUpdate = {
    name,
    username,
    email,
    phone,
    bio,
    gender,
    isPrivateAccount
  };

  // Update on Stream Chat
  const serverClient = StreamChat.getInstance(
    process.env.STREAM_API_KEY,
    process.env.STREAM_SECRET
  );

  await serverClient.upsertUsers([
    { id: user.id.toString(), name, role: 'user' }
  ]);

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
  const [fields, files] = await form.parse(req);
  const customFields = {};

  // Transform form data to object
  for (const [key, value] of Object.entries(fields)) {
    customFields[key] = value?.at(0) === 'true' ? true : false;
  }

  const { removeAvatar } = await zParse(
    authValidation.updateAvatar,
    customFields
  );

  if (removeAvatar) {
    const fieldsToUpdate = { avatar: 'default-profile.png' };

    await User.findByIdAndUpdate(user.id, fieldsToUpdate, {
      new: true,
      runValidators: true
    });

    res.status(200).json({
      success: true,
      message: 'Profile Photo Removed Sucessfully'
    });
  } else {
    const avatar = files.avatar?.at(0);

    if (avatar === undefined) {
      return next(new ErrorResponse('No avatar uploaded', 404));
    }

    await functions.moveFromTemp(avatar, '../public/avatar', filename);
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
  }
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
  await new Email(user.name, user.email, { otp: token }).sendPasswordReset();

  try {
    res.status(200).json({
      success: true,
      message: 'Password reset OTP sent to your E-mail ID'
    });
  } catch (error) {
    user.resetPasswordToken = undefined;
    user.resetPasswordExpire = undefined;
    await user.save();
    return next(new ErrorResponse('Could not send email', 500));
  }

  await user.save();
});

/**
 * @route POST /api/auth/verify-forgot-password
 * @desc verify the confirmation code sent to the user for password reset
 * @secure false
 */
export const verifyForgotPasswordCode = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.verifyForgotPasswordCode, req);
  const { email, code } = body;

  const user = await User.findOne({
    email,
    resetPasswordToken: code,
    resetPasswordExpire: { $gt: Date.now() }
  });

  if (!user) {
    return next(new ErrorResponse('Invalid code entered or expired', 401));
  }

  res.status(200).json({
    success: true,
    message: 'Confirmation code verified sucessfully'
  });
});

/**
 * @route POST /api/auth/reset-password/
 * @desc Resets a user's password when requested with right reset token
 * @secure false
 */
export const resetPassword = catchAsync(async (req, res, next) => {
  const { body } = await zParse(authValidation.resetPassword, req);
  const { code, password } = body;

  const user = await User.findOne({
    resetPasswordToken: code,
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
  // Remove password before sending user object
  user.password = undefined;

  res.status(statusCode).json({
    success: true,
    user,
    token
  });
};
