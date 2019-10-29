import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:espo_crm_client/globalbasestate/action.dart';
import 'package:espo_crm_client/globalbasestate/store.dart';
import 'action.dart';
import 'state.dart';

Effect<MainPageState> buildEffect() {
  return combineEffects(<Object, Effect<MainPageState>>{
    MainPageAction.action: _onAction,
    Lifecycle.initState: _onInit
  });
}

void _onAction(Action action, Context<MainPageState> ctx) {}

void _onInit(Action action, Context<MainPageState> ctx) async {
  //TODO авторизация
//  var _user = await FirebaseAuth.instance.currentUser();
//  if (_user != null)
//    GlobalStore.store.dispatch(GlobalActionCreator.setUser(_user));
}
