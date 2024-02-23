import express from 'express';
import * as userController from '@controllers/user';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/search', protect, userController.searchUsers);
router.get('/posts/:id', protect, userController.getUserPosts);
router.get('/tagged-posts/:id', protect, userController.getUserTaggedPosts);
router.get('/:id', protect, userController.getUser);

export default router;
