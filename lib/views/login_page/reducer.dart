import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginPageState>>{
      LoginPageAction.errorMessage: (s, a) =>
          s.clone()..errorMessage = a.payload,
      LoginPageAction.urlChanged: (s, a) => s.clone()..url = a.payload ?? '',
      LoginPageAction.accoutChanged: (s, a) =>
          s.clone()..account = a.payload ?? '',
      LoginPageAction.pwdChanged: (s, a) => s.clone()..pwd = a.payload ?? '',
    },
  );
}
