/// List of all routes in the application
/// by default it is name of route
/// if ends with 'Path' it is a path not a name
class Routes {
  static get splash => "splash";
  static get login => "login";
  static get signup => "signup";
  static get forgotPassword => "forgot-password";
  static get changePassword => "change-password";
  static get feed => "feed";
  static get search => "search";
  static get searchDetail => "search-detail";
  static publicProfilePath(String id) => "/profile/$id";
  static get followDetail => "follow-detail";
  static get notifications => "notifications";
  static get profile => "profile";
  static get message => "message";
  static get newPost => "new-post";
  static get postUpload => "post-upload";
  static get tagPeople => "tag-people";
  static get newStory => "new-story";
  static get storyCapture => "story-capture";
  static get profileEdit => "profile-edit";
  static get likedPosts => "liked-posts";
  static get savedPosts => "saved-posts";
  static get accountPrivacy => "account-privacy";
  static get settings => "settings";
}
