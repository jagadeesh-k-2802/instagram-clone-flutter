import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/services/comment.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetCommentsResponseData;

class Notifier extends PagedNotifier<int, Data> {
  final String postId;

  Notifier({required this.postId})
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetCommentsResponse comments =
                await CommentService.getCommentsForPost(
              postId: postId,
              page: page,
              limit: limit,
            );

            return comments.data;
          },
        );

  void likeComment(String commentId) {
    state = state.copyWith(
      records: state.records?.map((comment) {
        return comment.id == commentId
            ? comment.copyWith(isLiked: true, likeCount: comment.likeCount + 1)
            : comment;
      }).toList(),
    );
  }

  void unLikeComment(String commentId) {
    state = state.copyWith(
      records: state.records?.map((comment) {
        return comment.id == commentId
            ? comment.copyWith(isLiked: false, likeCount: comment.likeCount - 1)
            : comment;
      }).toList(),
    );
  }

  void deleteComment(String commentId) {
    final newRecords = state.copyWith().records;
    newRecords?.removeWhere((comment) => comment.id == commentId);
    state = state.copyWith(records: newRecords);
  }

  void invalidate() {
    state = state.copyWith(
      records: [],
      error: null,
      previousPageKeys: [],
      nextPageKey: 1,
    );

    load(1, 20);
  }
}

final commentsProvider = StateNotifierProvider.family
    .autoDispose<Notifier, PagedState<int, Data>, String>(
  (ref, postId) => Notifier(postId: postId),
);
