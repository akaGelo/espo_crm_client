import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'package:espo_crm_client/customwidgets/custom_stfstate.dart';
import 'package:espo_crm_client/globalbasestate/action.dart';
import 'package:espo_crm_client/globalbasestate/store.dart';
import 'action.dart';
import 'state.dart';
import 'package:toast/toast.dart';

Effect<LoginPageState> buildEffect() {
  return combineEffects(<Object, Effect<LoginPageState>>{
    LoginPageAction.action: _onAction,
    LoginPageAction.loginclicked: _onLoginClicked,
    Lifecycle.initState: _onInit,
    Lifecycle.build: _onBuild,
    Lifecycle.dispose: _onDispose
  });
}

//final FirebaseAuth _auth = FirebaseAuth.instance;

void _onInit(Action action, Context<LoginPageState> ctx) {
  ctx.state.accountFocusNode = FocusNode();
  ctx.state.pwdFocusNode = FocusNode();
  final ticker = ctx.stfState as CustomstfState;
  ctx.state.animationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 2000));
  ctx.state.submitAnimationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 1000));
}

void _onBuild(Action action, Context<LoginPageState> ctx) {
  Future.delayed(Duration(milliseconds: 150),
      () => ctx.state.animationController.forward());
}

void _onDispose(Action action, Context<LoginPageState> ctx) {
  ctx.state.animationController.dispose();
  ctx.state.accountFocusNode.dispose();
  ctx.state.pwdFocusNode.dispose();
  ctx.state.submitAnimationController.dispose();
}

void _onAction(Action action, Context<LoginPageState> ctx) {}

Future _onLoginClicked(Action action, Context<LoginPageState> ctx) async {

  Toast.show("test ${ctx.state.pwd}", ctx.context, duration: 3, gravity: Toast.BOTTOM);
//  AuthResult result;
//  ctx.state.submitAnimationController.forward();
//  if (ctx.state.account != '' && ctx.state.pwd != '') {
//    //result = await ApiHelper.createSessionWithLogin(/ctx.state.account, ctx.state.pwd);
//    try {
//      result = await _auth.signInWithEmailAndPassword(
//          email: ctx.state.account, password: ctx.state.pwd);
//    } on Exception catch (e) {
//      Toast.show(e.toString(), ctx.context, duration: 3, gravity: Toast.BOTTOM);
//      ctx.state.submitAnimationController.reverse();
//    }
//  }
//  if (result?.user == null) {
//    Toast.show("Account verification required", ctx.context,
//        duration: 3, gravity: Toast.BOTTOM);
//    ctx.state.submitAnimationController.reverse();
//  } else {
//    GlobalStore.store.dispatch(GlobalActionCreator.setUser(result?.user));
//    Navigator.of(ctx.context).pop(true);
//  }
}

