import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_localizations/stream_chat_localizations.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/router/router.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessageOpenedApp.listen(notificationHandler);
  FirebaseMessaging.instance.getInitialMessage().then(notificationHandler);
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void notificationHandler(event) {
  if (event?.notification != null) {
    navigatorKey.currentContext?.pushNamed(Routes.notifications);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamChatTheme(
      data: streamChatTheme,
      child: MaterialApp.router(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: GlobalStreamChatLocalizations.delegates,
        locale: const Locale('en'),
        routerConfig: router,
        theme: instagramAppTheme,
      ),
    );
  }
}
