import express from 'express';
import * as notificationController from '@controllers/notification';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.get('/', protect, notificationController.getNotifications);

export default router;
