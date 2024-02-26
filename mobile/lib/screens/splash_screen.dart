import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/services/auth.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final user = await AuthService.getMe();
        ref.read(globalStateProvider.notifier).setUser(user.data);
        if (!mounted) return;
        context.goNamed(Routes.feed);
      } catch (error) {
        context.goNamed(Routes.login);
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
