import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('HomeScreenNavigationShell'));

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
