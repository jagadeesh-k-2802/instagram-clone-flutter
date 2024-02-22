import formidable from 'formidable';
import catchAsync from '@utils/catchAsync';

/**
 * @route POST /api/post
 * @desc Let a user create a post
 * @secure true
 */
export const createPost = catchAsync(async (req, res) => {
  const form = formidable();
  const user = req.user;
  const [fields, files] = await form.parse(req);
  console.log(fields, files, user);

  // TODO: Handle post upload

  res.status(201).json({
    success: true,
    message: 'Your post has been sucessfully uploaded'
  });
});
