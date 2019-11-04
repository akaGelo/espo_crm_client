import 'dart:ui';

import 'package:espo_crm_client/globalbasestate/state.dart';
import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';

class ListProgressState {
  int total;

  int currentIndex;
  String listName;

  double get asPercent {
    if (0 == total) {
      return 0;
    }
    var v = currentIndex / total;
    if (v > 1) {
      return 1;
    }
    return v;
  }

  ListProgressState(this.total, this.currentIndex, this.listName);
}

class ConctactSyncState
    implements GlobalBaseState, Cloneable<ConctactSyncState> {
  AnimationController submitAnimationController;

  ListProgressState progressState;

  get inProgress => false;

  @override
  ConctactSyncState clone() {
    return ConctactSyncState()
      ..progressState = progressState
      ..submitAnimationController = submitAnimationController
      ..user = user
      ..themeColor = themeColor
      ..locale = locale;
  }

  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  Credentials user;
}

ConctactSyncState initState(Map<String, dynamic> args) {
  return ConctactSyncState()..progressState = ListProgressState(0, 0, "");
}
