import express from 'express';
import * as authController from '@controllers/auth';
import { protect } from '@middlewares/auth';

const router = express.Router();

router.post('/login', authController.login);
router.post('/register', authController.register);
router.post('/valid-username', authController.verifyValidUsername);
router.post('/send-confirmation', authController.sendConfirmationCode);
router.post('/verify-confirmation', authController.verifyConfirmationCode);
router.post('/update-details', protect, authController.updateDetails);
router.post('/update-password', protect, authController.updatePassword);
router.post('/update-avatar', protect, authController.updateAvatar);
router.post('/forgot-password', authController.forgotPassword);
router.post('/verify-forgot-password', authController.verifyForgotPasswordCode);
router.post('/reset-password', authController.resetPassword);
router.get('/me', authController.getCurrentUser);
router.get('/logout', protect, authController.logout);

export default router;
