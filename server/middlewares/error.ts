import { ErrorRequestHandler } from 'express';
import { ZodError } from 'zod';
import ErrorResponse from '@utils/errorResponse';
import { fromZodError } from 'zod-validation-error';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const errorHandler: ErrorRequestHandler = (err, req, res, next) => {
  console.log(err.message.red);

  let error = { ...err };
  error.message = err.message;

  // Zod Validation Error
  if (err instanceof ZodError) {
    const validationError = fromZodError(err, {
      includePath: false,
      issueSeparator: '\n',
      maxIssuesInMessage: 3,
      prefix: '',
      prefixSeparator: ''
    });

    error = new ErrorResponse(validationError.toString(), 400);
  }

  // Bad ObjectId For Mongoose
  if (error.kind === 'ObjectId') {
    const message = `Resource not found`;
    error = new ErrorResponse(message, 404);
  }

  // Mongoose Duplicate Key
  if (err.code === 11000) {
    const message = `${JSON.stringify(error.keyValue)} already exists`;
    error = new ErrorResponse(message, 400);
  }

  // Mongoose Validation Error
  if (err.name === 'ValidationError') {
    const message = Object.values(err.errors)
      .map((val: Error) => val.message)
      .toString();

    error = new ErrorResponse(message, 400);
  }

  res.status(error.statusCode ?? 500).json({
    success: false,
    error: error.message ?? 'Internal Server Error'
  });
};

export default errorHandler;
