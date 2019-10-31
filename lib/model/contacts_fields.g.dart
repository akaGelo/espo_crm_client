// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAddressData _$EmailAddressDataFromJson(Map<String, dynamic> json) {
  return EmailAddressData()
    ..emailAddress = json['emailAddress'] as String
    ..lower = json['lower'] as String
    ..primary = json['primary'] as bool
    ..optOut = json['optOut'] as bool
    ..invalid = json['invalid'] as bool;
}

Map<String, dynamic> _$EmailAddressDataToJson(EmailAddressData instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'lower': instance.lower,
      'primary': instance.primary,
      'optOut': instance.optOut,
      'invalid': instance.invalid,
    };

PhoneNumberData _$PhoneNumberDataFromJson(Map<String, dynamic> json) {
  return PhoneNumberData()
    ..phoneNumber = json['phoneNumber'] as String
    ..primary = json['primary'] as bool
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PhoneNumberDataToJson(PhoneNumberData instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'primary': instance.primary,
      'type': instance.type,
    };
