import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/auth.dart';

typedef Data = GlobalState;

class GlobalState {
  UserResponseData? user;
  GlobalState(this.user);
}

class GlobalStateNotifier extends StateNotifier<Data> {
  GlobalStateNotifier(super.state);

  void setUser(UserResponseData? user) {
    state = GlobalState(user);
  }
}

final _initialState = GlobalState(null);

final globalStateProvider = StateNotifierProvider<GlobalStateNotifier, Data>(
  (ref) => GlobalStateNotifier(_initialState),
);
