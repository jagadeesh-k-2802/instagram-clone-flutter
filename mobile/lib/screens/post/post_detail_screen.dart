import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/services/comment.dart';
import 'package:instagram_clone/services/post.dart';
import 'package:instagram_clone/state/global_state_provider.dart';
import 'package:instagram_clone/state/post/comments_provider.dart';
import 'package:instagram_clone/state/post/feed_posts_provider.dart';
import 'package:instagram_clone/state/post/post_provider.dart';
import 'package:instagram_clone/widgets/post/post_item.dart';

class PostDetailScreen extends ConsumerStatefulWidget {
  final String? postId;
  const PostDetailScreen({super.key, required this.postId});

  @override
  ConsumerState<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {
  Future<void> onLike(String postId) async {
    ref.read(feedPostsProvider.notifier).likePost(postId);

    try {
      await PostService.likePost(postId: postId);
      ref.refresh(postProvider(widget.postId ?? '')).isRefreshing;
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnLike(String postId) async {
    ref.read(feedPostsProvider.notifier).unLikePost(postId);

    try {
      await PostService.unLikePost(postId: postId);
      ref.refresh(postProvider(widget.postId ?? '')).isRefreshing;
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

  Future<void> onSave(String postId) async {
    try {
      ref.read(feedPostsProvider.notifier).savePost(postId);
      await PostService.savePost(postId: postId);
      ref.refresh(postProvider(widget.postId ?? '')).isRefreshing;
    } catch (error) {
      // Do Nothing
    }
  }

  Future<void> onUnsave(String postId) async {
    try {
      ref.read(feedPostsProvider.notifier).unSavePost(postId);
      await PostService.unSavePost(postId: postId);
      ref.refresh(postProvider(widget.postId ?? '')).isRefreshing;
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
      context.pop();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your post has been deleted')),
      );
    } catch (error) {
      // Do Nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(postProvider(widget.postId ?? ''));

    return provider.when(
      data: (item) {
        return Scaffold(
          appBar: AppBar(),
          body: PostItem(
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
          ),
        );
      },
      error: (error, stacktrace) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(child: Text('Something went wrong!')),
        );
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
