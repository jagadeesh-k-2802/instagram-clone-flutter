import mongoose from 'mongoose';

enum UserFollowsTypeEnum {
  following = 'following',
  requested = 'requested'
}

interface UserFollows {
  follower: mongoose.ObjectId;
  followee: mongoose.ObjectId;
  type: UserFollowsTypeEnum;
  createdAt: Date;
}

const schema = new mongoose.Schema<UserFollows>(
  {
    follower: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    followee: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    type: { type: String, enum: Object.values(UserFollowsTypeEnum) },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

schema.index({ follower: 1, followee: 1 }, { unique: true });

const UserFollows = mongoose.model<UserFollows>('UserFollows', schema);
type UserFollowsType = mongoose.HydratedDocument<UserFollows>;

export { UserFollowsType, UserFollows, UserFollowsTypeEnum };
