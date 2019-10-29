import 'package:cached_network_image/cached_network_image.dart';
import 'package:espo_crm_client/actions/Adapt.dart';
import 'package:espo_crm_client/customwidgets/customcliper_path.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AccountPageState state, Dispatch dispatch, ViewService viewService) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(statusBarBrightness: Brightness.light));

  Widget _buildTapCell(String name, double begin, double end, void ontap()) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
          .animate(CurvedAnimation(
              parent: state.animationController,
              curve: Interval(
                begin,
                end,
                curve: Curves.ease,
              ))),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Adapt.px(40))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: ontap,
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Container(
        width: Adapt.screenW(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(Adapt.px(30)),
              width: Adapt.px(180),
              height: Adapt.px(180),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          state.avatar ??
                              'https://en.gravatar.com/userimage/159547793/1e81c1798f922e37511065a9c301fed9.jpg?size=200',
                          errorListener: () {}),
                      fit: BoxFit.cover),
                  border: Border.all(width: Adapt.px(8), color: Colors.white),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(Adapt.px(90))),
            ),
            Text(state.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Adapt.px(50),
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  return Scaffold(
    body: AnimatedSwitcher(
        switchOutCurve: Curves.easeOut,
        switchInCurve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        child: Container(
          key: ValueKey('theme1'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                  clipper: CustomCliperPath(
                      height: Adapt.px(450),
                      width: Adapt.screenW(),
                      radius: Adapt.px(2000)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: Adapt.screenW(),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black, BlendMode.color),
                              image: CachedNetworkImageProvider(
                                  'https://image.tmdb.org/t/p/w500_and_h282_face/9xzZBZ5VhIIhyKDKK3t89ggx7cS.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: Adapt.px(450),
                          child: Container(
                            color: Color.fromRGBO(43, 58, 66, 0.9),
                            child: _buildHeader(),
                          )),
                      SafeArea(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Adapt.px(20)),
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () => dispatch(
                                        AccountPageActionCreator.themeChange()),
                                    icon: Icon(
                                      Icons.track_changes,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (state.islogin)
                                        dispatch(AccountPageActionCreator
                                            .onLogout());
                                      else
                                        dispatch(
                                            AccountPageActionCreator.onLogin());
                                    },
                                    icon: Icon(
                                      state.islogin
                                          ? Icons.exit_to_app
                                          : Icons.person_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )))
                    ],
                  )),
              _buildTapCell(
                  "Sync contacts",
                  0,
                  0.2,
                  () => dispatch(AccountPageActionCreator.navigatorPush(
                      'WatchlistPage',
                      arguments: {'accountid': state.acountIdV3}))),
              _buildTapCell(
                  "Open Browser",
                  0.1,
                  0.3,
                  () => dispatch(AccountPageActionCreator.navigatorPush(
                      'MyListsPage',
                      arguments: {'accountid': state.acountIdV4}))),
            ],
          ),
        )),
  );
}
