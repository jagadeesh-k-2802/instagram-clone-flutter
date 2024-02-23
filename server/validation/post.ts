import { z } from 'zod';

export const createPost = z.object({
  caption: z
    .string({ required_error: 'Caption is required' })
    .max(350, 'Caption should not be more than 350 characters.'),
  taggedUsers: z.string().array()
});
