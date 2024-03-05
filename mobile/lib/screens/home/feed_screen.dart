import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/config/assets.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/comment.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/post/comments_provider.dart';
import 'package:instagram_clone/state/post/feed_posts_provider.dart';
import 'package:instagram_clone/state/story/feed_stories_provider.dart';
import 'package:instagram_clone/utils/stream_chat.dart';
import 'package:instagram_clone/widgets/post/post_item.dart';
import 'package:instagram_clone/widgets/story/story_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  StreamChatClient? client = StreamChatSingleton.instance?.client;

  Future<void> onLike(String postId) async {
    ref.read(feedPostsProvider.notifier).likePost(postId);

    try {
      await PostService.likePost(postId: postId);
    } catch (error) {
      ref.read(feedPostsProvider.notifier).unLikePost(postId);
    }
  }

  Future<void> onUnLike(String postId) async {
    ref.read(feedPostsProvider.notifier).unLikePost(postId);

    try {
      await PostService.unLikePost(postId: postId);
    } catch (error) {
      ref.read(feedPostsProvider.notifier).likePost(postId);
    }
  }

  Future<void> onComment(String postId, String comment) async {
    try {
      await CommentService.commentOnPost(postId: postId, comment: comment);
      ref.read(commentsProvider(postId).notifier).invalidate();
      ref.read(feedPostsProvider.notifier).incrementCommentCount(postId);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot send comment currently')),
      );
    }
  }

  Future<void> onCommentLike(String postId, String commentId) async {
    ref.read(commentsProvider(postId).notifier).likeComment(commentId);

    try {
      await CommentService.likeComment(commentId: commentId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onCommentUnLike(String postId, String commentId) async {
    ref.read(commentsProvider(postId).notifier).unLikeComment(commentId);

    try {
      await CommentService.unLikeComment(commentId: commentId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onCommentDelete(String postId, String commentId) async {
    ref.read(commentsProvider(postId).notifier).deleteComment(commentId);
    ref.read(feedPostsProvider.notifier).decrementCommentCount(postId);

    try {
      await CommentService.deleteComment(commentId: commentId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onSave(String postId) async {
    try {
      ref.read(feedPostsProvider.notifier).savePost(postId);
      await PostService.savePost(postId: postId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnsave(String postId) async {
    try {
      ref.read(feedPostsProvider.notifier).unSavePost(postId);
      await PostService.unSavePost(postId: postId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onDelete(String postId) async {
    try {
      setState(() {}); // to Update Changes
      ref.read(feedPostsProvider.notifier).deletePost(postId);
      ref.read(globalStateProvider.notifier).decrementPostCount();
      await PostService.deletePost(postId: postId);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your post has been deleted')),
      );
    } catch (error) {
      // Do Nothing
    }
  }

  Widget buildStoriesList() {
    var storiesList = ref.watch(feedStoriesProvider).records;

    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: RiverPagedBuilder.autoDispose(
        firstPageKey: 1,
        limit: 20,
        provider: feedStoriesProvider,
        itemBuilder: (context, item, index) {
          return StoryItem(story: item, index: index, storiesList: storiesList);
        },
        noItemsFoundIndicatorBuilder: (context, controller) {
          return Container();
        },
        newPageProgressIndicatorBuilder: (context, controller) {
          return Container();
        },
        pagedBuilder: (controller, builder) => PagedListView(
          pagingController: controller,
          builderDelegate: builder,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsConstants.logo),
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.message),
                    child: (client?.state.unreadChannels ?? 0) > 0
                        ? Badge.count(
                            count: client?.state.unreadChannels ?? 0,
                            child: SvgPicture.asset(
                              AssetsConstants.message,
                              height: 26,
                              width: 26,
                            ),
                          )
                        : SvgPicture.asset(
                            AssetsConstants.message,
                            height: 26,
                            width: 26,
                          ),
                  )
                ],
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: RiverPagedBuilder.autoDispose(
            firstPageKey: 1,
            limit: 20,
            provider: feedPostsProvider,
            pullToRefresh: true,
            itemBuilder: (context, item, index) {
              if (item.id == 'stories-list') {
                return buildStoriesList();
              }

              return PostItem(
                key: Key(item.id),
                item: item,
                onLike: () => onLike(item.id),
                onUnLike: () => onUnLike(item.id),
                onComment: (comment) => onComment(item.id, comment),
                onSave: () => onSave(item.id),
                onUnsave: () => onUnsave(item.id),
                onDelete: () => onDelete(item.id),
                onCommentLike: (String commentId) => onCommentLike(
                  item.id,
                  commentId,
                ),
                onCommentUnLike: (String commentId) => onCommentUnLike(
                  item.id,
                  commentId,
                ),
                onCommentDelete: (String commentId) => onCommentDelete(
                  item.id,
                  commentId,
                ),
              );
            },
            noItemsFoundIndicatorBuilder: (context, controller) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 150,
                  horizontal: 32,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text('There are currently no posts.'),
                    ],
                  ),
                ),
              );
            },
            pagedBuilder: (controller, builder) => PagedListView(
              pagingController: controller,
              builderDelegate: builder,
            ),
          ),
        ),
      ),
    );
  }
}
