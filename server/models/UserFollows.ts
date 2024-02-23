import mongoose from 'mongoose';

interface UserFollows {
  followerId: mongoose.ObjectId;
  followeeId: mongoose.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

const schema = new mongoose.Schema<UserFollows>(
  {
    followerId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    followeeId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const UserFollows = mongoose.model<UserFollows>('UserFollows', schema);
type UserFollowsType = mongoose.HydratedDocument<UserFollows>;

export { UserFollowsType, UserFollows };
