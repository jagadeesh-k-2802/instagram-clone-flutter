import mongoose from 'mongoose';

enum NotificationTypeEnum {
  info = 'info',
  followRequest = 'follow-request'
}

interface NotificationData {
  user?: mongoose.Schema.Types.ObjectId;
  post?: mongoose.Schema.Types.ObjectId;
}

interface Notification {
  content: string;
  user: mongoose.ObjectId;
  data: NotificationData;
  isRead: boolean;
  type: NotificationTypeEnum;
  createdAt: Date;
  updatedAt: Date;
}

const dataSchema = new mongoose.Schema<NotificationData>({
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: false },
  post: { type: mongoose.Schema.Types.ObjectId, ref: 'Post', required: false }
});

const schema = new mongoose.Schema<Notification>(
  {
    content: { type: String, required: true, maxlength: 100 },
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    data: { type: dataSchema, required: false },
    isRead: { type: Boolean, default: false },
    type: { type: String, enum: Object.values(NotificationTypeEnum) }
  },
  { toJSON: { virtuals: true }, timestamps: true }
);

const Notification = mongoose.model<Notification>('Notification', schema);
type NotificationType = mongoose.HydratedDocument<Notification>;

export { NotificationType, Notification, NotificationTypeEnum };
