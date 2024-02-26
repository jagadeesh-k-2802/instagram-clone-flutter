import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/router/transitions.dart';
import 'package:instagram_clone/screens/auth/change_password.dart';
import 'package:instagram_clone/screens/profile/account_privacy_screen.dart';
import 'package:instagram_clone/screens/profile/follow_detail_screen.dart';
import 'package:instagram_clone/screens/profile/liked_posts_screen.dart';
import 'package:instagram_clone/screens/profile/saved_posts_screen.dart';
import 'package:instagram_clone/screens/profile/public_profile_screen.dart';
import 'package:instagram_clone/screens/search/search_detail_screen.dart';
import 'package:instagram_clone/screens/story/new_story_screen.dart';
import 'package:instagram_clone/screens/home/notifications_screen.dart';
import 'package:instagram_clone/screens/home/feed_screen.dart';
import 'package:instagram_clone/screens/home/message_screen.dart';
import 'package:instagram_clone/screens/post/new_post_screen.dart';
import 'package:instagram_clone/screens/post/post_upload_screen.dart';
import 'package:instagram_clone/screens/profile/profile_edit_screen.dart';
import 'package:instagram_clone/screens/profile/profile_screen.dart';
import 'package:instagram_clone/screens/search/search_screen.dart';
import 'package:instagram_clone/screens/home/settings_screen.dart';
import 'package:instagram_clone/screens/story/story_capture_screen.dart';
import 'package:instagram_clone/screens/post/tag_people_screen.dart';
import 'package:instagram_clone/screens/splash_screen.dart';
import 'package:instagram_clone/screens/auth/login_screen.dart';
import 'package:instagram_clone/screens/auth/signup_screen.dart';
import 'package:instagram_clone/screens/auth/forgot_password_screen.dart';
import 'package:instagram_clone/screens/home/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final List<RouteBase> _routes = [
  GoRoute(
    name: Routes.splash,
    path: '/${Routes.splash}',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    name: Routes.login,
    path: '/${Routes.login}',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: Routes.signup,
    path: '/${Routes.signup}',
    builder: (context, state) => const SignupScreen(),
  ),
  GoRoute(
    name: Routes.forgotPassword,
    path: '/${Routes.forgotPassword}',
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    name: Routes.changePassword,
    path: '/${Routes.changePassword}',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: ChangePasswordScreen(),
    ),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return HomeScreen(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.feed,
            path: '/feed',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FeedScreen(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.search,
            path: '/${Routes.search}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          GoRoute(
            name: Routes.searchDetail,
            path: '/${Routes.searchDetail}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchDetailScreen(),
            ),
          ),
          GoRoute(
            name: Routes.publicProfilePath(''),
            path: Routes.publicProfilePath(':id'),
            pageBuilder: (context, state) => NoTransitionPage(
              child: PublicProfileScreen(
                profileId: state.pathParameters['id'],
                onFollowChange: state.extra,
              ),
            ),
          ),
          GoRoute(
            name: Routes.followDetail,
            path: '/${Routes.followDetail}',
            pageBuilder: (context, state) => NoTransitionPage(
              child: FollowDetailScreen(args: state.extra),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.notifications,
            path: '/${Routes.notifications}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: NotificationsScreen(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: Routes.profile,
            path: '/${Routes.profile}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
          GoRoute(
            name: Routes.likedPosts,
            path: '/${Routes.likedPosts}',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: LikedPostsScreen(),
            ),
          ),
          GoRoute(
            name: Routes.savedPosts,
            path: '/${Routes.savedPosts}',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: SavedPostsScreen(),
            ),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    name: Routes.message,
    path: '/${Routes.message}',
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return LeftSlideTransition(animation: animation, child: child);
      },
      child: const MessageScreen(),
    ),
  ),
  GoRoute(
    name: Routes.newPost,
    path: '/${Routes.newPost}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: NewPostScreen(),
    ),
  ),
  GoRoute(
    name: Routes.postUpload,
    path: '/${Routes.postUpload}',
    pageBuilder: (context, state) => NoTransitionPage(
      child: PostUploadScreen(data: state.extra),
    ),
  ),
  GoRoute(
    name: Routes.tagPeople,
    path: '/${Routes.tagPeople}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: TagPeopleScreen(),
    ),
  ),
  GoRoute(
    name: Routes.newStory,
    path: '/${Routes.newStory}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: NewStoryScreen(),
    ),
  ),
  GoRoute(
    name: Routes.storyCapture,
    path: '/${Routes.storyCapture}',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: StoryCaptureScreen(),
    ),
  ),
  GoRoute(
    name: Routes.profileEdit,
    path: '/${Routes.profileEdit}',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: ProfileEditScreen(),
    ),
  ),
  GoRoute(
    name: Routes.settings,
    path: '/${Routes.settings}',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: SettingsScreen(),
    ),
  ),
  GoRoute(
    name: Routes.accountPrivacy,
    path: '/${Routes.accountPrivacy}',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: AccountPrivacyScreen(),
    ),
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  routes: _routes,
);
