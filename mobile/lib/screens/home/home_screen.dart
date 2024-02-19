import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/redux/global_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentIndex = 0;

  void onNavigate(int selectedIndex) {
    setState(() => currentIndex = selectedIndex);

    switch (selectedIndex) {
      case 0:
        context.pushNamed('feed');
        break;
      case 1:
        context.pushNamed('search');
        break;
      case 2:
        context.pushNamed('post-new');
        break;
      case 3:
        context.pushNamed('activity');
        break;
      case 4:
        context.pushNamed('profile');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.read(appStateProvider);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onNavigate,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? SvgPicture.asset('assets/icons/home-filled.svg')
                : SvgPicture.asset('assets/icons/home-outlined.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? SvgPicture.asset('assets/icons/search-filled.svg')
                : SvgPicture.asset('assets/icons/search-outlined.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? SvgPicture.asset('assets/icons/add-square-filled.svg')
                : SvgPicture.asset('assets/icons/add-square-outlined.svg'),
            label: 'PostNew',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? SvgPicture.asset('assets/icons/notification-filled.svg')
                : SvgPicture.asset('assets/icons/notification-outlined.svg'),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 4
                ? SizedBox(
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
                          child: Image.network(
                            '$apiUrl/avatar/${user?.avatar}',
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 28,
                    width: 28,
                    child: ClipOval(
                      child: CircleAvatar(
                        radius: 100,
                        child: Image.network(
                          '$apiUrl/avatar/${user?.avatar}',
                        ),
                      ),
                    ),
                  ),
            label: 'Profile',
          ),
        ],
      ),
      body: widget.navigationShell,
    );
  }
}
