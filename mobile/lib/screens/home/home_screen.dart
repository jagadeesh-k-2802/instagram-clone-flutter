import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/config/env.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/notification/notification_provider.dart';
import 'package:instagram_clone/utils/stream_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('HomeScreenNavigationShell'));

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await FirebaseMessaging.instance.requestPermission(provisional: true);

      // Update state when notification recieved when on foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        ref.read(globalStateProvider.notifier).onNotification();
        ref.read(notificationsProvider.notifier).invalidate();
      });

      // Stream SDK
      if (!mounted) return;
      UserResponseData? user = ref.read(globalStateProvider).user;
      StreamChatClient client = StreamChatClient(Environment.streamApiKey);
      StreamChatSingleton singleton = StreamChatSingleton(client: client);

      await singleton.client.connectUser(
        User(
          id: user?.id ?? '',
          extraData: {
            'name': user?.name,
            'image': '$apiUrl/avatar/${user?.avatar}',
          },
        ),
        user?.streamToken ?? '',
      );
    });
  }

  void onNavigate(int index) {
    // PostNew Screen
    if (index == 2) {
      context.pushNamed(Routes.newPost);
      return;
    }

    if (index > 2) {
      index -= 1;
    }

    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onNavigate,
        currentIndex: widget.navigationShell.currentIndex >= 2
            ? widget.navigationShell.currentIndex + 1
            : widget.navigationShell.currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: SvgPicture.asset(AssetsConstants.homeFilled),
            icon: SvgPicture.asset(AssetsConstants.homeOutlined),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            activeIcon: SvgPicture.asset(AssetsConstants.searchFilled),
            icon: SvgPicture.asset(AssetsConstants.searchOutlined),
          ),
          BottomNavigationBarItem(
            label: 'PostNew',
            activeIcon: SvgPicture.asset(AssetsConstants.addSquareFilled),
            icon: SvgPicture.asset(AssetsConstants.addSquareOutlined),
          ),
          BottomNavigationBarItem(
            label: 'Activity',
            activeIcon: SvgPicture.asset(AssetsConstants.activityFilled),
            icon: (user?.unReadNotificationsCount ?? 0) > 0
                ? Badge.count(
                    count: user?.unReadNotificationsCount ?? 0,
                    child: SvgPicture.asset(AssetsConstants.activityOutlined),
                  )
                : SvgPicture.asset(AssetsConstants.activityOutlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            activeIcon: SizedBox(
              height: 28,
              width: 28,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: CircleAvatar(
                    radius: 100,
                    child: CachedNetworkImage(
                      imageUrl: '$apiUrl/avatar/${user?.avatar}',
                    ),
                  ),
                ),
              ),
            ),
            icon: SizedBox(
              height: 28,
              width: 28,
              child: ClipOval(
                child: CircleAvatar(
                  radius: 100,
                  child: CachedNetworkImage(
                    imageUrl: '$apiUrl/avatar/${user?.avatar}',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: widget.navigationShell,
    );
  }
}
