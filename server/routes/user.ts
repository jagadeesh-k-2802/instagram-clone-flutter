import express from 'express';
import * as userController from '@controllers/user';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/search', protect, userController.searchUsers);
router.get('/posts/:id', protect, userController.getUserPosts);
router.get('/tagged-posts/:id', protect, userController.getUserTaggedPosts);
router.post('/follow/:id', protect, userController.followUser);
router.post('/unfollow/:id', protect, userController.unFollowUser);
router.get('/followers/:id', protect, userController.getFollowers);
router.delete('/followers/:id', protect, userController.removeFollower);
router.get('/following/:id', protect, userController.getFollowing);
router.get('/:id', protect, userController.getUser);

export default router;
