import mongoose from 'mongoose';

interface AssetItem {
  assetType: string;
  url: string;
}

interface Post {
  caption: string;
  assets: mongoose.Types.ArraySubdocument<AssetItem>;
  tagged: mongoose.Types.Array<mongoose.ObjectId>;
  user: mongoose.ObjectId;
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
      required: [true, 'Caption is required'],
      maxlength: [350, 'Caption should not exceed 350 characters']
    },
    assets: assetSchema,
    tagged: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const Post = mongoose.model<Post>('Post', schema);
type PostType = mongoose.HydratedDocument<Post>;

export { PostType, Post };
