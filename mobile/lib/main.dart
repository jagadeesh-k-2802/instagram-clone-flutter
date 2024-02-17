import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagram_clone/redux/global_state.dart';
import 'package:instagram_clone/screens/navigation.dart';
import 'package:instagram_clone/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: instagramAppTheme,
      ),
    );
  }
}
