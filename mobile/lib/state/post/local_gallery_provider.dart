import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

typedef Data = AssetEntity;
typedef Provider = StateNotifierProvider<Notifier, PagedState<int, Data>>;

class State extends PagedState<int, Data> {
  final RequestType requestType;

  const State({
    this.requestType = RequestType.all,
    super.records,
    String? super.error,
    super.nextPageKey,
    List<int>? previousPageKeys,
  });

  @override
  State copyWith({
    RequestType? requestType,
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
      requestType: requestType ?? this.requestType,
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
    Set<AssetEntity> results = {};

    final filter = AdvancedCustomFilter().addOrderBy(
      column: CustomColumns.base.createDate,
      isAsc: false,
    );

    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      filterOption: filter,
      type: state.requestType,
    );

    for (AssetPathEntity path in paths.reversed) {
      List<AssetEntity> assets = await path.getAssetListPaged(
        page: page,
        size: (page + 1) * limit,
      );

      for (AssetEntity asset in assets) {
        results.add(asset);
      }
    }

    state = state.copyWith(
      records: {...(state.records ?? []), ...results}.toList(),
      nextPageKey: results.isEmpty ? null : page + 1,
      previousPageKeys: {...state.previousPageKeys, page}.toList(),
    );

    return null;
  }

  void updateRequestType(RequestType requestType) {
    state = state.copyWith(
      requestType: requestType,
      records: [],
      nextPageKey: 0,
      previousPageKeys: [],
    );

    load(0, 50);
  }
}

final localGalleryProvider = StateNotifierProvider.autoDispose<Notifier, State>(
  (_) => Notifier(),
);
