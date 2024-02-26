import mongoose from 'mongoose';

interface CommentLikes {
  user: mongoose.ObjectId;
  comment: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<CommentLikes>(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    comment: { type: mongoose.Schema.Types.ObjectId, ref: 'Comment' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ user: 1, comment: 1 }, { unique: true });

const CommentLikes = mongoose.model<CommentLikes>('CommentLikes', schema);
type CommentLikesType = mongoose.HydratedDocument<CommentLikes>;

export { CommentLikesType, CommentLikes };
