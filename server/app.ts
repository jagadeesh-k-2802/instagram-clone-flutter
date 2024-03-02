import express from 'express';
import path from 'path';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';
import errorHandler from '@middlewares/error';
import authRoutes from '@routes/auth';
import userRoutes from '@routes/user';
import postRoutes from '@routes/post';
import storyRoutes from '@routes/story';
import commentRoutes from '@routes/comment';
import notificationRoutes from '@routes/notification';

const app = express();

// Middlewares
app.use(morgan('dev'));
app.use(express.json({ limit: '10kb' }));
app.use(express.static(path.join(__dirname, 'public')));

if (process.env.NODE_ENV === 'production') {
  app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100 }));
}

// Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/user', userRoutes);
app.use('/api/v1/post', postRoutes);
app.use('/api/v1/story', storyRoutes);
app.use('/api/v1/comment', commentRoutes);
app.use('/api/v1/notification', notificationRoutes);

// Error Handler
app.use(errorHandler);

export default app;
