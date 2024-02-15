import express from 'express';
import path from 'path';
import morgan from 'morgan';
import errorHandler from '@middlewares/error';
import authRoutes from '@routes/auth';

const app = express();

// Middlewares
app.use(morgan('dev'));
app.use(express.json({ limit: '10kb' }));
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/api/v1/auth', authRoutes);

// Error Handler
app.use(errorHandler);

export default app;
