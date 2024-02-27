import mongoose from 'mongoose';

interface Confirmation {
  code: string;
  email: string;
  expireAt: Date;
  createdAt: Date;
}

type ConfirmationModel = mongoose.Model<Confirmation, object, object>;

const schema = new mongoose.Schema<Confirmation, ConfirmationModel, object>(
  {
    code: String,
    email: String,
    expireAt: { type: Date, default: Date.now, expires: 600 },
    createdAt: { type: Date, default: Date.now }
  },
  { toJSON: { virtuals: true } }
);

const Confirmation = mongoose.model<Confirmation, ConfirmationModel>(
  'Confirmation',
  schema
);

type ConfirmationType = mongoose.HydratedDocument<Confirmation, object>;
export { ConfirmationType, Confirmation };
