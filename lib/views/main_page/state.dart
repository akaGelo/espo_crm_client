import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:espo_crm_client/globalbasestate/state.dart';

class MainPageState implements GlobalBaseState, Cloneable<MainPageState> {
  int selectedIndex = 0;
  List<Widget> pages;
  @override
  MainPageState clone() {
    return MainPageState()
      ..pages = pages
      ..selectedIndex = selectedIndex;
  }

  @override
  Locale locale;

  @override
  Color themeColor;

  @override
  Credentials user;
}

MainPageState initState(Map<String, dynamic> args) {
  return MainPageState()..pages = args['pages'];
}
