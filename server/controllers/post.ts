import mongoose from 'mongoose';
import { formidable } from 'formidable';
import { v4 as uuidv4 } from 'uuid';
import { AssetType, Post } from '@models/Post';
import { User } from '@models/User';
import { UserFollows } from '@models/UserFollows';
import { PostLikes } from '@models/PostLikes';
import { PostSaves } from '@models/PostSaves';
import { zParse } from '@validation/index';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';
import * as functions from '@utils/functions';
import * as postValidation from '@validation/post';

/**
 * @route POST /api/post/feed-posts
 * @desc Fetch current user feed
 * @secure true
 */
export const getFeedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  type ObjectID = mongoose.Types.ObjectId | mongoose.Schema.Types.ObjectId;
  const followingUsers = await UserFollows.find({ follower: user.id });
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
      $project: {
        _id: 1,
        caption: 1,
        'assets.assetType': 1,
        'assets.url': 1,
        'user._id': 1,
        'user.name': 1,
        'user.avatar': 1,
        'user.username': 1,
        likeCount: 1,
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
 * @route POST /api/post/like/:id
 * @desc let a user like a post
 * @secure true
 */
export const likePost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  // TODO: Send Push Notification

  try {
    await PostLikes.create({ user: user.id, post: postId });
    await Post.findByIdAndUpdate(postId, { $inc: { likeCount: 1 } });
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

  // TODO: Send Push Notification

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

  // TODO: Send Push Notification

  try {
    await PostSaves.create({ userId: user.id, postId });
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

  // TODO: Send Push Notification

  try {
    await PostSaves.deleteOne({ userId: user.id, postId });
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
 * @route POST /api/post/liked-posts/:id
 * @desc Fetch posts liked by current user
 * @secure true
 */
export const getLikedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const posts = await PostLikes.find({ user })
    .select('post createdAt')
    .populate('post', 'id assets')
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: posts });
});

/**
 * @route POST /api/post/saved-posts/:id
 * @desc Fetch posts saved by current user
 * @secure true
 */
export const getSavedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const posts = await PostSaves.find({ user })
    .select('post createdAt')
    .populate('post', 'id assets')
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: posts });
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
