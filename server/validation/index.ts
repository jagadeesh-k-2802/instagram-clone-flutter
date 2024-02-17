import { z, AnyZodObject } from 'zod';

export async function zParse<T extends AnyZodObject>(
  schema: T,
  object: object
): Promise<z.infer<T>> {
  return schema.parseAsync(object);
}
