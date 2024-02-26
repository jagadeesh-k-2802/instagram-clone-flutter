import formidable from 'formidable';
import crpyto from 'crypto';
import mv from 'mv';
import path from 'path';

/**
 * @returns Secure 6 digit random number
 */
const generateSixDigitRandomNumber = (): number => {
  return crpyto.randomInt(100000, 999999);
};

/**
 * Moves formidable file to specified path
 * @param file formidable file object uploaded by user
 * @param dir the directory where to move the file to
 * @param filename the new name of the file
 * @returns file path where the file has been moved to
 */
const moveFromTemp = async (
  file: formidable.File,
  dir: string,
  filename: string
) => {
  const dest = path.join(__dirname, dir, filename);

  mv(file.filepath, dest, { mkdirp: true }, () => {
    // Do Nothing
  });

  return dest;
};

export { generateSixDigitRandomNumber, moveFromTemp };
