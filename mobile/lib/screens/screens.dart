import 'package:go_router/go_router.dart';
import 'package:instagram_clone/screens/auth/forgot_password_screen.dart';
import 'package:instagram_clone/screens/auth/login_screen.dart';
import 'package:instagram_clone/screens/auth/signup_screen.dart';
import 'package:instagram_clone/screens/splash_screen.dart';

final List<GoRoute> routes = [
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
];

final GoRouter router = GoRouter(initialLocation: '/', routes: routes);
