import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_user.g.dart';

@JsonSerializable()
class Credentials {
  String baseUrl;
  String username;
  String password;

  Credentials();

  Credentials.simple(
      {@required this.baseUrl,
      @required this.username,
      @required this.password});


  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsToJson(this);

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
