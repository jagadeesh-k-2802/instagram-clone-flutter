import express from 'express';
import * as postController from '@controllers/post';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/my-posts', protect, postController.getUserPosts);
router.get('/tagged-posts', protect, postController.getUserTaggedPosts);
router.get('/feed-posts', protect, postController.getFeedPosts);
router.post('/like/:id', protect, postController.likePost);
router.post('/unlike/:id', protect, postController.unLikePost);
router.post('/save/:id', protect, postController.savePost);
router.post('/unsave/:id', protect, postController.unSavePost);
router.post('/', protect, postController.createPost);

export default router;
