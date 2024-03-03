import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/services/story.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetStoryViewersResponseData;

class Notifier extends PagedNotifier<int, Data> {
  final String storyId;

  Notifier({required this.storyId})
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetStoryViewersResponse viewers = await StoryService.getViewers(
              storyId: storyId,
              page: page,
              limit: limit,
            );

            return viewers.data;
          },
        );
}

final storyViewersProvider = StateNotifierProvider.family
    .autoDispose<Notifier, PagedState<int, Data>, String>(
  (ref, storyId) => Notifier(storyId: storyId),
);
