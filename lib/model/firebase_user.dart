import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_user.g.dart';

/// TODO Потом переименовать
class FirebaseUser {
  String baseUrl;
  String username;
  String password;

  FirebaseUser(
      {@required this.baseUrl,
      @required this.username,
      @required this.password});

  String displayName;
  String photoUrl;
}

@JsonSerializable()
class UserProfile {
  String name;
  String userName;
  String emailAddress;
  String phoneNumber;
  String avatarId;

  UserProfile();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
