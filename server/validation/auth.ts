import { z } from 'zod';

export const login = z.object({
  body: z.object({
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email'),
    password: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters'),
    fcmToken: z.string().optional().nullable()
  })
});

export const register = z.object({
  body: z.object({
    name: z
      .string({ required_error: 'Name is required' })
      .max(30, 'Name must not be greater than 30 characters'),
    avatar: z.string().optional().nullable(),
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email'),
    password: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters'),
    phone: z.string({ required_error: 'Phone is required' }),
    fcmToken: z.string().optional().nullable()
  })
});

export const updateDetails = z.object({
  body: z.object({
    name: z
      .string({ required_error: 'Name is required' })
      .max(30, 'Name must not be greater than 30 characters'),
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email'),
    phone: z.string({ required_error: 'Phone is required' })
  })
});

export const updatePassword = z.object({
  body: z.object({
    currentPassword: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters'),
    newPassword: z
      .string({ required_error: 'Confirm Password is required' })
      .min(6, 'Password must contain atleast 6 characters')
  })
});

export const forgotPassword = z.object({
  body: z.object({
    email: z
      .string({ required_error: 'Email is required' })
      .email('Not a valid email')
  })
});

export const resetPassword = z.object({
  body: z.object({
    token: z.string({ required_error: 'Token is required' }),
    password: z
      .string({ required_error: 'Password is required' })
      .min(6, 'Password must contain atleast 6 characters')
  })
});
