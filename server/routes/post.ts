import express from 'express';
import * as postController from '@controllers/post';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.post('/', protect, postController.createPost);

export default router;
