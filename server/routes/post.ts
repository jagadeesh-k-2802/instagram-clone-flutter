import express from 'express';
import * as postController from '@controllers/post';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/feed-posts', protect, postController.getFeedPosts);
router.get('/explore-posts', protect, postController.getExplorePosts);
router.post('/like/:id', protect, postController.likePost);
router.post('/unlike/:id', protect, postController.unLikePost);
router.post('/save/:id', protect, postController.savePost);
router.post('/unsave/:id', protect, postController.unSavePost);
router.delete('/delete/:id', protect, postController.deletePost);
router.get('/liked-posts', protect, postController.getLikedPosts);
router.get('/saved-posts', protect, postController.getSavedPosts);
router.get('/:id', protect, postController.getPost);
router.get('/likes/:id', protect, postController.getLikedUsersForPost);
router.post('/', protect, postController.createPost);

export default router;
