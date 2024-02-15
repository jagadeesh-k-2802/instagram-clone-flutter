import { connect } from 'mongoose';

const connectDB = async () => {
  const conn = await connect(process.env.MONGO_URI);
  console.log(`MongoDB Connected -> ${conn.connection.host}`.cyan.underline);
};

export default connectDB;
