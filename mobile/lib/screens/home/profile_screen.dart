import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/state/global_state.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/photo_grid.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void navigateToEditProfile() {
    // TODO: Navigate to edit profile
  }

  Widget buildProfileHeader({UserResponseData? user}) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 48.0,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: '$apiUrl/avatar/${user?.avatar}',
                  ),
                ),
              ),
              Column(
                children: [
                  Text('0', style: titleLargeBold(context)),
                  Text('Posts', style: textTheme.bodyMedium),
                ],
              ),
              Column(
                children: [
                  Text('0', style: titleLargeBold(context)),
                  Text('Followers', style: textTheme.bodyMedium),
                ],
              ),
              Column(
                children: [
                  Text('0', style: titleLargeBold(context)),
                  Text('Following', style: textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            user?.name ?? '',
            style: bodyLargeBold(context),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 35,
            child: ElevatedButton(
              onPressed: navigateToEditProfile,
              style: secondaryButtonStyle,
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    );
  }

  void showMenuModal() {
    TextTheme textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 80,
          width: double.maxFinite,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed('settings');
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(width: 8.0),
                      Text('Settings and Privacy', style: textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.read(globalStateProvider).user;
    ScrollController outerController = ScrollController();

    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 35,
              collapsedHeight: 35,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(user?.username ?? ''),
                  GestureDetector(
                    onTap: showMenuModal,
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      height: 26,
                      width: 26,
                    ),
                  )
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(180),
                child: buildProfileHeader(user: user),
              ),
            )
          ];
        },
        body: ListView(
          controller: outerController,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                    width: double.maxFinite,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      overlayColor: MaterialStatePropertyAll(lightGrayColor),
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(icon: Icon(Icons.grid_on)),
                        Tab(icon: Icon(Icons.account_box)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50 * 20,
                    width: double.maxFinite,
                    child: TabBarView(
                      children: [
                        PhotoGrid(
                          itemCount: 50,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.black38,
                              child: const Center(child: Text('Child')),
                            );
                          },
                        ),
                        PhotoGrid(
                          itemCount: 50,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.black38,
                              child: const Center(child: Text('Child')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
