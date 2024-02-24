import jwt from 'jsonwebtoken';
import { Request } from 'express';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';
import { User, UserType } from '@models/User';

interface CustomRequest extends Request {
  user: UserType;
}

interface TokenInterface {
  id: string;
}

const isAuthenticated = async (req: Request) => {
  let token: string;

  if (
    req.headers.authorization !== null &&
    req.headers.authorization?.startsWith('Bearer') === true
  ) {
    token = req.headers.authorization.split(' ')[1];
  } else if (req.cookies.token) {
    token = req.cookies.token;
  } else {
    // No Token
    return false;
  }

  // JWT Verification
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET) as TokenInterface;
    const user = await User.findById(decoded.id);

    if (user !== null) {
      (req as CustomRequest).user = user;
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
};

const protect = catchAsync(async (req, res, next) => {
  if (await isAuthenticated(req)) {
    next();
  } else {
    next(new ErrorResponse('Not Authorized To Access This Route', 401));
  }
});

export { protect, isAuthenticated, TokenInterface, CustomRequest };
