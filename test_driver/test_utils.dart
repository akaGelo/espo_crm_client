import 'package:espo_crm_client/app.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<Widget> createTestApp(String page) async {
  final AbstractRoutes routes = pages();

  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();


  return MaterialApp(
    title: 'Test',
    debugShowCheckedModeBanner: false,
    theme: _lightTheme,
    darkTheme: _darkTheme,
    home: routes.buildPage(page, <String, dynamic>{}),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
