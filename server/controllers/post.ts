import { formidable } from 'formidable';
import { v4 as uuidv4 } from 'uuid';
import catchAsync from '@utils/catchAsync';
import * as postValidation from '@validation/post';
import { zParse } from '@validation/index';
import { AssetType, Post } from '@models/Post';
import * as functions from '@utils/functions';
import ErrorResponse from '@utils/errorResponse';
import { User } from '@models/User';
import mongoose from 'mongoose';

/**
 * @route GET /api/post/my-posts
 * @desc Fetch current user uploaded posts
 * @secure true
 */
export const getUserPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const posts = await Post.find({ user: user.id })
    .select('id caption assets')
    .skip(skip)
    .limit(limit)
    .exec();

  res.status(200).json({
    success: true,
    data: posts
  });
});

/**
 * @route GET /api/post/tagged-posts
 * @desc Fetch current user tagged posts
 * @secure true
 */
export const getUserTaggedPosts = catchAsync(async (req, res) => {
  const user = req.user;
  const page = parseInt(req.query.page as string) || 1;
  const limit = parseInt(req.query.limit as string) || 20;
  const skip = (page - 1) * limit;

  const posts = await Post.find({ taggedUsers: user.id })
    .select('id caption assets')
    .skip(skip)
    .limit(limit)
    .exec();

  res.status(200).json({
    success: true,
    data: posts
  });
});

/**
 * @route POST /api/post
 * @desc Let a user create a post
 * @secure true
 */
export const createPost = catchAsync(async (req, res, next) => {
  const form = formidable();
  const user = req.user;
  const [fields, files] = await form.parse(req);
  const customFields = {};

  // Transform form-data to object
  for (const [key, value] of Object.entries(fields)) {
    switch (key) {
      case 'taggedUsers':
        customFields[key] = value
          ?.at(0)
          ?.split(' ')
          .filter(x => x != '');
        break;
      default:
        customFields[key] = value?.at(0);
        break;
    }
  }

  const { caption, taggedUsers } = await zParse(
    postValidation.createPost,
    customFields
  );

  const assets: Array<AssetType> = [];

  if (files.files === undefined) {
    next(
      new ErrorResponse(
        'Please add at least one photo or video to create a post',
        400
      )
    );

    return;
  }

  const uniqueId = uuidv4();

  // Copy each file to directory
  for await (const file of files.files) {
    const regex = file.originalFilename?.match(/\.[^/]+$/);
    const ext = regex != null ? regex[0] : '';
    const assetType = ['.jpg', '.jpeg'].includes(ext) ? 'image' : 'video';
    const newFilename = `${file.newFilename}${ext}`;

    await functions.moveFromTemp(
      file,
      `../public/posts/${uniqueId}`,
      newFilename
    );

    assets.push({ assetType, url: `${uniqueId}/${newFilename}` });
  }

  const session = await mongoose.startSession();
  session.startTransaction();

  try {
    await Post.create({ caption, taggedUsers, assets, user });
    await User.findByIdAndUpdate(user.id, { $inc: { postCount: 1 } });
    await session.commitTransaction();
  } catch (error) {
    await session.abortTransaction();
    next(error);
  } finally {
    session.endSession();
  }

  res.status(201).json({
    success: true,
    message: 'Your post has been sucessfully uploaded'
  });
});
