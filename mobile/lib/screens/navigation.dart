import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/screens/home/change_password.dart';
import 'package:instagram_clone/screens/home/new_story_screen.dart';
import 'package:instagram_clone/screens/home/notifications_screen.dart';
import 'package:instagram_clone/screens/home/feed_screen.dart';
import 'package:instagram_clone/screens/home/message_screen.dart';
import 'package:instagram_clone/screens/home/new_post_screen.dart';
import 'package:instagram_clone/screens/home/post_upload_screen.dart';
import 'package:instagram_clone/screens/home/profile_edit_screen.dart';
import 'package:instagram_clone/screens/home/profile_screen.dart';
import 'package:instagram_clone/screens/home/search_screen.dart';
import 'package:instagram_clone/screens/home/settings_screen.dart';
import 'package:instagram_clone/screens/home/story_capture_screen.dart';
import 'package:instagram_clone/screens/home/tag_people_screen.dart';
import 'package:instagram_clone/screens/splash_screen.dart';
import 'package:instagram_clone/screens/auth/login_screen.dart';
import 'package:instagram_clone/screens/auth/signup_screen.dart';
import 'package:instagram_clone/screens/auth/forgot_password_screen.dart';
import 'package:instagram_clone/screens/home/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();

final List<RouteBase> routes = [
  GoRoute(
    name: 'splash',
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: 'signup',
    path: '/signup',
    builder: (context, state) => const SignupScreen(),
  ),
  GoRoute(
    name: 'forgot-password',
    path: '/forgot-password',
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return HomeScreen(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        navigatorKey: _homeNavigatorKey,
        routes: [
          GoRoute(
            name: 'feed',
            path: '/feed',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FeedScreen(),
            ),
          ),
          GoRoute(
            name: 'search',
            path: '/search',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchScreen(),
            ),
          ),
          GoRoute(
            name: 'notifications',
            path: '/notifications',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: NotificationsScreen(),
            ),
          ),
          GoRoute(
            name: 'profile',
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    name: 'message',
    path: '/message',
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return SlideTransition(
          position: animation.drive(
            Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero).chain(
              CurveTween(curve: Curves.linear),
            ),
          ),
          child: child,
        );
      },
      child: const MessageScreen(),
    ),
  ),
  GoRoute(
    name: 'new-post',
    path: '/new-post',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: NewPostScreen(),
    ),
  ),
  GoRoute(
    name: 'post-upload',
    path: '/post-upload',
    pageBuilder: (context, state) => NoTransitionPage(
      child: PostUploadScreen(data: state.extra),
    ),
  ),
  GoRoute(
    name: 'tag-people',
    path: '/tag-people',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: TagPeopleScreen(),
    ),
  ),
  GoRoute(
    name: 'new-story',
    path: '/new-story',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: NewStoryScreen(),
    ),
  ),
  GoRoute(
    name: 'story-capture',
    path: '/story-capture',
    pageBuilder: (context, state) => const NoTransitionPage(
      child: StoryCaptureScreen(),
    ),
  ),
  GoRoute(
    name: 'profile-edit',
    path: '/profile-edit',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: ProfileEditScreen(),
    ),
  ),
  GoRoute(
    name: 'change-password',
    path: '/change-password',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: ChangePasswordScreen(),
    ),
  ),
  GoRoute(
    name: 'settings',
    path: '/settings',
    pageBuilder: (context, state) => const NoTransitionPage<void>(
      child: SettingsScreen(),
    ),
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: routes,
);
