import 'dart:convert';

import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _key = 'credentials';

//TODO move to global store

Future<Credentials> loadUser() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var credentials = prefs.getString(_key);
    var json = jsonDecode(credentials);
    return Future.value(Credentials.fromJson(json));
  } catch (e) {
    return Future.value(null);
  }
}

Future<bool> saveUser(Credentials user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(_key, jsonEncode(user.toJson()));
}
