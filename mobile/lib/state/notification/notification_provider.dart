import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/notification.dart';
import 'package:instagram_clone/services/notification.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

typedef Data = GetNotificationsResponseData;

class Notifier extends PagedNotifier<int, Data> {
  Notifier()
      : super(
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          load: (int page, int limit) async {
            GetNotificationsResponse notifications =
                await NotificationService.getNotifications(
              page: page,
              limit: limit,
            );

            return notifications.data;
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

final notificationsProvider =
    StateNotifierProvider.autoDispose<Notifier, PagedState<int, Data>>(
  (_) => Notifier(),
);
