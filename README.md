# Instagram Clone 📸

Instagram Clone Mobile Application built with Flutter, Node.js, Express.js, MongoDB

## Technologies ⚙️

- Flutter (Riverpod, GoRouter, Dio, Freezed, Firebase)
- Node.js (TypeScript, Express, Mongoose, FFmpeg)
- MongoDB

## Features 📲

- User authentication system like login, signup and forgot password
- Upload posts with multiple images and videos
- Post image or video can be selected from device gallery
- Tag other people in posts
- Users can like, save posts
- Users can see other profiles with their posts and their tagged posts
- Users can comment on posts
- Users can like a comment
- Users can share post to other users
- Users can view complete history of liked and saved posts
- Users can follow other users
- Users can see their followers & following list
- Users can remove follower
- Users can upload stories with gallery images or device camera
- Private account feature can protect privacy of user by hiding their posts
- Follow will be sent as request to private accounts
- Push notifications using FCM
- Realtime messaging with Stream SDK

## Running The Application 🧑🏻‍💻

- `git clone https://github.com/jagadeesh-k-2802/instagram-clone-flutter`
- `cd server && npm i`
- Configure all required environment variables in `server/config/config.env.example`
- Remove .example from the filename it should be `config.env
- Install MongoDB Locally on Your System or use Cloud hosted connection string
- Download Firebase Admin Private Key JSON file and rename it it to `firebase-admin.json`
- Place the JSON file inside server/config/
- `npm run dev` to start the node server
- `dart pub global activate flutterfire_cli` Install flutterfire CLI
- `npm install -g firebase-tools` Install firebase CLI using NPM
- `cd mobile && flutterfire configure` Configure firebase using your own firebase project
- Place your stream sdk api key in `./mobile/config/env.example.json`
- open `./mobile` inside your code editor and run flutter app with the environment json file

## Database Schema 💾

<img src="./images/db_schema.jpg" width="500" />

## Screenshots 📷

<img src="./images/login.png" width="250" />
<img src="./images/signup.png" width="250" />
<img src="./images/forgot_password.png" width="250" />
<br />
<img src="./images/feed.png" width="250" />
<img src="./images/story_detail.png" width="250" />
<img src="./images/messages.png" width="250" />
<br />
<img src="./images/message_detail.png" width="250" />
<img src="./images/explore.png" width="250" />
<img src="./images/search.png" width="250" />
<br />
<img src="./images/tagged_users.png" width="250" />
<img src="./images/comments.png" width="250" />
<img src="./images/share_post.png" width="250" />
<br />
<img src="./images/post_upload.png" width="250" />
<img src="./images/post_uploading.png" width="250" />
<img src="./images/story_upload.png" width="250" />
<br />
<img src="./images/notifications.png" width="250" />
<img src="./images/profile.png" width="250" />
<img src="./images/followers.png" width="250" />
<br />
<img src="./images/liked_posts.png" width="250" />
<img src="./images/saved_posts.png" width="250" />
<img src="./images/settings.png" width="250" />
<br />
<img src="./images/change_password.png" width="250" />
<img src="./images/private_account.png" width="250" />
