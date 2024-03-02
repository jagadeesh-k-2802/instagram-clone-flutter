import mongoose from 'mongoose';

interface StoryViews {
  user: mongoose.ObjectId;
  story: mongoose.ObjectId;
  createdAt: Date;
  expireAt: Date;
}

const schema = new mongoose.Schema<StoryViews>(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    story: { type: mongoose.Schema.Types.ObjectId, ref: 'Story' },
    createdAt: { type: Date, default: Date.now },
    expireAt: { type: Date, default: Date.now, expires: 24 * 60 * 60 }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ user: 1, story: 1 }, { unique: true });

const StoryViews = mongoose.model<StoryViews>('StoryViews', schema);
type StoryViewsType = mongoose.HydratedDocument<StoryViews>;

export { StoryViewsType, StoryViews };
