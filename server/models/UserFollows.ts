import mongoose from 'mongoose';

interface UserFollows {
  followerId: mongoose.ObjectId;
  followeeId: mongoose.ObjectId;
  createdAt: Date;
}

const schema = new mongoose.Schema<UserFollows>(
  {
    followerId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    followeeId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ followerId: 1, followeeId: 1 }, { unique: true });

const UserFollows = mongoose.model<UserFollows>('UserFollows', schema);
type UserFollowsType = mongoose.HydratedDocument<UserFollows>;

export { UserFollowsType, UserFollows };
