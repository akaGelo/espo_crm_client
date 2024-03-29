import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:espo_crm_client/actions/adapt.dart';
import 'package:espo_crm_client/customwidgets/customcliper_path.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LoginPageState state, Dispatch dispatch, ViewService viewService) {
  double headerHeight = Adapt.screenH() / 3;
  Widget _buildHeader() {
    return ClipPath(
      clipper: CustomCliperPath(
          height: headerHeight, width: Adapt.screenW(), radius: Adapt.px(1000)),
      child: Container(
          height: headerHeight,
          width: Adapt.screenW(),
          alignment: Alignment.center,
          child: Container(
            color: Color.fromRGBO(20, 20, 20, 0.8),
            alignment: Alignment.center,
            height: headerHeight,
            width: Adapt.screenW(),
            child: SlideTransition(
                position: Tween(begin: Offset(0, -1), end: Offset.zero)
                    .animate(CurvedAnimation(
                  parent: state.animationController,
                  curve: Interval(
                    0.0,
                    0.4,
                    curve: Curves.ease,
                  ),
                )),
                child: Image.asset(
                  'images/espocrm.png',
                  width: Adapt.px(150),
                  height: Adapt.px(150),
                )),
          )),
    );
  }

  Widget _buildAppbar() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }

  Widget _buildErrorMessage() {
    var submitWidth = CurvedAnimation(
      parent: state.errorMessageAnimationController,
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.ease,
      ),
    );

    return new AnimatedBuilder(
      animation: state.errorMessageAnimationController,
      builder: (ctx, w) {
        double buttonWidth = Adapt.screenW() * 0.8;
        return Container(
          margin: EdgeInsets.only(top: Adapt.px(20)),
          child: Container(
            width: buttonWidth,
            child: Center(
                child: Text(
              state.errorMessage,
              style: TextStyle(
                  color: ColorTween(
                          begin: Colors.transparent, end: Colors.redAccent)
                      .animate(submitWidth)
                      .value),
            )),
          ),
        );
      },
    );
  }

  Widget _buildSubmit() {
    var submitWidth = CurvedAnimation(
      parent: state.submitAnimationController,
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.ease,
      ),
    );
    return new AnimatedBuilder(
      animation: state.submitAnimationController,
      builder: (ctx, w) {
        double buttonWidth = Adapt.screenW() * 0.8;
        return Container(
          margin: EdgeInsets.only(top: Adapt.px(20)),
          height: Adapt.px(100),
          child: Stack(
            children: <Widget>[
              Container(
                height: Adapt.px(100),
                width: Tween<double>(begin: buttonWidth, end: Adapt.px(100))
                    .animate(submitWidth)
                    .value,
                child: FlatButton(
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Adapt.px(50))),
                  child: Text('Sign In',
                      key: const ValueKey("testKeyMy"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Tween<double>(begin: Adapt.px(35), end: 0.0)
                              .animate(submitWidth)
                              .value)),
                  onPressed: () =>
                      dispatch(LoginPageActionCreator.onLoginClicked()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoginBody() {
    var cardCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0,
        0.4,
        curve: Curves.ease,
      ),
    );
    var accountCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.3,
        0.5,
        curve: Curves.ease,
      ),
    );
    var passwordCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.ease,
      ),
    );
    var submitCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.ease,
      ),
    );

    return Center(
      child: SlideTransition(
        position:
            Tween(begin: Offset(0, 1), end: Offset.zero).animate(cardCurve),
        child: Card(
          elevation: 10,
          child: Container(
            height: Adapt.screenH() / 2,
            width: Adapt.screenW() * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset.zero)
                      .animate(accountCurve),
                  child: FadeTransition(
                      opacity:
                          Tween(begin: 0.0, end: 1.0).animate(accountCurve),
                      child: Padding(
                        padding: EdgeInsets.all(Adapt.px(40)),
                        child: TextField(
                          key: Key("login_page_url"),
                          focusNode: state.urlFocusNode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: Adapt.px(35)),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              hintText: 'Url',
                              hasFloatingPlaceholder: true,
                              filled: true,
                              prefixStyle: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(35)),
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black87))),
                          onChanged: (String t) =>
                              dispatch(LoginPageActionCreator.onUrlChange(t)),
                          onSubmitted: (s) {
                            state.urlFocusNode.nextFocus();
                          },
                        ),
                      )),
                ),
                SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset.zero)
                      .animate(accountCurve),
                  child: FadeTransition(
                      opacity:
                          Tween(begin: 0.0, end: 1.0).animate(accountCurve),
                      child: Padding(
                        padding: EdgeInsets.all(Adapt.px(40)),
                        child: TextField(
                          key: Key("login_page_login"),
                          focusNode: state.accountFocusNode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: Adapt.px(35)),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              hintText: 'Account',
                              hasFloatingPlaceholder: true,
                              filled: true,
                              prefixStyle: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(35)),
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black87))),
                          onChanged: (String t) => dispatch(
                              LoginPageActionCreator.onAccountChange(t)),
                          onSubmitted: (s) {
                            state.accountFocusNode.nextFocus();
                          },
                        ),
                      )),
                ),
                SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset.zero)
                        .animate(passwordCurve),
                    child: FadeTransition(
                        opacity:
                            Tween(begin: 0.0, end: 1.0).animate(passwordCurve),
                        child: Padding(
                          padding: EdgeInsets.all(Adapt.px(40)),
                          child: TextField(
                            key: Key("login_page_password"),
                            focusNode: state.pwdFocusNode,
                            style: TextStyle(
                                color: Colors.black, fontSize: Adapt.px(35)),
                            cursorColor: Colors.black,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: 'PassWord',
                                hasFloatingPlaceholder: true,
                                filled: true,
                                prefixStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: Adapt.px(35)),
                                focusedBorder: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black87))),
                            onChanged: (String t) =>
                                dispatch(LoginPageActionCreator.onPwdChange(t)),
                            onSubmitted: (s) => dispatch(
                                LoginPageActionCreator.onLoginClicked()),
                          ),
                        ))),
                SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset.zero)
                        .animate(submitCurve),
                    child: FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(submitCurve),
                      child: _buildErrorMessage(),
                    )),
                SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset.zero)
                        .animate(submitCurve),
                    child: FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(submitCurve),
                      child: _buildSubmit(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  return Scaffold(
    body: Stack(
      children: <Widget>[
        _buildHeader(),
        _buildLoginBody(),
        Container(
            height: Adapt.screenH(),
            width: Adapt.screenW(),
            padding: EdgeInsets.only(bottom: Adapt.px(20)),
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: state.animationController,
                    curve: Interval(
                      0.7,
                      1.0,
                      curve: Curves.ease,
                    ),
                  )),
                  child: Text(
                    'Espo Crm Client',
                  )),
            )),
        _buildAppbar()
      ],
    ),
  );
}
