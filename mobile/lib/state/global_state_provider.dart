import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/auth.dart';

typedef Data = State;

class State {
  UserResponseData? user;
  State(this.user);
}

class Notifier extends StateNotifier<Data> {
  Notifier(super.state);

  void setUser(UserResponseData? user) {
    state = State(user);
  }

  void incrementPostCount() {
    state = State(
      state.user?.copyWith(postCount: (state.user?.postCount ?? 0) + 1),
    );
  }

  void decrementPostCount() {
    state = State(
      state.user?.copyWith(postCount: (state.user?.postCount ?? 0) - 1),
    );
  }

  void incrementFollowingCount() {
    state = State(
      state.user?.copyWith(
        followingCount: (state.user?.followingCount ?? 0) + 1,
      ),
    );
  }

  void decrementFollowingCount() {
    state = State(
      state.user?.copyWith(
        followingCount: (state.user?.followingCount ?? 0) - 1,
      ),
    );
  }

  void incrementFollowersCount() {
    state = State(
      state.user?.copyWith(
        followersCount: (state.user?.followersCount ?? 0) + 1,
      ),
    );
  }

  void decrementFollowersCount() {
    state = State(
      state.user?.copyWith(
        followersCount: (state.user?.followersCount ?? 0) - 1,
      ),
    );
  }

  void onNotification() {
    state = State(
      state.user?.copyWith(
        unReadNotificationsCount:
            (state.user?.unReadNotificationsCount ?? 0) + 1,
      ),
    );
  }

  void readNotifications() {
    state = State(state.user?.copyWith(unReadNotificationsCount: 0));
  }
}

final _initialState = State(null);

/// [globalStateProvider] contains the application global state which includes
/// the current authenticated [State.user]
final globalStateProvider = StateNotifierProvider<Notifier, Data>(
  (ref) => Notifier(_initialState),
);
