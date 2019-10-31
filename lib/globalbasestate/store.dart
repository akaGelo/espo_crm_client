import 'package:fish_redux/fish_redux.dart';
import 'reducer.dart';
import 'state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}

Object connectGlobalStore(Object pagestate, GlobalState appState) {
  final GlobalBaseState p = pagestate;
  if (p.themeColor != appState.themeColor ||
      p.locale != appState.locale ||
      p.user != appState.user) {
    if (pagestate is Cloneable) {
      final Object copy = pagestate.clone();
      final GlobalBaseState newState = copy;
      newState.themeColor = appState.themeColor;
      newState.locale = appState.locale;
      newState.user = appState.user;
      //I18n.onLocaleChanged(appState.locale);
      return newState;
    }
  }
  return pagestate;
}
