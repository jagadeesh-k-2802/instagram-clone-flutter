import { z, AnyZodObject } from 'zod';

/**
 * Parse a object with given validation schema
 */
export async function zParse<T extends AnyZodObject>(
  schema: T,
  object: object
): Promise<z.infer<T>> {
  return schema.parseAsync(object);
}
