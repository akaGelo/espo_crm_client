import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:espo_crm_client/actions/Adapt.dart';
import 'package:espo_crm_client/customwidgets/keepalive_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MainPageState state, Dispatch dispatch, ViewService viewService) {
  return Builder(
    builder: (context) {
      final pageController = PageController();
      final _lightTheme = ThemeData.light().copyWith(
          backgroundColor: Colors.white,
          tabBarTheme: TabBarTheme(
              labelColor: Color(0XFF505050),
              unselectedLabelColor: Colors.grey));
      final _darkTheme = ThemeData.dark().copyWith(
          backgroundColor: Color(0xFF303030),
          tabBarTheme: TabBarTheme(
              labelColor: Colors.white, unselectedLabelColor: Colors.grey));
      final MediaQueryData _mediaQuery = MediaQuery.of(context);
      final ThemeData _theme =
          _mediaQuery.platformBrightness == Brightness.light
              ? _lightTheme
              : _darkTheme;
      Widget _buildPage(Widget page) {
        return KeepAliveWidget(page);
      }

      return Scaffold(
        body: PageView(
          physics: ClampingScrollPhysics(),
          children: state.pages.map(_buildPage).toList(),
          controller: pageController,
          onPageChanged: (int i) =>
              dispatch(MainPageActionCreator.onTabChanged(i)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _theme.backgroundColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, key: Key("testKey"), size: Adapt.px(44)),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation, size: Adapt.px(44)),
              title: Text("Home2"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: Adapt.px(44)),
              title: Text("Home3"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: Adapt.px(44),
              ),
              title: Text("acc"),
            ),
          ],
          currentIndex: state.selectedIndex,
          selectedItemColor: _theme.tabBarTheme.labelColor,
          unselectedItemColor: _theme.tabBarTheme.unselectedLabelColor,
          onTap: (int index) {
            pageController.jumpToPage(index);
          },
          type: BottomNavigationBarType.fixed,
        ),
      );
    },
  );
}
