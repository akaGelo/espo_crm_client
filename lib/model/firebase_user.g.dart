// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
