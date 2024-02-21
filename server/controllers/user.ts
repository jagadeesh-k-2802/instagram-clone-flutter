import { User } from '@models/User';
import catchAsync from '@utils/catchAsync';

/**
 * @route GET /api/user/search
 * @desc Fetch users
 * @secure true
 */
export const searchUsers = catchAsync(async (req, res) => {
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const search = req.query.search || undefined;
  const skip = (page - 1) * limit;
  const user = req.user;

  // Don't return any results if search string is empty
  if (search === undefined) {
    res.status(200).json({ success: true, data: [] });
    return;
  }

  const filter = {
    _id: { $ne: user.id },
    $or: [
      { name: { $regex: search, $options: 'i' } },
      { username: { $regex: search, $options: 'i' } }
    ]
  };

  const users = await User.find(filter, 'name username avatar')
    .skip(skip)
    .limit(limit);

  res.status(200).json({
    success: true,
    data: users
  });
});
