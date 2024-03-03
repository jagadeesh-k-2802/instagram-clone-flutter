import { Notification } from '@models/Notification';
import catchAsync from '@utils/catchAsync';

/**
 * @route GET /api/notification
 * @desc Get all notifications for the user
 * @secure true
 */
export const getNotifications = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  // Set 'isRead' to true
  await Notification.updateMany({ user }, { isRead: true })
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  const notifications = await Notification.find({ user })
    .skip(skip)
    .limit(limit)
    .select('id content data type createdAt updatedAt')
    .populate('data.user', 'id avatar name username')
    .sort({ createdAt: -1 });

  res.status(200).json({ success: true, data: notifications });
});
