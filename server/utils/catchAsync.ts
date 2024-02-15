import { Response, NextFunction } from 'express';
import { CustomRequest } from '@middlewares/auth';

type ControllerFunction = (
  req: CustomRequest,
  res: Response,
  next: NextFunction
) => Promise<void>;

const catchAsync = (fn: ControllerFunction) => {
  return (req: CustomRequest, res: Response, next: NextFunction) => {
    fn(req, res, next).catch(next);
  };
};

export default catchAsync;
