import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/redux/global_state.dart';
import 'package:instagram_clone/services/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final user = await AuthService.getMe();
        store.dispatch(SetUserAction(user.data));
        if (!mounted) return;
        context.goNamed('home');
      } catch (error) {
        context.goNamed('login');
      } finally {
        FlutterNativeSplash.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: null);
  }
}
