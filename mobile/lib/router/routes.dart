/// List of all routes in the application
/// by default it is name of route
/// if ends with 'Path' it is a path not a name
class Routes {
  static const splash = "splash";
  static const login = "login";
  static const signup = "signup";
  static const forgotPassword = "forgot-password";
  static const changePassword = "change-password";
  static const feed = "feed";
  static const search = "search";
  static const searchDetail = "search-detail";
  static publicProfilePath(String id) => "/profile/$id";
  static postDetailPath(String id) => "/post/$id";
  static postLikeDetailPath(String id) => "/post/like/$id";
  static const followDetail = "follow-detail";
  static const notifications = "notifications";
  static const profile = "profile";
  static const message = "message";
  static messageDetailPath(String id) => "/message-detail/$id";
  static const newPost = "new-post";
  static const postUpload = "post-upload";
  static const tagPeople = "tag-people";
  static const newStory = "new-story";
  static const storyCapture = "story-capture";
  static const storyDetail = 'story-detail';
  static const storyUpload = 'story-upload';
  static const profileEdit = "profile-edit";
  static const likedPosts = "liked-posts";
  static const savedPosts = "saved-posts";
  static const accountPrivacy = "account-privacy";
  static const settings = "settings";
}
