import mongoose from 'mongoose';

interface PostLikes {
  userId: mongoose.ObjectId;
  postId: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<PostLikes>(
  {
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    postId: { type: mongoose.Schema.Types.ObjectId, ref: 'Post' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ userId: 1, postId: 1 }, { unique: true });

const PostLikes = mongoose.model<PostLikes>('PostLikes', schema);
type PostLikesType = mongoose.HydratedDocument<PostLikes>;

export { PostLikesType, PostLikes };
