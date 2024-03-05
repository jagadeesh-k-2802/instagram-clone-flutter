import mongoose from 'mongoose';
import path from 'path';
import { rm } from 'node:fs/promises';
import ffmpeg from 'fluent-ffmpeg';
import { formidable } from 'formidable';
import { v4 as uuidv4 } from 'uuid';
import { AssetType, Post } from '@models/Post';
import { User, UserType } from '@models/User';
import { UserFollows, UserFollowsTypeEnum } from '@models/UserFollows';
import { Notification, NotificationTypeEnum } from '@models/Notification';
import { PostLikes } from '@models/PostLikes';
import { PostSaves } from '@models/PostSaves';
import { zParse } from '@validation/index';
import catchAsync from '@utils/catchAsync';
import sendPushNotification from '@utils/sendPushNotfication';
import ErrorResponse from '@utils/errorResponse';
import * as functions from '@utils/functions';
import * as postValidation from '@validation/post';

/**
 * @route GET /api/post/feed-posts
 * @desc Fetch current user feed
 * @secure true
 */
export const getFeedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  type ObjectID = mongoose.Types.ObjectId | mongoose.Schema.Types.ObjectId;

  const followingUsers = await UserFollows.find({
    follower: user.id,
    type: UserFollowsTypeEnum.following
  });

  const followingUserIds: ObjectID[] = followingUsers.map(e => e.followee);
  followingUserIds.push(new mongoose.Types.ObjectId(user.id));

  const posts = await Post.aggregate([
    { $match: { user: { $in: followingUserIds } } },
    {
      $lookup: {
        from: 'users',
        localField: 'user',
        foreignField: '_id',
        as: 'user'
      }
    },
    { $unwind: '$user' },
    {
      $lookup: {
        from: 'users',
        localField: 'taggedUsers',
        foreignField: '_id',
        as: 'taggedUsers'
      }
    },
    {
      $project: {
        _id: 1,
        caption: 1,
        taggedUsers: {
          $map: {
            input: '$taggedUsers',
            as: 'taggedUser',
            in: {
              _id: '$$taggedUser._id',
              avatar: '$$taggedUser.avatar',
              username: '$$taggedUser.username',
              name: '$$taggedUser.name'
            }
          }
        },
        'assets.assetType': 1,
        'assets.url': 1,
        'user._id': 1,
        'user.name': 1,
        'user.avatar': 1,
        'user.username': 1,
        likeCount: 1,
        commentCount: 1,
        isLiked: 1,
        isSaved: 1,
        createdAt: 1,
        updatedAt: 1
      }
    },
    {
      $lookup: {
        from: 'postlikes',
        let: { post: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$post', '$$post'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(user.id)] }
                ]
              }
            }
          }
        ],
        as: 'isLiked'
      }
    },
    {
      $addFields: {
        isLiked: { $gt: [{ $size: '$isLiked' }, 0] }
      }
    },
    {
      $lookup: {
        from: 'postsaves',
        let: { post: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$post', '$$post'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(user.id)] }
                ]
              }
            }
          }
        ],
        as: 'isSaved'
      }
    },
    {
      $addFields: {
        isSaved: { $gt: [{ $size: '$isSaved' }, 0] }
      }
    },
    { $skip: skip },
    { $limit: limit },
    { $sort: { createdAt: -1 } }
  ]);

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route GET /api/post/explore-posts
 * @desc Fetch explore posts
 * @secure true
 */
export const getExplorePosts = catchAsync(async (req, res) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const posts = await Post.aggregate([
    {
      $lookup: {
        from: 'users',
        localField: 'user',
        foreignField: '_id',
        as: 'user'
      }
    },
    { $unwind: '$user' },
    { $match: { 'user.isPrivateAccount': false } },
    {
      $project: {
        _id: 1,
        'assets.assetType': 1,
        'assets.url': 1,
        createdAt: 1
      }
    },
    { $skip: skip },
    { $limit: limit },
    { $sort: { createdAt: -1 } }
  ]);

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route POST /api/post/like/:id
 * @desc let a user like a post
 * @secure true
 */
export const likePost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  const post = await Post.findById(postId).populate<{ user: UserType }>('user');

  // Check if post exists
  if (!post) {
    next(new ErrorResponse('Post not found', 404));
    return;
  }

  if (post.user.isPrivateAccount && post.user.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: post.user.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  try {
    await PostLikes.create({ user: user.id, post: postId });
    await Post.findByIdAndUpdate(postId, { $inc: { likeCount: 1 } });

    // Don't send notification if owner likes their own post
    if (user.id != post.user.id.toString()) {
      await Notification.create({
        content: `${user.username} Liked your post`,
        user: post.user,
        data: { user, post },
        type: NotificationTypeEnum.info
      });

      await sendPushNotification({
        title: 'Your post got a like',
        body: `${user.username} Liked your post`,
        tokens: [post.user.fcmToken]
      });
    }

    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
    return;
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Like succesful' });
});

/**
 * @route POST /api/post/unlike/:id
 * @desc let a user unlike a post
 * @secure true
 */
export const unLikePost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();
  const post = await Post.findById(postId).populate<{ user: UserType }>('user');

  // Check if post exists
  if (!post) {
    next(new ErrorResponse('Post not found', 404));
    return;
  }

  if (post.user.isPrivateAccount && post.user.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: post.user.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  try {
    await PostLikes.deleteOne({ user: user.id, post: postId });
    await Post.findByIdAndUpdate(postId, { $inc: { likeCount: -1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Unlike succesful' });
});

/**
 * @route POST /api/post/save/:id
 * @desc let a user save a post
 * @secure true
 */
export const savePost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();
  const post = await Post.findById(postId).populate<{ user: UserType }>('user');

  // Check if post exists
  if (!post) {
    next(new ErrorResponse('Post not found', 404));
    return;
  }

  if (post.user.isPrivateAccount && post.user.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: post.user.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  try {
    await PostSaves.create({ user: user.id, post: postId });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
    return;
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Like succesful' });
});

/**
 * @route POST /api/post/unsave/:id
 * @desc let a user unsave a post
 * @secure true
 */
export const unSavePost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();
  const post = await Post.findById(postId).populate<{ user: UserType }>('user');

  // Check if post exists
  if (!post) {
    next(new ErrorResponse('Post not found', 404));
    return;
  }

  if (post.user.isPrivateAccount && post.user.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: post.user.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  try {
    await PostSaves.deleteOne({ user: user.id, post: postId });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Unlike succesful' });
});

/**
 * @route DELETE /api/post/delete/:id
 * @desc let a user delete a post
 * @secure true
 */
export const deletePost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;
  const post = await Post.findById(postId).lean();
  const session = await mongoose.startSession();
  session.startTransaction();

  // Check if post exists
  if (!post) {
    new ErrorResponse('Post not found', 404);
    return;
  }

  const dirPath = post?.assets[0].url.split('/')[0];

  // Check for ownership
  if (!post.user === user.id) {
    new ErrorResponse('Unauthorized access', 401);
    return;
  }

  try {
    await Post.findByIdAndDelete(postId);
    await User.findByIdAndUpdate(user.id, { $inc: { postCount: -1 } });
    await Notification.deleteMany({ data: { post: postId } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  await rm(path.join(__dirname, `../public/posts/${dirPath}`), {
    recursive: true,
    force: true
  });

  res.status(200).json({ success: true, message: 'Post delete succesful' });
});

/**
 * @route GET /api/post/liked-posts/:id
 * @desc Fetch posts liked by current user
 * @secure true
 */
export const getLikedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  // Filter out liked posts where the owner is private and the user
  // is not following them currently
  const posts = await PostLikes.aggregate([
    {
      $match: { user: new mongoose.Types.ObjectId(user.id) }
    },
    {
      $lookup: {
        from: 'posts',
        localField: 'post',
        foreignField: '_id',
        as: 'post'
      }
    },
    {
      $unwind: '$post'
    },
    {
      $lookup: {
        from: 'users',
        localField: 'post.user',
        foreignField: '_id',
        as: 'post.user'
      }
    },
    {
      $unwind: '$post.user'
    },
    {
      $lookup: {
        from: 'userfollows',
        let: { userId: '$post.user._id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$follower', new mongoose.Types.ObjectId(user.id)] },
                  { $eq: ['$$userId', '$followee'] },
                  { $eq: ['$type', 'following'] }
                ]
              }
            }
          }
        ],
        as: 'followings'
      }
    },
    {
      $addFields: {
        isPrivateAccount: '$post.user.isPrivateAccount'
      }
    },
    {
      $match: {
        $or: [
          { 'post.user._id': new mongoose.Types.ObjectId(user.id) },
          { isPrivateAccount: false },
          {
            $and: [
              { isPrivateAccount: true },
              { $expr: { $gt: [{ $size: '$followings' }, 0] } }
            ]
          }
        ]
      }
    },
    {
      $project: {
        'post._id': 1,
        'post.assets': 1
      }
    },
    { $skip: skip },
    { $limit: limit },
    { $sort: { createdAt: -1 } }
  ]);

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route GET /api/post/saved-posts/:id
 * @desc Fetch posts saved by current user
 * @secure true
 */
export const getSavedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const posts = await PostSaves.aggregate([
    {
      $match: { user: new mongoose.Types.ObjectId(user.id) }
    },
    {
      $lookup: {
        from: 'posts',
        localField: 'post',
        foreignField: '_id',
        as: 'post'
      }
    },
    {
      $unwind: '$post'
    },
    {
      $lookup: {
        from: 'users',
        localField: 'post.user',
        foreignField: '_id',
        as: 'post.user'
      }
    },
    {
      $unwind: '$post.user'
    },
    {
      $lookup: {
        from: 'userfollows',
        let: { userId: '$post.user._id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$follower', new mongoose.Types.ObjectId(user.id)] },
                  { $eq: ['$$userId', '$followee'] },
                  { $eq: ['$type', 'following'] }
                ]
              }
            }
          }
        ],
        as: 'followings'
      }
    },
    {
      $addFields: {
        isPrivateAccount: '$post.user.isPrivateAccount'
      }
    },
    {
      $match: {
        $or: [
          { 'post.user._id': new mongoose.Types.ObjectId(user.id) },
          { isPrivateAccount: false },
          {
            $and: [
              { isPrivateAccount: true },
              { $expr: { $gt: [{ $size: '$followings' }, 0] } }
            ]
          }
        ]
      }
    },
    {
      $project: {
        'post._id': 1,
        'post.assets': 1
      }
    },
    { $skip: skip },
    { $limit: limit },
    { $sort: { createdAt: -1 } }
  ]);

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route GET /api/post/:id
 * @desc Fetch a single post
 * @secure true
 */
export const getPost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;

  const post = await Post.aggregate([
    { $match: { _id: new mongoose.Types.ObjectId(postId) } },
    {
      $lookup: {
        from: 'users',
        localField: 'user',
        foreignField: '_id',
        as: 'user'
      }
    },
    { $unwind: '$user' },
    {
      $lookup: {
        from: 'users',
        localField: 'taggedUsers',
        foreignField: '_id',
        as: 'taggedUsers'
      }
    },
    {
      $project: {
        _id: 1,
        caption: 1,
        taggedUsers: {
          $map: {
            input: '$taggedUsers',
            as: 'taggedUser',
            in: {
              _id: '$$taggedUser._id',
              avatar: '$$taggedUser.avatar',
              username: '$$taggedUser.username',
              name: '$$taggedUser.name'
            }
          }
        },
        'assets.assetType': 1,
        'assets.url': 1,
        'user._id': 1,
        'user.name': 1,
        'user.avatar': 1,
        'user.username': 1,
        likeCount: 1,
        commentCount: 1,
        isLiked: 1,
        isSaved: 1,
        createdAt: 1,
        updatedAt: 1
      }
    },
    {
      $lookup: {
        from: 'postlikes',
        let: { post: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$post', '$$post'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(user.id)] }
                ]
              }
            }
          }
        ],
        as: 'isLiked'
      }
    },
    {
      $addFields: {
        isLiked: { $gt: [{ $size: '$isLiked' }, 0] }
      }
    },
    {
      $lookup: {
        from: 'postsaves',
        let: { post: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$post', '$$post'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(user.id)] }
                ]
              }
            }
          }
        ],
        as: 'isSaved'
      }
    },
    {
      $addFields: {
        isSaved: { $gt: [{ $size: '$isSaved' }, 0] }
      }
    }
  ]);

  // Check if post exists
  if (!post[0]) {
    next(new ErrorResponse('No post found', 404));
    return;
  }

  if (
    post[0].user.isPrivateAccount &&
    post[0].user._id.toString() !== user.id
  ) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: post[0].user._id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  res.status(200).json({ success: true, data: post[0] });
});

/**
 * @route GET /api/post/likes/:id
 * @desc Fetch a single post
 * @secure true
 */
export const getLikedUsersForPost = catchAsync(async (req, res) => {
  const postId = req.params.id;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const postLikes = await PostLikes.find({ post: postId })
    .populate<{ user: UserType }>('user', 'id avatar name username')
    .select('user')
    .skip(skip)
    .limit(limit)
    .lean();

  const transformedPostLikes = postLikes.map(el => el.user);

  res.status(200).json({ success: true, data: transformedPostLikes });
});

/**
 * @route POST /api/post
 * @desc Let a user create a post
 * @secure true
 */
export const createPost = catchAsync(async (req, res, next) => {
  const form = formidable();
  const user = req.user;
  const [fields, files] = await form.parse(req);
  const customFields = {};

  // Transform form-data to object
  for (const [key, value] of Object.entries(fields)) {
    switch (key) {
      case 'taggedUsers':
        customFields[key] = value
          ?.at(0)
          ?.split(' ')
          .filter(x => x != '');
        break;
      default:
        customFields[key] = value?.at(0);
        break;
    }
  }

  const { caption, taggedUsers } = await zParse(
    postValidation.createPost,
    customFields
  );

  const assets: Array<AssetType> = [];

  if (files.files === undefined) {
    next(
      new ErrorResponse(
        'Please add at least one photo or video to create a post',
        400
      )
    );

    return;
  }

  const uniqueId = uuidv4();

  // Copy each file to directory
  for await (const file of files.files) {
    const regex = file.originalFilename?.match(/\.[^/]+$/);
    const ext = regex != null ? regex[0] : '';
    const assetType = ['.jpg', '.jpeg'].includes(ext) ? 'image' : 'video';
    const newFilename = `${file.newFilename}${ext}`;

    await functions.moveFromTemp(
      file,
      `../public/posts/${uniqueId}`,
      newFilename
    );

    assets.push({ assetType, url: `${uniqueId}/${newFilename}` });
  }

  // Generate Thumbnails
  for await (const file of files.files) {
    const regex = file.originalFilename?.match(/\.[^/]+$/);
    const ext = regex != null ? regex[0] : '';
    const assetType = ['.jpg', '.jpeg'].includes(ext) ? 'image' : 'video';
    const newFilename = `${file.newFilename}${ext}`;

    if (assetType === 'video') {
      await ffmpeg(
        path.join(
          __dirname,
          '../',
          'public/posts',
          `${uniqueId}/${newFilename}`
        )
      ).thumbnail({
        timestamps: ['50%'],
        filename: path
          .join(__dirname, '../', 'public/posts', `${uniqueId}/${newFilename}`)
          .replace('.mp4', '.jpg'),
        size: '500x500'
      });
    }
  }

  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    await Post.create({ caption, taggedUsers, assets, user });
    await User.findByIdAndUpdate(user.id, { $inc: { postCount: 1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(201).json({
    success: true,
    message: 'Your post has been sucessfully uploaded'
  });
});
