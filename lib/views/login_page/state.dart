import 'dart:math';
import 'dart:ui';

import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:espo_crm_client/globalbasestate/state.dart';

class LoginPageState implements GlobalBaseState, Cloneable<LoginPageState> {
  String url = 'https://demo2.espocrm.com';
  String account = 'admin';
  String pwd = '';
  String errorMessage = '';
  AnimationController animationController;
  AnimationController submitAnimationController;
  AnimationController errorMessageAnimationController;
  FocusNode urlFocusNode;
  FocusNode accountFocusNode;
  FocusNode pwdFocusNode;

  @override
  LoginPageState clone() {
    return LoginPageState()
      ..url = url
      ..account = account
      ..pwd = pwd
      ..errorMessage = errorMessage
      ..urlFocusNode = urlFocusNode
      ..accountFocusNode = accountFocusNode
      ..pwdFocusNode = pwdFocusNode
      ..animationController = animationController
      ..submitAnimationController = submitAnimationController
      ..errorMessageAnimationController = errorMessageAnimationController;
  }

  @override
  Color themeColor;

  @override
  Locale locale;

  @override
  Credentials user;
}

LoginPageState initState(Map<String, dynamic> args) {
  return LoginPageState();
}
