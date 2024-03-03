import express from 'express';
import * as storyController from '@controllers/story';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/feed-stories', protect, storyController.getFeedStories);
router.get('/user/:id', protect, storyController.getUserStories);
router.post('/', protect, storyController.createStory);
router.post('/view/:id', protect, storyController.viewStory);
router.get('/viewers/:id', protect, storyController.getViewers);
router.delete('/:id', protect, storyController.deleteStory);

export default router;
