import 'dart:convert';
import 'package:crypto/crypto.dart';

String asGravatarUrl(String email) {
  var hash = md5.convert(utf8.encode(email)).toString();
  return "https://www.gravatar.com/avatar/$hash";
}
