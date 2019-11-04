import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConctactSyncState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConctactSyncState>>{
      ConctactSyncAction.progressUpdate: _onProgressUpdate,
    },
  );
}

ConctactSyncState _onProgressUpdate(ConctactSyncState state, Action action) {
  final ConctactSyncState newState = state.clone();
  newState..progressState = action.payload;
  return newState;
}
