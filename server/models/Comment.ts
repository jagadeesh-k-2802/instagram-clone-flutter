import mongoose from 'mongoose';

interface Comment {
  comment: string;
  likeCount: number;
  user: mongoose.ObjectId;
  post: mongoose.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

const schema = new mongoose.Schema<Comment>(
  {
    comment: {
      type: String,
      maxlength: [350, 'Comment should not exceed 300 characters']
    },
    likeCount: {
      type: Number,
      default: 0
    },
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    post: { type: mongoose.Schema.Types.ObjectId, ref: 'Post' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const Comment = mongoose.model<Comment>('Comment', schema);
type CommentType = mongoose.HydratedDocument<Comment>;

export { CommentType, Comment };
