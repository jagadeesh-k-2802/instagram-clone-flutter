# Instagram Clone 📸

<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/b197374d-82af-4fac-acc5-56c315603cce" width="750" />

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
- Remove `.example` from the filename it should be `config.env`
- Install MongoDB Locally on Your System or use Cloud hosted connection string
- Download Firebase Admin Private Key JSON file and rename it it to `firebase-admin.json`
- Place the JSON file inside server/config/
- `npm run dev` to start the node server
- `dart pub global activate flutterfire_cli` Install flutterfire CLI
- `npm install -g firebase-tools` Install firebase CLI using NPM
- `cd mobile && flutterfire configure` Configure firebase using your own firebase project
- Place your stream sdk api key in `./mobile/config/env.example.json`
- Run this command ```dart run build_runner build``` to generate freezed JSON model files
- open `./mobile` inside your code editor and run flutter app with the environment json file

## Database Schema 💾

<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/c0943829-be25-4818-9f0d-bcf3dd04907a" width="500" />

## Screenshots 📷

<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/0ada6226-1768-4cdb-a3a9-ba31154e2f39" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/8adbba29-f984-4c32-998e-d75fe375c5c7" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/dbeaf944-f6ba-4142-99b4-8daf93cd383a" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/c5ce11cb-4acb-480b-81c6-87d2be7b1064" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/6485977b-533b-4ed6-aac2-712a1c308fe7" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/70b2d372-d54a-43e5-82c6-ebc45c796f4a" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/cb4c846d-f821-4972-9ab8-3e6cd72cd1e7" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/9a62107f-1aea-46a7-b0f5-12872160efd2" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/a3398cba-c2a4-4d79-a073-a53986fd93ff" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/e3953453-716a-4bf2-8b32-388e7a8f4b7c" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/2e303fc0-abb6-457c-a245-2a805a2e7536" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/fcdd449e-bcdb-41ad-ad05-e6a7fe9a121a" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/0ce98431-977e-476c-932a-35b80a0bc586" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/bbdfd7e6-0edd-4918-84ed-625780c20682" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/e657d156-7c31-4130-a426-ccda920255a5" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/d9331306-99e8-421d-9129-a920ce7afd43" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/a1a4cffb-acba-4819-922d-8037b3cf4add" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/06fbd3bd-f3a2-446c-ad6f-53c424f0e159" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/dfd1300d-d0d6-41fc-bef9-379b89cd7ada" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/24dbaf50-35f7-4c5f-890f-7460d7265162" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/29ffa396-f435-4f63-9feb-25346a5e9b6c" width="250" />
<br />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/c2e4bf77-01fb-4eec-b697-2b0e84615b4a" width="250" />
<img src="https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/32c17d82-e219-47f2-b631-b726bc8bb424" width="250" />

## Screen Record 📽️

https://github.com/jagadeesh-k-2802/instagram-clone-flutter/assets/63912668/67bc255b-cb76-4a6a-96bf-63ec1e95c45b


