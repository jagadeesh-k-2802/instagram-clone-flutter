declare global {
  namespace NodeJS {
    interface ProcessEnv {
      MONGO_URI: string;
      NODE_ENV: 'development' | 'production';
      PORT?: number;

      JWT_SECRET: string;
      JWT_EXPIRE: string;

      EMAIL_USERNAME: string;
      EMAIL_PASSWORD: string;
      EMAIL_HOST: string;
      EMAIL_PORT: number;

      SENDGRID_USERNAME: string;
      SENDGRID_PASSWORD: string;
    }
  }
}

export {};
