import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/services/user.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:instagram_clone/models/user.dart';

typedef UserData = SearchUsersResponseData;

class SearchUsersState extends PagedState<int, UserData> {
  final String search;

  const SearchUsersState({
    this.search = '',
    super.records,
    String? super.error,
    super.nextPageKey,
    List<int>? previousPageKeys,
  });

  @override
  SearchUsersState copyWith({
    String? search,
    List<UserData>? records,
    bool isEnd = false,
    dynamic error,
    dynamic nextPageKey,
    List<int>? previousPageKeys,
  }) {
    final sup = super.copyWith(
      records: records,
      error: error,
      nextPageKey: nextPageKey,
      previousPageKeys: super.previousPageKeys,
    );

    return SearchUsersState(
      search: search ?? this.search,
      records: sup.records,
      error: sup.error,
      nextPageKey: sup.nextPageKey,
      previousPageKeys: sup.previousPageKeys,
    );
  }
}

class SearchUsersNotifier extends StateNotifier<SearchUsersState>
    with PagedNotifierMixin<int, UserData, SearchUsersState> {
  SearchUsersNotifier() : super(const SearchUsersState());

  @override
  Future<List<UserData>?> load(int page, int limit) async {
    try {
      if (state.previousPageKeys.contains(page)) {
        await Future.delayed(const Duration(seconds: 0), () {
          state = state.copyWith();
        });

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
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }

    return null;
  }

  void updateSearchValue(String search) {
    state = state.copyWith(search: search, records: [], nextPageKey: 0);
    load(1, 20);
  }
}

final searchUsersProvider =
    StateNotifierProvider.autoDispose<SearchUsersNotifier, SearchUsersState>(
  (_) => SearchUsersNotifier(),
);
