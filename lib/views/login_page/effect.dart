import 'package:espo_crm_client/actions/api.dart';
import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'package:espo_crm_client/customwidgets/custom_stfstate.dart';
import 'package:espo_crm_client/globalbasestate/action.dart';
import 'package:espo_crm_client/globalbasestate/store.dart';
import 'package:retrofit/http.dart';
import 'action.dart';
import 'state.dart';
import 'package:toast/toast.dart';

Effect<LoginPageState> buildEffect() {
  return combineEffects(<Object, Effect<LoginPageState>>{
    LoginPageAction.urlChanged: _onValueChange,
    LoginPageAction.accoutChanged: _onValueChange,
    LoginPageAction.pwdChanged: _onValueChange,
    LoginPageAction.loginclicked: _onLoginClicked,
    Lifecycle.initState: _onInit,
    Lifecycle.build: _onBuild,
    Lifecycle.dispose: _onDispose,
  });
}

//final FirebaseAuth _auth = FirebaseAuth.instance;

final RestClient _api = new RestClient();

void _onInit(Action action, Context<LoginPageState> ctx) {
  ctx.state.accountFocusNode = FocusNode();
  ctx.state.pwdFocusNode = FocusNode();
  final ticker = ctx.stfState as CustomstfState;
  ctx.state.animationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 2000));
  ctx.state.submitAnimationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 1000));

  ctx.state.errorMessageAnimationController = AnimationController(
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
  ctx.state.errorMessageAnimationController.dispose();
}

bool _onValueChange(Action action, Context<LoginPageState> ctx) {
  ctx.state.errorMessageAnimationController.reverse();
  return false;
}

Future _onLoginClicked(Action action, Context<LoginPageState> ctx) async {
//  _api.getUserProfile(user)

  ctx.state.errorMessageAnimationController.reverse();
  ctx.state.submitAnimationController.forward();

  try {
    await _api.getUserProfile(FirebaseUser(
        baseUrl: ctx.state.url,
        username: ctx.state.account,
        password: ctx.state.pwd));
  } on Exception catch (e) {
    Future.delayed(Duration(seconds: 1), () {
      ctx.dispatch(LoginPageActionCreator.onErrorMessage("Login problem"));
      ctx.state.submitAnimationController.reverse();
      ctx.state.errorMessageAnimationController.forward();
    });
  }

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
