import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/post/user_liked_posts_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/post/post_grid_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class LikedPostsScreen extends StatefulWidget {
  const LikedPostsScreen({super.key});

  @override
  State<LikedPostsScreen> createState() => _LikedPostsScreenState();
}

class _LikedPostsScreenState extends State<LikedPostsScreen> {
  void showPostItem(GetUsersPostResponseData item) {
    context.push(Routes.postDetailPath(item.post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liked Posts')),
      body: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        provider: userLikedPostsProvider,
        pullToRefresh: true,
        newPageProgressIndicatorBuilder: (
          context,
          controller,
        ) {
          return Container();
        },
        itemBuilder: (context, item, index) {
          return PostGridItem(
            assetUrl: '$apiUrl/posts/${item.post.assets[0].url}',
            assetsCount: item.post.assets.length,
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
                    'No posts have been liked',
                    style: bodyLargeBold(context),
                  ),
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
    );
  }
}
