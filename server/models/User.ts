import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { TokenInterface } from '../middlewares/auth';
import { generateSixDigitRandomNumber } from '../utils/functions';

interface IUser {
  name: string;
  username: string;
  avatar: string;
  email: string;
  gender: string;
  bio: string;
  phone: string;
  password?: string;
  address: string;
  fcmToken: string;
  resetPasswordToken?: string;
  resetPasswordExpire?: Date;
  createdAt: Date;
}

interface IUserMethods {
  getSignedJwtToken(): string;
  matchPassword(enteredPassword: string): Promise<boolean>;
  getResetPasswordToken(): string;
}

type UserModel = mongoose.Model<IUser, object, IUserMethods>;

const schema = new mongoose.Schema<IUser, UserModel, IUserMethods>(
  {
    name: {
      type: String,
      required: [true, 'Name is required'],
      maxlength: [20, 'Name should not exceed 16 characters']
    },
    username: {
      type: String,
      required: [true, 'Name is required'],
      maxlength: [20, 'Name should not exceed 16 characters'],
      unique: true
    },
    avatar: {
      type: String,
      default: 'default-profile.png'
    },
    email: {
      type: String,
      required: [true, 'Please add an Email'],
      unique: true
    },
    gender: {
      type: String,
      required: [true, 'Please add gender'],
      enum: ['Male', 'Female']
    },
    bio: {
      type: String,
      default: '',
      maxlength: 150
    },
    phone: {
      type: String,
      unique: true
    },
    password: {
      type: String,
      required: [true, 'Please add a Password'],
      minlength: 6,
      select: false
    },
    fcmToken: {
      type: String
    },
    resetPasswordToken: String,
    resetPasswordExpire: Date,
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

// Hash password using bcrypt before saving
schema.pre('save', async function (next) {
  if (!this.isModified('password')) {
    next();
  }

  const salt = await bcrypt.genSalt(10);

  if (this.password !== undefined) {
    this.password = await bcrypt.hash(this.password, salt);
  }
});

// Sign And Return JWT
schema.method('getSignedJwtToken', function () {
  return jwt.sign(
    { id: this._id.toString() } as TokenInterface,
    process.env.JWT_SECRET,
    {
      expiresIn: process.env.JWT_EXPIRE
    }
  );
});

// Match user entered password to hashed password in database
schema.method('matchPassword', async function (enteredPassword: string) {
  if (this.password !== undefined) {
    return await bcrypt.compare(enteredPassword, this.password);
  }
});

// Generate and hash password token
schema.method('getResetPasswordToken', function (): string {
  const resetToken = generateSixDigitRandomNumber().toString();
  this.resetPasswordToken = resetToken;
  // Set expire for 10 mins
  this.resetPasswordExpire = new Date(Date.now() + 10 * 60 * 1000);
  return resetToken;
});

const User = mongoose.model<IUser, UserModel>('User', schema);
type UserType = mongoose.HydratedDocument<IUser, IUserMethods>;

export { UserType, User };
