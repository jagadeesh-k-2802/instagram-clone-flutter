import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:instagram_clone/models/user.dart';

typedef Data = SearchUsersResponseData;

class State extends PagedState<int, Data> {
  final String search;

  const State({
    this.search = '',
    super.records,
    String? super.error,
    super.nextPageKey,
    List<int>? previousPageKeys,
  });

  @override
  State copyWith({
    String? search,
    List<Data>? records,
    bool isEnd = false,
    dynamic error,
    dynamic nextPageKey,
    List<int>? previousPageKeys,
  }) {
    final sup = super.copyWith(
      records: records,
      error: error,
      nextPageKey: nextPageKey,
      previousPageKeys: previousPageKeys,
    );

    return State(
      search: search ?? this.search,
      records: sup.records,
      error: sup.error,
      nextPageKey: sup.nextPageKey,
      previousPageKeys: sup.previousPageKeys,
    );
  }
}

class Notifier extends StateNotifier<State>
    with PagedNotifierMixin<int, Data, State> {
  Notifier() : super(const State());

  @override
  Future<List<Data>?> load(int page, int limit) async {
    try {
      if (state.previousPageKeys.contains(page)) {
        await Future.delayed(
          const Duration(seconds: 0),
          () => state = state.copyWith(),
        );

        return state.records;
      }

      SearchUsersResponse users = await UserService.searchUsers(
        search: state.search,
        page: page,
        limit: limit,
      );

      state = state.copyWith(
        records: [...(state.records ?? []), ...users.data],
        nextPageKey: users.data.isEmpty ? null : page + 1,
        previousPageKeys: {...state.previousPageKeys, page}.toList(),
      );
    } catch (error) {
      state = state.copyWith(error: error.toString());
    }

    return null;
  }

  void updateSearchValue(String search) {
    state = state.copyWith(
      search: search,
      records: [],
      nextPageKey: 0,
      previousPageKeys: [],
    );

    load(1, 20);
  }
}

final searchUsersProvider = StateNotifierProvider.autoDispose<Notifier, State>(
  (_) => Notifier(),
);
