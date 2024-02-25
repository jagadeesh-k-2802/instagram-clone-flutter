import mongoose from 'mongoose';

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
  assetType: { type: String },
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

const Post = mongoose.model<Post>('Post', schema);
type PostType = mongoose.HydratedDocument<Post>;

export { PostType, AssetItem as AssetType, Post };
