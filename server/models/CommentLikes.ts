import mongoose from 'mongoose';

interface CommentLikes {
  userId: mongoose.ObjectId;
  commentId: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<CommentLikes>(
  {
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    commentId: { type: mongoose.Schema.Types.ObjectId, ref: 'Comment' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ userId: 1, commentId: 1 }, { unique: true });

const CommentLikes = mongoose.model<CommentLikes>('CommentLikes', schema);
type CommentLikesType = mongoose.HydratedDocument<CommentLikes>;

export { CommentLikesType, CommentLikes };
