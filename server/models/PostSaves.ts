import mongoose from 'mongoose';

interface PostSaves {
  userId: mongoose.ObjectId;
  postId: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<PostSaves>(
  {
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    postId: { type: mongoose.Schema.Types.ObjectId, ref: 'Post' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ userId: 1, postId: 1 }, { unique: true });

const PostSaves = mongoose.model<PostSaves>('PostSaves', schema);
type PostSavesType = mongoose.HydratedDocument<PostSaves>;

export { PostSavesType, PostSaves };
