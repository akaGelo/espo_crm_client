import 'dart:ui';

import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:espo_crm_client/globalbasestate/state.dart';

class AccountPageState implements GlobalBaseState, Cloneable<AccountPageState> {
  String name;
  String avatar;
  bool islogin;
  int acountIdV3;
  String acountIdV4;
  AnimationController animationController;
  @override
  AccountPageState clone() {
    return AccountPageState()
      ..name = name
      ..avatar = avatar
      ..islogin = islogin
      ..animationController = animationController
      ..acountIdV3 = acountIdV3
      ..acountIdV4 = acountIdV4
      ..locale = locale
      ..themeColor = themeColor
      ..user = user;
  }

  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  FirebaseUser user;
}

AccountPageState initState(Map<String, dynamic> args) {
  return AccountPageState()
    ..name = ''
    ..islogin = false;
}
