import mongoose from 'mongoose';

interface PostSaves {
  user: mongoose.ObjectId;
  post: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<PostSaves>(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    post: { type: mongoose.Schema.Types.ObjectId, ref: 'Post' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ user: 1, post: 1 }, { unique: true });

const PostSaves = mongoose.model<PostSaves>('PostSaves', schema);
type PostSavesType = mongoose.HydratedDocument<PostSaves>;

export { PostSavesType, PostSaves };
