import express from 'express';
import * as postController from '@controllers/post';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/my-posts', protect, postController.getUserPosts);
router.get('/tagged-posts', protect, postController.getUserTaggedPosts);
router.post('/', protect, postController.createPost);

export default router;
