import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AccountPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<AccountPageState>>{
      AccountPageAction.action: _onAction,
      AccountPageAction.profile: _onProfileLoad,
    },
  );
}

AccountPageState _onAction(AccountPageState state, Action action) {
  final AccountPageState newState = state.clone();
  return newState;
}

AccountPageState _onProfileLoad(AccountPageState state, Action action) {
  final AccountPageState newState = state.clone();
  newState.userProfile = action.payload;
  return newState;
}
