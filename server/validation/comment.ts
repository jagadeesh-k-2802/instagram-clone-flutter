import { z } from 'zod';

export const createComment = z.object({
  body: z.object({
    comment: z
      .string({ required_error: 'comment is required' })
      .max(300, 'comment should not be more than 300 characters.')
  })
});
