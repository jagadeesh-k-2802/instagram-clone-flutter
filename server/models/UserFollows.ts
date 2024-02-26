import mongoose from 'mongoose';

interface UserFollows {
  follower: mongoose.ObjectId;
  followee: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<UserFollows>(
  {
    follower: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    followee: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ follower: 1, followee: 1 }, { unique: true });

const UserFollows = mongoose.model<UserFollows>('UserFollows', schema);
type UserFollowsType = mongoose.HydratedDocument<UserFollows>;

export { UserFollowsType, UserFollows };
