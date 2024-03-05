import mongoose from 'mongoose';
import { Comment } from '@models/Comment';
import { Post } from '@models/Post';
import { CommentLikes } from '@models/CommentLikes';
import { UserType } from '@models/User';
import { Notification, NotificationTypeEnum } from '@models/Notification';
import { UserFollows, UserFollowsTypeEnum } from '@models/UserFollows';
import { zParse } from '@validation/index';
import * as commentValidation from '@validation/comment';
import sendPushNotification from '@utils/sendPushNotfication';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';

/**
 * @route GET /api/comment/:id
 * @desc fetch comments of a post
 * @secure true
 */
export const getCommentsForPost = catchAsync(async (req, res, next) => {
  const postId = req.params.postId;
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;
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

  const comments = await Comment.aggregate([
    {
      $match: { post: new mongoose.Types.ObjectId(postId) }
    },
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
        from: 'commentlikes',
        let: { comment: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$comment', '$$comment'] },
                  { $eq: ['$user', new mongoose.Types.ObjectId(req.user.id)] }
                ]
              }
            }
          }
        ],
        as: 'likedByCurrentUser'
      }
    },
    {
      $addFields: {
        isLiked: { $gt: [{ $size: '$likedByCurrentUser' }, 0] }
      }
    },
    {
      $project: {
        _id: 1,
        comment: 1,
        'user._id': 1,
        'user.name': 1,
        'user.avatar': 1,
        'user.username': 1,
        likeCount: 1,
        isLiked: 1,
        createdAt: 1,
        updatedAt: 1
      }
    },
    { $skip: skip },
    { $limit: limit },
    { $sort: { createdAt: -1 } }
  ]);

  res.status(200).json({ success: true, data: comments });
});

/**
 * @route POST /api/comment/:postId
 * @desc let a user comment on a post
 * @secure true
 */
export const createCommentOnPost = catchAsync(async (req, res, next) => {
  const user = req.user;
  const postId = req.params.postId;
  const { body } = await zParse(commentValidation.createComment, req);
  const { comment } = body;
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
    await Comment.create({ comment, user, post: postId });
    await Post.findByIdAndUpdate(postId, { $inc: { commentCount: 1 } });

    // Don't send notification if owner comments on their own post
    if (user.id != post.user.id.toString()) {
      await Notification.create({
        content: `${user.username} Commented on your post '${comment}'`,
        user: post.user,
        data: { user, post },
        type: NotificationTypeEnum.info
      });

      await sendPushNotification({
        title: 'New comment on your post',
        body: `${user.username} Commented on your post '${comment}'`,
        tokens: [post.user.fcmToken]
      });
    }

    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Commented on post' });
});

/**
 * @route DELETE /api/comment/:id
 * @desc let a user delete their comment on a post
 * @secure true
 */
export const deleteComment = catchAsync(async (req, res, next) => {
  const user = req.user;
  const commentId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();
  const comment = await Comment.findById(commentId);

  // Check if comment exists actually
  if (!comment) {
    next(new ErrorResponse('Comment not found', 404));
    return;
  }

  // Check for ownership
  if (comment.user != user.id) {
    next(new ErrorResponse('Unauthorized access', 401));
    return;
  }

  try {
    await Comment.findByIdAndDelete(commentId);
    await Post.findByIdAndUpdate(comment?.post, { $inc: { commentCount: -1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(200).json({
    success: true,
    message: 'Comment deleted successfully'
  });
});

/**
 * @route POST /api/comment/like/:id
 * @desc let a user like a comment
 * @secure true
 */
export const likeComment = catchAsync(async (req, res, next) => {
  const user = req.user;
  const commentId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  const comment = await Comment.findById(commentId)
    .populate<{ user: UserType }>('user')
    .lean();

  // Check if comment exists
  if (!comment) {
    next(new ErrorResponse('Comment no found', 404));
    return;
  }

  try {
    await CommentLikes.create({ user: user.id, comment: commentId });
    await Comment.findByIdAndUpdate(commentId, { $inc: { likeCount: 1 } });
    await session.commitTransaction();

    // Don't send notification if owner likes their own comment
    if (user.id != comment.user.id.toString()) {
      await Notification.create({
        content: `${user.username} Liked your comment '${comment.comment}'`,
        user: comment.user,
        data: { user, post: comment.post },
        type: NotificationTypeEnum.info
      });

      await sendPushNotification({
        title: 'Your comment got a like',
        body: `${user.username} Commented on your post '${comment}'`,
        tokens: [comment.user.fcmToken]
      });
    }
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
 * @route POST /api/comment/unlike/:id
 * @desc let a user unlike a comment
 * @secure true
 */
export const unLikeComment = catchAsync(async (req, res, next) => {
  const user = req.user;
  const commentId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    await CommentLikes.deleteOne({ user: user.id, comment: commentId });
    await Comment.findByIdAndUpdate(commentId, { $inc: { likeCount: -1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
    return;
  } finally {
    session.endSession();
  }

  res.status(200).json({ success: true, message: 'Unlike succesful' });
});
