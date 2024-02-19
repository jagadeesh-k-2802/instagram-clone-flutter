import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/screens/home/activity_screen.dart';
import 'package:instagram_clone/screens/home/feed_screen.dart';
import 'package:instagram_clone/screens/home/message_screen.dart';
import 'package:instagram_clone/screens/home/post_new_screen.dart';
import 'package:instagram_clone/screens/home/profile_screen.dart';
import 'package:instagram_clone/screens/home/search_screen.dart';
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
            name: 'post-new',
            path: '/post-new',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PostNewScreen(),
            ),
          ),
          GoRoute(
            name: 'activity',
            path: '/activity',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ActivityScreen(),
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
            Tween<Offset>(
              begin: const Offset(0.75, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeIn)),
          ),
          child: child,
        );
      },
      child: const MessageScreen(),
    ),
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: routes,
);
