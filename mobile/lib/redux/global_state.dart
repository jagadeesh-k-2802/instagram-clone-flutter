import 'package:flutter/material.dart';
import 'package:instagram_clone/models/auth.dart';
import 'package:redux/redux.dart';

// State Object
@immutable
class AppState {
  final UserResponseData? user;
  const AppState(this.user);
  const AppState.initialState() : user = null;
}

// Actions
class SetUserAction {
  final UserResponseData? user;
  SetUserAction(this.user);
}

// Reducer
AppState globalReducer(AppState previousState, dynamic action) {
  if (action is SetUserAction) {
    return AppState(action.user);
  }

  return previousState;
}

// Store
final store = Store<AppState>(
  globalReducer,
  initialState: const AppState.initialState(),
);
