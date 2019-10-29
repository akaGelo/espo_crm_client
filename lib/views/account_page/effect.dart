import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
//import 'package:espo_crm_client/actions/apihelper.dart';
import 'package:espo_crm_client/customwidgets/custom_stfstate.dart';
import 'package:espo_crm_client/globalbasestate/action.dart';
import 'package:espo_crm_client/globalbasestate/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'action.dart';
import 'state.dart';

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
  var prefs = await SharedPreferences.getInstance();

  //final FirebaseUser currentUser = await _auth.currentUser();
  //String name = prefs.getString('accountname');
  //String avatar = prefs.getString('accountgravatar');
  //bool islogin = prefs.getBool('islogin') ?? false;
  int accountIdV3 = prefs.getInt('accountid');
  String name = ctx.state.user?.displayName;
  String avatar = ctx.state.user?.photoUrl;
  bool islogin = ctx.state.user != null;
  String accountIdV4 = prefs.getString('accountIdV4');
  ctx.dispatch(AccountPageActionCreator.onInit(
      name, avatar, islogin, accountIdV3, accountIdV4));
}

void _onBuild(Action action, Context<AccountPageState> ctx) {
  ctx.state.animationController.forward();
}

void _onDispose(Action action, Context<AccountPageState> ctx) {
  ctx.state.animationController.dispose();
}

Future _onLogout(Action action, Context<AccountPageState> ctx) async {
  //var q = await ApiHelper.deleteSession();
  //if (q) await _onInit(action, ctx);

//  final FirebaseUser currentUser = await _auth.currentUser();
//  if (currentUser != null) {
//    try {
//      _auth.signOut();
//      GlobalStore.store.dispatch(GlobalActionCreator.setUser(null));
//    } on Exception catch (e) {}
//    await _onInit(action, ctx);
//  }
}

Future _navigatorPush(Action action, Context<AccountPageState> ctx) async {
  if (!ctx.state.islogin)
    await _onLogin(action, ctx);
  else {
    String routerName = action.payload[0];
    Object data = action.payload[1];
    await Navigator.of(ctx.context).pushNamed(routerName, arguments: data);
  }
}