import mongoose from 'mongoose';

interface IConfirmation {
  code: string;
  email: string;
  expireAt: Date;
  createdAt: Date;
}

type ConfirmationModel = mongoose.Model<IConfirmation, object, object>;

const schema = new mongoose.Schema<IConfirmation, ConfirmationModel, object>(
  {
    code: String,
    email: String,
    expireAt: { type: Date, default: Date.now, expires: 600 },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

const Confirmation = mongoose.model<IConfirmation, ConfirmationModel>(
  'Confirmation',
  schema
);

type ConfirmationType = mongoose.HydratedDocument<IConfirmation, object>;
export { ConfirmationType, Confirmation };
