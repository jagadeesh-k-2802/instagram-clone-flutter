import express from 'express';
import path from 'path';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';
import errorHandler from '@middlewares/error';
import authRoutes from '@routes/auth';
import userRoutes from '@routes/user';
import postRoutes from '@routes/post';
import commentRoutes from '@routes/comment';

const app = express();

// Middlewares
app.use(morgan('dev'));
app.use(express.json({ limit: '10kb' }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100 }));

// Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/user', userRoutes);
app.use('/api/v1/post', postRoutes);
app.use('/api/v1/comment', commentRoutes);

// Error Handler
app.use(errorHandler);

export default app;
