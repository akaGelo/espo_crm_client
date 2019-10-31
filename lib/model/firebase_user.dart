import 'package:flutter/cupertino.dart';

/**
 * TODO Потом переименовать
 */
class FirebaseUser {
  String baseUrl;
  String username;
  String password;

  FirebaseUser.simple(this.baseUrl, this.username, this.password);

  String displayName;
  String photoUrl;
}
