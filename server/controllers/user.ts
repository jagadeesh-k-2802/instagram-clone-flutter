import mongoose from 'mongoose';
import { User, UserType } from '@models/User';
import { Post } from '@models/Post';
import { UserFollows, UserFollowsTypeEnum } from '@models/UserFollows';
import { Notification, NotificationTypeEnum } from '@models/Notification';
import catchAsync from '@utils/catchAsync';
import sendPushNotification from '@utils/sendPushNotfication';
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
export const getUserPosts = catchAsync(async (req, res, next) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limi as string) || 20;
  const userId = req.params.id;
  const skip = (page - 1) * limit;
  const user = req.user;
  const otherUser = await User.findById(userId);

  // Check if user exists
  if (!otherUser) {
    next(new ErrorResponse('User not found', 404));
    return;
  }

  if (otherUser.isPrivateAccount && otherUser.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: otherUser.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  const posts = await Post.find({ user: userId })
    .select('id caption assets')
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route GET /api/user/tagged-posts/:id
 * @desc Fetch tagged posts of a user
 * @secure true
 */
export const getUserTaggedPosts = catchAsync(async (req, res, next) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const userId = req.params.id;
  const skip = (page - 1) * limit;
  const user = req.user;
  const otherUser = await User.findById(userId);

  // Check if user exists
  if (!otherUser) {
    next(new ErrorResponse('User not found', 404));
    return;
  }

  if (otherUser.isPrivateAccount && otherUser.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: otherUser.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  const posts = await Post.find({ taggedUsers: userId })
    .select('id caption assets')
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route POST /api/user/follow/:id
 * @desc follow a user
 * @secure true
 */
export const followUser = catchAsync(async (req, res, next) => {
  const user = req.user;
  const followeeId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();
  const otherUser = await User.findById(followeeId);

  // Check if user exists
  if (!otherUser) {
    next(new ErrorResponse('User not found', 404));
    return;
  }

  const type = otherUser.isPrivateAccount
    ? UserFollowsTypeEnum.requested
    : UserFollowsTypeEnum.following;

  if (type === UserFollowsTypeEnum.requested) {
    await Notification.create({
      content: `${user.username} sent you follow request`,
      user: otherUser,
      type: NotificationTypeEnum.followRequest,
      data: { user }
    });

    await sendPushNotification({
      title: 'New follow request',
      body: `${user.username} sent you follow request`,
      tokens: [otherUser.fcmToken]
    });
  }

  try {
    await UserFollows.create({ follower: user.id, followee: followeeId, type });

    if (type === UserFollowsTypeEnum.following) {
      await User.findByIdAndUpdate(user.id, { $inc: { followingCount: 1 } });
      await User.findByIdAndUpdate(followeeId, { $inc: { followersCount: 1 } });

      await Notification.create({
        content: `${user.username} Started following you`,
        user: followeeId,
        data: { user },
        type: NotificationTypeEnum.info
      });

      await sendPushNotification({
        title: 'New follower',
        body: `${user.username} Started following you`,
        tokens: [otherUser.fcmToken]
      });
    }
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({
    success: true,
    message: `${
      type === UserFollowsTypeEnum.following ? 'Follow' : 'Request'
    } succesful`
  });
});

/**
 * @route POST /api/user/unfollow/:id
 * @desc Unfollow a user
 * @secure true
 */
export const unFollowUser = catchAsync(async (req, res, next) => {
  const user = req.user;
  const followeeId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  const followType = await UserFollows.findOne({
    follower: user.id,
    followee: followeeId
  }).select('type');

  if (followType?.type === UserFollowsTypeEnum.following) {
    await User.findByIdAndUpdate(user.id, { $inc: { followingCount: -1 } });
    await User.findByIdAndUpdate(followeeId, { $inc: { followersCount: -1 } });
  } else {
    await Notification.deleteOne({
      user: followeeId,
      type: NotificationTypeEnum.followRequest,
      'data.user': user
    });
  }

  try {
    await UserFollows.deleteOne({ follower: user.id, followee: followeeId });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({
    success: true,
    message: `${
      followType?.type === UserFollowsTypeEnum.following
        ? 'Unfollow'
        : 'Request deleted'
    } succesful`
  });
});

/**
 * @route GET /api/user/followers/:id
 * @desc get followers of a user
 * @secure true
 */
export const getFollowers = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const user = req.user;
  const otherUser = await User.findById(id);

  // Check if user exists
  if (!otherUser) {
    next(new ErrorResponse('User not found', 404));
    return;
  }

  if (otherUser.isPrivateAccount && otherUser.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: otherUser.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  const followers = await UserFollows.find({
    followee: id,
    type: UserFollowsTypeEnum.following
  })
    .skip((page - 1) * limit)
    .limit(limit)
    .populate<{ follower: UserType }>(
      'follower',
      'id name username avatar isPrivateAccount'
    )
    .select('follower')
    .sort({ createdAt: -1 })
    .lean();

  const followerIds = followers.map(follower => follower.follower);

  const followedBy = await UserFollows.find({
    follower: user.id,
    followee: { $in: followerIds }
  })
    .select('followee type')
    .lean();

  const transformedFollowers = followers.map(follower => ({
    ...follower.follower,
    followType:
      followedBy.find(
        x => x.followee.toString() === follower.follower._id.toString()
      )?.type ?? null
  }));

  res.status(200).json({ success: true, data: transformedFollowers });
});

/**
 * @route DELETE /api/user/followers/:id
 * @desc remove follower of current user
 * @secure true
 */
export const removeFollower = catchAsync(async (req, res, next) => {
  const user = req.user;
  const userId = req.params.id;
  const otherUser = await User.findById(userId);
  const session = await mongoose.startSession();
  session.startTransaction();

  // Check if post exists
  if (!otherUser) {
    new ErrorResponse('User not found', 404);
    return;
  }

  try {
    await User.findByIdAndUpdate(user.id, { $inc: { followersCount: -1 } });
    await User.findByIdAndUpdate(userId, { $inc: { followingCount: -1 } });
    await UserFollows.deleteOne({ follower: otherUser.id, followee: user.id });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({
    success: true,
    message: 'Follower removed succesful'
  });
});

/**
 * @route GET /api/user/following/:id
 * @desc get following of a user
 * @secure true
 */
export const getFollowing = catchAsync(async (req, res, next) => {
  const { id } = req.params;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const user = req.user;
  const otherUser = await User.findById(id);

  // Check if user exists
  if (!otherUser) {
    next(new ErrorResponse('User not found', 404));
    return;
  }

  if (otherUser.isPrivateAccount && otherUser.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: otherUser.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  const following = await UserFollows.find({
    follower: id,
    type: UserFollowsTypeEnum.following
  })
    .skip((page - 1) * limit)
    .limit(limit)
    .select('followee')
    .populate<{ followee: UserType }>(
      'followee',
      'id name username avatar isPrivateAccount'
    )
    .sort({ createdAt: -1 })
    .lean();

  const followingIds = following.map(follower => follower.followee);

  const followingBy = await UserFollows.find({
    follower: user.id,
    followee: { $in: followingIds }
  })
    .select('followee type')
    .lean();

  const transformedFollowing = following.map(follower => ({
    ...follower.followee,
    followType:
      followingBy.find(
        x => x.followee.toString() === follower.followee._id.toString()
      )?.type ?? null
  }));

  res.status(200).json({ success: true, data: transformedFollowing });
});

/**
 * @route POST /api/user/accept-request/:id
 * @desc accept a follow request sent by a user
 * @secure true
 */
export const acceptFollowRequest = catchAsync(async (req, res, next) => {
  const notificationId = req.params.id;
  const user = req.user;

  const notification = await Notification.findById(notificationId)
    .populate<{ data: { user: UserType } }>('data.user', 'id username')
    .lean();

  // Check if notification exists
  if (!notification) {
    next(new ErrorResponse('Request not found', 404));
    return;
  }

  const otherUser = notification.data.user;
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    await UserFollows.findOneAndUpdate(
      {
        follower: otherUser,
        followee: user,
        type: UserFollowsTypeEnum.requested
      },
      { type: UserFollowsTypeEnum.following }
    );

    await Notification.findByIdAndDelete(notificationId);
    await User.findByIdAndUpdate(otherUser, { $inc: { followingCount: 1 } });
    await User.findByIdAndUpdate(user, { $inc: { followersCount: 1 } });

    await Notification.create({
      content: `${otherUser.username} Started following you`,
      data: { user: otherUser },
      user: user,
      type: NotificationTypeEnum.info
    });

    await sendPushNotification({
      title: 'New follower',
      body: `${otherUser.username} Started following you`,
      tokens: [user.fcmToken]
    });

    await Notification.create({
      content: `${user.username} accepted your follow request`,
      data: { user },
      user: otherUser,
      type: NotificationTypeEnum.info
    });

    await sendPushNotification({
      title: 'Follow request accepted',
      body: `${user.username} accepted your follow request`,
      tokens: [otherUser.fcmToken]
    });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({
    success: true,
    message: 'Request accepted successful'
  });
});

/**
 * @route POST /api/user/accept-request/:id
 * @desc accept a follow request sent by a user
 * @secure true
 */
export const deleteFollowRequest = catchAsync(async (req, res, next) => {
  const notificationId = req.params.id;
  const user = req.user;
  const notification = await Notification.findById(notificationId);

  // Check if notification exists
  if (!notification) {
    next(new ErrorResponse('Request not found', 404));
    return;
  }

  const otherUser = notification.data.user;
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    await UserFollows.findOneAndDelete({
      follower: otherUser,
      followee: user,
      type: UserFollowsTypeEnum.requested
    });

    await Notification.findByIdAndDelete(notificationId);
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({
    success: true,
    message: 'Request deleted successful'
  });
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
      followingCount: 1,
      isPrivateAccount: 1
    })
    .lean();

  if (!user) {
    next(new ErrorResponse('The requested user is not found', 404));
    return;
  }

  const isFollowed = await UserFollows.findOne({
    follower: currUser.id,
    followee: userId
  }).select('type');

  res.status(200).json({
    success: true,
    data: { ...user, followType: isFollowed?.type ?? null }
  });
});
