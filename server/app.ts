import express from 'express';
import path from 'path';
import morgan from 'morgan';
import errorHandler from '@middlewares/error';
import authRoutes from '@routes/auth';
import userRoutes from '@routes/user';

const app = express();

// Middlewares
app.use(morgan('dev'));
app.use(express.json({ limit: '10kb' }));
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/user', userRoutes);

// Error Handler
app.use(errorHandler);

export default app;
