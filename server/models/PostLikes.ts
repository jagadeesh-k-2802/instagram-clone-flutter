import mongoose from 'mongoose';

interface PostLikes {
  user: mongoose.ObjectId;
  post: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<PostLikes>(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    post: { type: mongoose.Schema.Types.ObjectId, ref: 'Post' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ user: 1, post: 1 }, { unique: true });

const PostLikes = mongoose.model<PostLikes>('PostLikes', schema);
type PostLikesType = mongoose.HydratedDocument<PostLikes>;

export { PostLikesType, PostLikes };
