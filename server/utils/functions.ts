import formidable from 'formidable';
import mv from 'mv';
import path from 'path';

const generateSixDigitRandomNumber = (): number => {
  return Math.floor(Math.random() * 900000) + 100000;
};

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
