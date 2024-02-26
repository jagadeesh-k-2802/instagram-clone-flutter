import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instagram_clone/router/routes.dart';
import 'package:instagram_clone/services/comment.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:instagram_clone/state/feed/comments_provider.dart';
import 'package:instagram_clone/state/feed/feed_provider.dart';
import 'package:instagram_clone/widgets/post_item.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  Future<void> onLike(String postId) async {
    ref.read(feedProvider.notifier).likePost(postId);

    try {
      await PostService.likePost(postId: postId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnLike(String postId) async {
    ref.read(feedProvider.notifier).unLikePost(postId);

    try {
      await PostService.unLikePost(postId: postId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onComment(String postId, String comment) async {
    try {
      await CommentService.commentOnPost(postId: postId, comment: comment);
      ref.read(commentsProvider(postId).notifier).invalidate();
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

    try {
      await CommentService.deleteComment(commentId: commentId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onShare() async {
    // TODO: Implement OnShare
  }

  Future<void> onSave(String postId) async {
    try {
      ref.read(feedProvider.notifier).savePost(postId);
      await PostService.savePost(postId: postId);
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnsave(String postId) async {
    try {
      ref.read(feedProvider.notifier).unSavePost(postId);
      await PostService.unSavePost(postId: postId);
    } catch (error) {
      // Do Nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logo.svg'),
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.message),
                    child: SvgPicture.asset(
                      'assets/icons/message.svg',
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
            provider: feedProvider,
            pullToRefresh: true,
            itemBuilder: (context, item, index) {
              return PostItem(
                key: Key(item.id),
                id: item.id,
                assets: item.assets,
                user: item.user,
                caption: item.caption,
                isLiked: item.isLiked,
                isSaved: item.isSaved,
                likeCount: item.likeCount,
                onLike: () => onLike(item.id),
                onUnLike: () => onUnLike(item.id),
                onComment: (comment) => onComment(item.id, comment),
                onShare: onShare,
                onSave: () => onSave(item.id),
                onUnsave: () => onUnsave(item.id),
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
