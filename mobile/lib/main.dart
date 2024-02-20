import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/screens/navigation.dart';
import 'package:instagram_clone/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: instagramAppTheme
    );
  }
}
