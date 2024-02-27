import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/post/explore_posts_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/post/post_grid_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void navigateToSearchDetail() {
    context.pushNamed(Routes.searchDetail);
  }

  Widget buildSearchBar() {
    return SizedBox(
      height: 36,
      child: TextFormField(
        readOnly: true,
        onTap: navigateToSearchDetail,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          fillColor: lightGrayColor,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }

  void showPostItem(GetExplorePostsResponseData item) {
    context.push(Routes.postDetailPath(item.id));
  }

  Widget buildNoItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 150,
        horizontal: 32,
      ),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.camera_alt, size: 80.0),
            const SizedBox(height: 8.0),
            Text('No Posts Yet', style: bodyLargeBold(context)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(),
        automaticallyImplyLeading: false,
      ),
      body: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        provider: explorePostsProvider,
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
          return buildNoItems();
        },
        pagedBuilder: (controller, builder) => PagedGridView(
          pagingController: controller,
          builderDelegate: builder,
          gridDelegate: photoGridDelegate,
        ),
      ),
    );
  }
}
