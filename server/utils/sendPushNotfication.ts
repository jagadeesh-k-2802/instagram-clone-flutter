import admin from 'firebase-admin';

admin.initializeApp({
  credential: admin.credential.cert('./config/firebase-admin.json')
});

interface PushNotificationOptions {
  title: string;
  body: string;
  tokens: Array<string>;
  data?: Record<string, string>;
}

export default async ({
  title,
  body,
  tokens,
  data = {}
}: PushNotificationOptions) => {
  try {
    await admin.messaging().sendEachForMulticast({
      notification: { title, body },
      data,
      tokens
    });
  } catch (e) {
    // Do Nothing
  }
};
