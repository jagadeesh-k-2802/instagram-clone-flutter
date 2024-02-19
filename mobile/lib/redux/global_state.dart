import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/auth.dart';

typedef Data = UserResponseData?;

class AppStateNotifier extends StateNotifier<UserResponseData?> {
  AppStateNotifier(super.state);
  void setUser(Data? userResponseData) => state = userResponseData;
}

final appStateProvider = StateNotifierProvider<AppStateNotifier, Data?>(
  (ref) => AppStateNotifier(null),
);
