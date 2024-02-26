import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/state/profile/user_liked_posts_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:instagram_clone/widgets/post_grid_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class LikedPostsScreen extends StatelessWidget {
  const LikedPostsScreen({super.key});

  void showPostItem(GetUsersPostResponseData item) {
    // TODO: Open Post in Post Detail Screen
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
            imageUrl: '$apiUrl/posts/${item.post.assets[0].url}',
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
