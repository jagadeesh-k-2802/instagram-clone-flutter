import mongoose from 'mongoose';
import { Comment } from '@models/Comment';
import { Post } from '@models/Post';
import catchAsync from '@utils/catchAsync';
import ErrorResponse from '@utils/errorResponse';
import { zParse } from '@validation/index';
import * as commentValidation from '@validation/comment';
import { CommentLikes } from '@models/CommentLikes';

/**
 * @route GET /api/comment/:id
 * @desc fetch comments of a post
 * @secure true
 */
export const getCommentsForPost = catchAsync(async (req, res) => {
  const postId = req.params.postId;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

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
    {
      $lookup: {
        from: 'commentlikes',
        let: { commentId: '$_id' },
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: ['$commentId', '$$commentId'] },
                  { $eq: ['$userId', new mongoose.Types.ObjectId(req.user.id)] }
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

  // TODO: Send Push Notification

  try {
    await Comment.create({ comment, user, post: postId });
    await Post.findByIdAndUpdate(postId, { $inc: { commentCount: 1 } });
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

  if (!comment) {
    next(new ErrorResponse('Comment not found', 404));
    return;
  }

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

  // TODO: Send Push Notification

  try {
    await CommentLikes.create({ userId: user.id, commentId });
    await Comment.findByIdAndUpdate(commentId, { $inc: { likeCount: 1 } });
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
 * @route POST /api/comment/unlike/:id
 * @desc let a user unlike a comment
 * @secure true
 */
export const unLikeComment = catchAsync(async (req, res, next) => {
  const user = req.user;
  const commentId = req.params.id;
  const session = await mongoose.startSession();
  session.startTransaction();

  // TODO: Send Push Notification

  try {
    await CommentLikes.deleteOne({ userId: user.id, commentId });
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
