import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

//import 'package:espo_crm_client/actions/apihelper.dart';
import 'package:espo_crm_client/customwidgets/custom_stfstate.dart';
import 'package:espo_crm_client/globalbasestate/action.dart';
import 'package:espo_crm_client/globalbasestate/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

import 'package:espo_crm_client/actions/api.dart';

Effect<AccountPageState> buildEffect() {
  return combineEffects(<Object, Effect<AccountPageState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.build: _onBuild,
    Lifecycle.dispose: _onDispose,
    AccountPageAction.action: _onAction,
    AccountPageAction.login: _onLogin,
    AccountPageAction.logout: _onLogout,
    AccountPageAction.navigatorPush: _navigatorPush,
  });
}

//final FirebaseAuth _auth = FirebaseAuth.instance;

RestClient apiClient = RestClient();

void _onAction(Action action, Context<AccountPageState> ctx) {}

Future _onLogin(Action action, Context<AccountPageState> ctx) async {
  var r = await Navigator.of(ctx.context).pushNamed('loginpage');
  if (r == true) _onInit(action, ctx);
}

Future _onInit(Action action, Context<AccountPageState> ctx) async {
  if (ctx.state.animationController == null) {
    final CustomstfState ticker = ctx.stfState as CustomstfState;
    ctx.state.animationController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 1000));
  }
  try {
    var userProfile = await apiClient.getUserProfile(ctx.state.user);
    ctx.dispatch(AccountPageActionCreator.onProfile(userProfile));
  } catch (e) {
    Toast.show("Fail profile laod", ctx.context);
  }
}

void _onBuild(Action action, Context<AccountPageState> ctx) {
  ctx.state.animationController.forward();
}

void _onDispose(Action action, Context<AccountPageState> ctx) {
  ctx.state.animationController.dispose();
}

Future _onLogout(Action action, Context<AccountPageState> ctx) async {
//  var q = await ApiHelper.deleteSession();
//  if (q) await _onInit(action, ctx);

//  final FirebaseUser currentUser = await _auth.currentUser();
//  if (currentUser != null) {
//    try {
//      _auth.signOut();
//      GlobalStore.store.dispatch(GlobalActionCreator.setUser(null));
//    } on Exception catch (e) {}
//    await _onInit(action, ctx);
//  }

  ctx.dispatch(AccountPageActionCreator.onProfile(null));
  GlobalStore.store.dispatch(GlobalActionCreator.setUser(null));
}

Future _navigatorPush(Action action, Context<AccountPageState> ctx) async {
  if (!ctx.state.isLogin)
    await _onLogin(action, ctx);
  else {
    String routerName = action.payload[0];
    Object data = action.payload[1];
    await Navigator.of(ctx.context).pushNamed(routerName, arguments: data);
  }
}
