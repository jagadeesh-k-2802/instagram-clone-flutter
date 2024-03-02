import mongoose from 'mongoose';
import { StoryViews } from './StoryViews';

interface AssetItem {
  assetType: string;
  url: string;
}

interface Story {
  assetUrl: string;
  asset: AssetItem;
  user: mongoose.ObjectId;
  viewCount: number;
  expireAt: Date;
  createdAt: Date;
  updatedAt: Date;
}

const assetSchema = new mongoose.Schema<AssetItem>({
  assetType: { type: String, enum: ['image', 'video'] },
  url: { type: String }
});

const schema = new mongoose.Schema<Story>(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    asset: assetSchema,
    viewCount: { type: Number, default: 0 },
    expireAt: { type: Date, default: Date.now, expires: 24 * 60 * 60 }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

// Cascade delete
schema.pre('findOneAndDelete', async function (next) {
  const id = this.getQuery()._id;
  await StoryViews.deleteMany({ story: id });
  next();
});

const Story = mongoose.model<Story>('Story', schema);
type StoryType = mongoose.HydratedDocument<Story>;

export { StoryType, AssetItem as AssetType, Story };
