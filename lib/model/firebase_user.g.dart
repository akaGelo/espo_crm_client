// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return Credentials()
    ..baseUrl = json['baseUrl'] as String
    ..username = json['username'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'username': instance.username,
      'password': instance.password,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile()
    ..name = json['name'] as String
    ..userName = json['userName'] as String
    ..emailAddress = json['emailAddress'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..avatarId = json['avatarId'] as String;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userName': instance.userName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'avatarId': instance.avatarId,
    };
