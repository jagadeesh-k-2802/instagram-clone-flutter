import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/constants.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/post/post_like_detail_provider.dart';
import 'package:instagram_clone/theme/theme.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class PostLikeDetailScreen extends ConsumerStatefulWidget {
  final String? postId;

  const PostLikeDetailScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<PostLikeDetailScreen> createState() =>
      _PostLikeDetailScreenState();
}

class _PostLikeDetailScreenState extends ConsumerState<PostLikeDetailScreen> {
  void openUserProfile(String userId) {
    context.push(Routes.publicProfilePath(userId));
  }

  @override
  Widget build(BuildContext context) {
    UserResponseData? user = ref.read(globalStateProvider).user;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Likes')),
      body: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        provider: postLikeDetailProvider(widget.postId ?? ''),
        itemBuilder: (context, item, index) {
          return InkWell(
            onTap: user?.id == item.id ? null : () => openUserProfile(item.id),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPagePadding,
                vertical: 2.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '$apiUrl/avatar/${item.avatar}',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    children: [
                      Text(item.name, style: textTheme.bodyLarge),
                      Text(item.username, style: textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        noItemsFoundIndicatorBuilder: (context, controller) {
          return const Center(child: Text('No Likes Yet'));
        },
        pagedBuilder: (controller, builder) => PagedListView.separated(
          pagingController: controller,
          builderDelegate: builder,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
