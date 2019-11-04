import 'dart:ui';

import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:espo_crm_client/globalbasestate/state.dart';

class AccountPageState implements GlobalBaseState, Cloneable<AccountPageState> {
  UserProfile userProfile;

  AnimationController animationController;

  bool get isLogin => null != userProfile;

  @override
  AccountPageState clone() {
    return AccountPageState()
      ..userProfile = userProfile
      ..animationController = animationController
      ..locale = locale
      ..themeColor = themeColor
      ..user = user;
  }

  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  Credentials user;
}

AccountPageState initState(Map<String, dynamic> args) {
  return AccountPageState();
}
