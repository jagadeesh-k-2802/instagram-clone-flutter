import { User } from '@models/User';
import { Post } from '@models/Post';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';

/**
 * @route GET /api/user/:id
 * @desc Fetch data about a user
 * @secure true
 */
export const getUser = catchAsync(async (req, res, next) => {
  const userId = req.params.id;
  const user = await User.findById(userId).select('name username bio avatar');

  // TODO: Return isFollowed bool

  if (!user) {
    next(new ErrorResponse('The requested user is not found', 404));
    return;
  }

  res.status(200).json({ success: true, data: user });
});

/**
 * @route GET /api/user/posts/:id
 * @desc Fetch posts of a user
 * @secure true
 */
export const getUserPosts = catchAsync(async (req, res) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limi as string) || 20;
  const userId = req.params.id;
  const skip = (page - 1) * limit;

  const posts = await Post.find({ user: userId })
    .select('id caption assets')
    .skip(skip)
    .limit(limit);

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route GET /api/user/tagged-posts/:id
 * @desc Fetch tagged posts of a user
 * @secure true
 */
export const getUserTaggedPosts = catchAsync(async (req, res) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const userId = req.params.id;
  const skip = (page - 1) * limit;

  const posts = await Post.find({ taggedUsers: userId })
    .select('id caption assets')
    .skip(skip)
    .limit(limit);

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route GET /api/user/search
 * @desc Fetch users
 * @secure true
 */
export const searchUsers = catchAsync(async (req, res) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const search = req.query.search || undefined;
  const skip = (page - 1) * limit;
  const user = req.user;

  // Don't return any results if search string is empty
  if (search === undefined) {
    res.status(200).json({ success: true, data: [] });
    return;
  }

  const filter = {
    _id: { $ne: user.id },
    $or: [
      { name: { $regex: search, $options: 'i' } },
      { username: { $regex: search, $options: 'i' } }
    ]
  };

  const users = await User.find(filter, 'id name username avatar')
    .skip(skip)
    .limit(limit);

  res.status(200).json({ success: true, data: users });
});
