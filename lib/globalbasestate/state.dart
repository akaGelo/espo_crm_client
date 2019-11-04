import 'dart:ui';
import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState {
  Color get themeColor;
  set themeColor(Color color);

  Locale get locale;
  set locale(Locale locale);

  Credentials get user;
  set user(Credentials u);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;
  @override
  Locale locale;

  @override
  Credentials user;

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..locale = locale
      ..user = user;
  }
}
