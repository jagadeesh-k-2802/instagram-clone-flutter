const bytesToMB = (bytes: number): number => {
  return bytes / 1000000;
};

function generateSixDigitRandomNumber(): number {
  return Math.floor(Math.random() * 900000) + 100000;
}

export { bytesToMB, generateSixDigitRandomNumber };
