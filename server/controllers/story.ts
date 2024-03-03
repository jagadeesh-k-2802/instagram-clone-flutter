import mongoose from 'mongoose';
import { formidable } from 'formidable';
import { v4 as uuidv4 } from 'uuid';
import { rm } from 'node:fs/promises';
import path from 'path';
import ffmpeg from 'fluent-ffmpeg';
import { Story } from '@models/Story';
import catchAsync from '@utils/catchAsync';
import { UserFollows, UserFollowsTypeEnum } from '@models/UserFollows';
import ErrorResponse from '@utils/errorResponse';
import * as functions from '@utils/functions';
import { StoryViews } from '@models/StoryViews';
import { User, UserType } from '@models/User';

/**
 * @route GET /api/story/feed-stories
 * @desc Fetch stories for feed
 * @secure true
 */
export const getFeedStories = catchAsync(async (req, res) => {
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

  const stories = await Story.aggregate([
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
        from: 'storyviews',
        let: { story: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$story', '$$story'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(user.id)] }
                ]
              }
            }
          }
        ],
        as: 'isViewed'
      }
    },
    {
      $addFields: {
        isViewed: { $gt: [{ $size: '$isViewed' }, 0] }
      }
    },
    {
      $group: {
        _id: '$user._id',
        username: { $first: '$user.username' },
        name: { $first: '$user.name' },
        avatar: { $first: '$user.avatar' },
        stories: { $push: '$$ROOT' }
      }
    },
    {
      $addFields: {
        hasPending: { $not: { $allElementsTrue: ['$stories.isViewed'] } }
      }
    },
    {
      $project: {
        _id: 1,
        name: 1,
        username: 1,
        avatar: 1,
        stories: {
          $map: {
            input: '$stories',
            as: 'story',
            in: {
              _id: '$$story._id',
              asset: '$$story.asset',
              createdAt: '$$story.createdAt',
              isViewed: '$$story.isViewed',
              viewCount: {
                $cond: [
                  {
                    $eq: [
                      '$$story.user._id',
                      new mongoose.Types.ObjectId(user.id)
                    ]
                  },
                  '$$story.viewCount',
                  null
                ]
              }
            }
          }
        },
        hasPending: 1
      }
    },
    { $skip: skip },
    { $limit: limit },
    { $sort: { hasPending: -1 } }
  ]);

  const currentUserStories = stories.filter(
    story => String(story._id) === String(user.id)
  );

  const otherUserStories = stories.filter(
    story => String(story._id) !== String(user.id)
  );

  res.status(200).json({
    success: true,
    data: {
      currentUserStories,
      otherUserStories
    }
  });
});

/**
 * @route GET /api/story/user/:id
 * @desc Fetch stories of a user
 * @secure true
 */
export const getUserStories = catchAsync(async (req, res, next) => {
  const user = req.user;
  const userId = req.params.id;
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

  const story = await Story.aggregate([
    { $match: { user: new mongoose.Types.ObjectId(userId) } },
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
        from: 'storyviews',
        let: { story: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$story', '$$story'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(user.id)] }
                ]
              }
            }
          }
        ],
        as: 'isViewed'
      }
    },
    {
      $addFields: {
        isViewed: { $gt: [{ $size: '$isViewed' }, 0] }
      }
    },
    {
      $group: {
        _id: '$user._id',
        username: { $first: '$user.username' },
        name: { $first: '$user.name' },
        avatar: { $first: '$user.avatar' },
        stories: { $push: '$$ROOT' }
      }
    },
    {
      $addFields: {
        hasPending: { $not: { $allElementsTrue: ['$stories.isViewed'] } }
      }
    },
    {
      $project: {
        _id: 1,
        name: 1,
        username: 1,
        avatar: 1,
        'stories._id': 1,
        'stories.asset': 1,
        'stories.createdAt': 1,
        'stories.isViewed': 1,
        hasPending: 1
      }
    }
  ]);

  res.status(200).json({ success: true, data: story[0] ?? null });
});

/**
 * @route POST /api/story/view/:id
 * @desc Let a user view a story
 * @secure true
 */
export const viewStory = catchAsync(async (req, res, next) => {
  const storyId = req.params.id;
  const user = req.user;
  const session = await mongoose.startSession();
  session.startTransaction();

  const story = await Story.findById(storyId).populate<{ user: UserType }>(
    'user'
  );

  // Check if story exists
  if (!story) {
    next(new ErrorResponse('Story not found', 404));
    return;
  }

  // Owner views story
  if (story.user._id.toString() == user.id) {
    res.status(200).json({ success: true, message: 'Story viewed' });
    return;
  }

  if (story.user.isPrivateAccount && story.user.id !== user.id) {
    const isFollowing = await UserFollows.exists({
      follower: user.id,
      followee: story.user.id,
      type: UserFollowsTypeEnum.following
    });

    // Deny access if account is private and user not following them
    if (!isFollowing) {
      next(new ErrorResponse('Unauthorized Access', 401));
      return;
    }
  }

  try {
    await StoryViews.create({ story: storyId, user });
    await Story.findByIdAndUpdate(storyId, { $inc: { viewCount: 1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
    return;
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Story viewed' });
});

/**
 * @route POST /api/story/viewers/:id
 * @desc Let a user fetch viewers for a story
 * @secure true
 */
export const getViewers = catchAsync(async (req, res, next) => {
  const storyId = req.params.id;
  const story = await Story.findById(storyId);
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  // Check if story exists
  if (!story) {
    next(new ErrorResponse('Story not found', 404));
    return;
  }

  // Check for ownership
  if (story.user != user.id) {
    next(new ErrorResponse('Unauthorized Access', 401));
    return;
  }

  const viewers = await StoryViews.find({ story })
    .populate('user', 'id avatar name username')
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  const transformedViewers = viewers.map(elem => elem.user);
  res.status(200).json({ success: true, data: transformedViewers });
});

/**
 * @route POST /api/story/
 * @desc Let a user create a story
 * @secure true
 */
export const createStory = catchAsync(async (req, res, next) => {
  const form = formidable();
  const user = req.user;
  const [, files] = await form.parse(req);

  const file = files.file?.at(0);

  if (file === undefined) {
    next(
      new ErrorResponse(
        'Please add at least one photo or video to create a post',
        400
      )
    );

    return;
  }

  const uniqueId = uuidv4();

  // Copy file to directory
  const regex = file.originalFilename?.match(/\.[^/]+$/);
  const ext = regex != null ? regex[0] : '';
  const assetType = ['.jpg', '.jpeg'].includes(ext) ? 'image' : 'video';
  const newFilename = `${file.newFilename}${ext}`;

  await functions.moveFromTemp(
    file,
    `../public/story/${uniqueId}`,
    newFilename
  );

  // Generate Thumbnail
  if (assetType === 'video') {
    await ffmpeg(
      path.join(__dirname, '../', 'public/story', `${uniqueId}/${newFilename}`)
    ).thumbnail({
      timestamps: ['50%'],
      filename: path
        .join(__dirname, '../', 'public/story', `${uniqueId}/${newFilename}`)
        .replace('.mp4', '.jpg'),
      size: '500x500'
    });
  }

  await Story.create({
    user,
    asset: { assetType, url: `${uniqueId}/${newFilename}` }
  });

  res.status(201).json({
    success: true,
    message: 'Your story has been sucessfully uploaded'
  });
});

/**
 * @route DELETE /api/story/:id
 * @desc Let a user delete a story
 * @secure true
 */
export const deleteStory = catchAsync(async (req, res, next) => {
  const storyId = req.params.id;
  const user = req.user;
  const story = await Story.findById(storyId);

  // Check if exists
  if (!story) {
    next(new ErrorResponse('Story not found', 404));
    return;
  }

  const dirPath = story?.asset.url.split('/')[0];

  // Check for ownership
  if (story.user != user.id) {
    next(new ErrorResponse('Unauthorized Access', 401));
    return;
  }

  await Story.findByIdAndDelete(storyId);

  await rm(path.join(__dirname, `../public/story/${dirPath}`), {
    recursive: true,
    force: true
  });

  res.status(200).json({
    success: true,
    message: 'Story deleted successfully'
  });
});
