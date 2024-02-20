import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/state/global_state.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  Future<void> logout() async {
    try {
      await AuthService.logout();
      ref.read(globalStateProvider.notifier).setUser(null);
      if (!mounted) return;
      context.goNamed('login');
    } catch (error) {
      // Do Nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings and Privacy')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: logout,
                    child: Text(
                      'Log Out',
                      style: textTheme.bodyLarge?.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
