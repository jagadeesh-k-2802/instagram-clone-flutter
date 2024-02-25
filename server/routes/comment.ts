import express from 'express';
import * as commentController from '@controllers/comment';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/:postId', protect, commentController.getCommentsForPost);
router.post('/:postId', protect, commentController.createCommentOnPost);
router.post('/like/:id', protect, commentController.likeComment);
router.post('/unlike/:id', protect, commentController.unLikeComment);
router.delete('/:id', protect, commentController.deleteComment);

export default router;
