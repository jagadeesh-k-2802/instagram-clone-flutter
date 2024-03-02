import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/services/story.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFeedStoriesResponseData;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetFeedStoriesResponse stories = await StoryService.getFeedStories(
              page: page,
              limit: limit,
            );

            if (page == 1) {
              if (stories.data.currentUserStories.isEmpty) {
                const placeholder = GetFeedStoriesResponseData(
                  id: 'placeholder',
                  stories: [],
                  hasPending: false,
                );

                return [
                  ...[placeholder],
                  ...stories.data.otherUserStories,
                ];
              }

              return [
                ...stories.data.currentUserStories,
                ...stories.data.otherUserStories,
              ];
            }

            return stories.data.otherUserStories;
          },
        );

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

final feedStoriesProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
