import { createServer } from 'http';
import dotenv from 'dotenv';
import colors from 'colors.ts';
import app from './app';
import connectDB from './config/db';

// Config
colors?.enable();
dotenv.config({ path: './config/config.env' });
connectDB();

const PORT = process.env.PORT || 3000;
const httpServer = createServer(app);

// Express Server
const server = httpServer.listen(PORT, () => {
  console.log(`Server Running On Port -> ${PORT}`.yellow.underline);
});

// Promise rejection is taken seriously
process.on('unhandledRejection', reason => {
  console.log(`unhandledRejection ${reason}`.red);
  server.close(() => process.exit(1));
});
