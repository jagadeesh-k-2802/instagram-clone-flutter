import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/screens/profile/follow_detail_screen.dart';
import 'package:instagram_clone/services/auth.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/post/user_posts_provider.dart';
import 'package:instagram_clone/state/post/user_tagged_posts_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/widgets/core/clickable_list_item.dart';
import 'package:instagram_clone/widgets/post/post_grid_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void navigateToEditProfile() {
    context.pushNamed(Routes.profileEdit);
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
              SizedBox(
                width: 75,
                child: Column(
                  children: [
                    Text(
                      instagramNumberFormatter(user?.postCount ?? 0),
                      style: titleLargeBold(context),
                    ),
                    Text('Posts', style: textTheme.bodyMedium),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => navigateToFollowDetail(
                  user?.id ?? '',
                  user?.username ?? '',
                  'followers',
                ),
                child: SizedBox(
                  width: 75,
                  child: Column(
                    children: [
                      Text(
                        instagramNumberFormatter(user?.followersCount ?? 0),
                        style: titleLargeBold(context),
                      ),
                      Text('Followers', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigateToFollowDetail(
                  user?.id ?? '',
                  user?.username ?? '',
                  'following',
                ),
                child: SizedBox(
                  width: 75,
                  child: Column(
                    children: [
                      Text(
                        instagramNumberFormatter(user?.followingCount ?? 0),
                        style: titleLargeBold(context),
                      ),
                      Text('Following', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            user?.name ?? '',
            style: bodyLargeBold(context),
          ),
          const SizedBox(height: 4.0),
          Visibility(
            visible: user?.bio.isNotEmpty == true,
            child: Column(
              children: [
                Text(
                  user?.bio ?? '',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
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
    showModalBottomSheet(
      showDragHandle: true,
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 170,
          width: double.maxFinite,
          child: Column(
            children: [
              ClickableListItem(
                text: 'Liked Posts',
                prefixIcon: Icons.favorite,
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(Routes.likedPosts);
                },
              ),
              ClickableListItem(
                text: 'Saved Posts',
                prefixIcon: Icons.bookmark,
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(Routes.savedPosts);
                },
              ),
              ClickableListItem(
                text: 'Settings and Privacy',
                prefixIcon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(Routes.settings);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToNewPost() {
    context.pushNamed(Routes.newPost);
  }

  void showPostItem(GetUserPostsResponseData item) {
    context.push(Routes.postDetailPath(item.id));
  }

  void navigateToFollowDetail(
    String userId,
    String username,
    String initialScreen,
  ) {
    context.pushNamed(
      Routes.followDetail,
      extra: FollowDetailScreenArgs(
        userId: userId,
        username: username,
        initialScreen: initialScreen,
      ),
    );
  }

  Widget buildTabView(UserResponseData? user) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
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
            height: 50 * 10,
            width: double.maxFinite,
            child: TabBarView(
              children: [
                RiverPagedBuilder(
                  firstPageKey: 1,
                  limit: 20,
                  provider: userPostsProvider(user?.id ?? ''),
                  pullToRefresh: true,
                  newPageProgressIndicatorBuilder: (
                    context,
                    controller,
                  ) {
                    return Container();
                  },
                  itemBuilder: (context, item, index) {
                    return PostGridItem(
                      assetUrl: '$apiUrl/posts/${item.assets[0].url}',
                      assetsCount: item.assets.length,
                      onTap: () => showPostItem(item),
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context, controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 150,
                        horizontal: 32,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Capture the moment with a friend',
                              style: bodyLargeBold(context),
                            ),
                            TextButton(
                              onPressed: navigateToNewPost,
                              child: Text(
                                'Create your first post ',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  pagedBuilder: (controller, builder) => PagedGridView(
                    pagingController: controller,
                    builderDelegate: builder,
                    gridDelegate: photoGridDelegate,
                  ),
                ),
                RiverPagedBuilder(
                  firstPageKey: 1,
                  limit: 20,
                  provider: userTaggedPostsProvider(user?.id ?? ''),
                  pullToRefresh: true,
                  newPageProgressIndicatorBuilder: (
                    context,
                    controller,
                  ) {
                    return Container();
                  },
                  itemBuilder: (context, item, index) {
                    return PostGridItem(
                      assetUrl: '$apiUrl/posts/${item.assets[0].url}',
                      assetsCount: item.assets.length,
                      onTap: () => showPostItem(item),
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context, controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 150,
                        horizontal: 32,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const Icon(Icons.account_box, size: 80.0),
                            const SizedBox(height: 8.0),
                            Text(
                              'When people tag you in photos and videos, they\'ll appear here.',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  pagedBuilder: (controller, builder) => PagedGridView(
                    pagingController: controller,
                    builderDelegate: builder,
                    gridDelegate: photoGridDelegate,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.watch(globalStateProvider).user;
    ScrollController outerController = ScrollController();

    return VisibilityDetector(
      key: const Key('ProfileScreen'),
      onVisibilityChanged: (visibilityInfo) async {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage == 100 && mounted) {
          UserResponse userResponse = await AuthService.getMe();
          final appState = ref.read(globalStateProvider.notifier);
          appState.setUser(userResponse.data);
        }
      },
      child: Scaffold(
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(user?.username ?? ''),
                    GestureDetector(
                      onTap: showMenuModal,
                      child: SvgPicture.asset(
                        AssetsConstants.menu,
                        height: 26,
                        width: 26,
                      ),
                    )
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                    user?.bio.isNotEmpty == true ? 220 : 170,
                  ),
                  child: buildProfileHeader(user: user),
                ),
              )
            ];
          },
          body: ListView(
            controller: outerController,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [buildTabView(user)],
          ),
        ),
      ),
    );
  }
}
