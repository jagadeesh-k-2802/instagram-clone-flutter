import mongoose from 'mongoose';
import { PostLikes } from './PostLikes';
import { PostSaves } from './PostSaves';
import { Comment } from './Comment';
import { CommentLikes } from './CommentLikes';

interface AssetItem {
  assetType: string;
  url: string;
}

interface Post {
  caption: string;
  assets: mongoose.Types.ArraySubdocument<AssetItem>;
  taggedUsers: mongoose.Types.Array<mongoose.ObjectId>;
  user: mongoose.ObjectId;
  likeCount: number;
  commentCount: number;
  createdAt: Date;
  updatedAt: Date;
}

const assetSchema = new mongoose.Schema<AssetItem>({
  assetType: { type: String, enum: ['image', 'video'] },
  url: { type: String }
});

const schema = new mongoose.Schema<Post>(
  {
    caption: {
      type: String,
      maxlength: [350, 'Caption should not exceed 350 characters']
    },
    likeCount: {
      type: Number,
      default: 0
    },
    commentCount: {
      type: Number,
      default: 0
    },
    assets: [assetSchema],
    taggedUsers: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

// Cascade delete
schema.pre('findOneAndDelete', async function (next) {
  const id = this.getQuery()._id;
  await PostLikes.deleteMany({ post: id });
  await PostSaves.deleteMany({ post: id });
  const commentIds = await Comment.find({ post: id }).select('id');
  await Comment.deleteMany({ post: id });

  for await (const comment of commentIds) {
    await CommentLikes.deleteMany({ comment: comment._id });
  }

  next();
});

const Post = mongoose.model<Post>('Post', schema);
type PostType = mongoose.HydratedDocument<Post>;

export { PostType, AssetItem as AssetType, Post };
