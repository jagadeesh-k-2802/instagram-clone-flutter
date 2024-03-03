import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/story.dart';
import 'package:instagram_clone/services/story.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetFeedStoriesResponseData;

// Temp item to show atleast one story item in feed for current user
const _placeholderStoryItem = GetFeedStoriesResponseData(
  id: 'placeholder',
  stories: [],
  hasPending: false,
  avatar: '',
  name: '',
  username: '',
);

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
                return [
                  ...[_placeholderStoryItem],
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

  void viewStory(String userId, String storyId) {
    List<bool> isViewedList = [];

    state = state.copyWith(
      records: state.records?.map((item) {
        return item.id == userId
            ? item.copyWith(
                stories: item.stories.map(
                  (storyItem) {
                    if (storyItem.id == storyId) {
                      isViewedList.add(true);
                    } else {
                      isViewedList.add(storyItem.isViewed);
                    }

                    return storyItem.id == storyId
                        ? storyItem.copyWith(isViewed: true)
                        : storyItem;
                  },
                ).toList(),
                hasPending: !isViewedList.every((e) => e),
              )
            : item;
      }).toList(),
    );
  }

  void deleteStory(String userId, String storyId) {
    final newRecords = state.copyWith().records;
    final newStoryItem = newRecords?.firstWhere((item) => item.id == userId);
    List<StoryItem>? newStoriesList = List.from(newStoryItem?.stories ?? []);
    newStoriesList.removeWhere((story) => story.id == storyId);
    if (newStoryItem == null) return;

    state = state.copyWith(
      records: state.records?.map((item) {
        return item.id == userId
            ? newStoriesList.isEmpty
                ? _placeholderStoryItem
                : item.copyWith(stories: newStoriesList)
            : item;
      }).toList(),
    );
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

final feedStoriesProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
