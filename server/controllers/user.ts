import mongoose from 'mongoose';
import { User, UserType } from '@models/User';
import { Post } from '@models/Post';
import { UserFollows } from '@models/UserFollows';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';

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
 * @route PATCH /api/user/follow/:id
 * @desc follow a user
 * @secure true
 */
export const followUser = catchAsync(async (req, res, next) => {
  const user = req.user;
  const followeeId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  // TODO: Send Push Notification

  try {
    await UserFollows.create({ followerId: user.id, followeeId });
    await User.findByIdAndUpdate(user.id, { $inc: { followingCount: 1 } });
    await User.findByIdAndUpdate(followeeId, { $inc: { followersCount: 1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Follow succesful' });
});

/**
 * @route PATCH /api/user/unfollow/:id
 * @desc Unfollow a user
 * @secure true
 */
export const unFollowUser = catchAsync(async (req, res, next) => {
  const user = req.user;
  const followeeId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    await UserFollows.deleteOne({ followerId: user.id, followeeId });
    await User.findByIdAndUpdate(user.id, { $inc: { followingCount: -1 } });
    await User.findByIdAndUpdate(followeeId, { $inc: { followersCount: -1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }
  res.status(200).json({ success: true, message: 'Unfollow succesful' });
});

/**
 * @route PATCH /api/user/followers/:id
 * @desc get followers of a user
 * @secure true
 */
export const getFollowers = catchAsync(async (req, res) => {
  const { id } = req.params;
  const page = parseInt(req.query.page as string) || 1;
  const user = req.user;
  const limit = parseInt(req.query.limit as string) || 20;

  const followers = await UserFollows.find({ followeeId: id })
    .skip((page - 1) * limit)
    .limit(limit)
    .populate<{ followerId: UserType }>('followerId', 'id name username avatar')
    .select('followerId')
    .lean();

  const followerIds = followers.map(follower => follower.followerId);

  const followedBy = await UserFollows.find({
    followerId: user.id,
    followeeId: { $in: followerIds }
  })
    .select('followeeId')
    .lean();

  const transformedFollowers = followers.map(follower => ({
    ...follower.followerId,
    isFollowed: !!followedBy.find(
      x => x.followeeId.toString() === follower.followerId._id.toString()
    )
  }));

  res.status(200).json({ success: true, data: transformedFollowers });
});

/**
 * @route PATCH /api/user/following/:id
 * @desc get following of a user
 * @secure true
 */
export const getFollowing = catchAsync(async (req, res) => {
  const { id } = req.params;
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;

  const following = await UserFollows.find({ followerId: id })
    .skip((page - 1) * limit)
    .limit(limit)
    .select('followeeId')
    .populate<{ followeeId: UserType }>('followeeId', 'id name username avatar')
    .lean();

  const followingIds = following.map(follower => follower.followeeId);

  const followingBy = await UserFollows.find({
    followerId: user.id,
    followeeId: { $in: followingIds }
  })
    .select('followeeId')
    .lean();

  const transformedFollowing = following.map(follower => ({
    ...follower.followeeId,
    isFollowed: !!followingBy.find(
      x => x.followeeId.toString() === follower.followeeId._id.toString()
    )
  }));

  res.status(200).json({ success: true, data: transformedFollowing });
});

/**
 * @route GET /api/user/:id
 * @desc Fetch data about a user
 * @secure true
 */
export const getUser = catchAsync(async (req, res, next) => {
  const currUser = req.user;
  const userId = req.params.id;

  const user = await User.findById(userId)
    .select({
      id: 1,
      name: 1,
      username: 1,
      bio: 1,
      avatar: 1,
      postCount: 1,
      followersCount: 1,
      followingCount: 1
    })
    .lean();

  if (!user) {
    next(new ErrorResponse('The requested user is not found', 404));
    return;
  }

  const isFollowed = await UserFollows.exists({
    followerId: currUser.id,
    followeeId: userId
  });

  res.status(200).json({
    success: true,
    data: { ...user, isFollowed: !!isFollowed }
  });
});
