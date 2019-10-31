// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lead _$LeadFromJson(Map<String, dynamic> json) {
  return Lead()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..emailAddress = json['emailAddress'] as String;
}

Map<String, dynamic> _$LeadToJson(Lead instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'emailAddress': instance.emailAddress,
    };

FullLead _$FullLeadFromJson(Map<String, dynamic> json) {
  return FullLead()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..emailAddress = json['emailAddress'] as String
    ..emailAddressData = (json['emailAddressData'] as List)
        ?.map((e) => e == null
            ? null
            : EmailAddressData.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..phoneNumberData = (json['phoneNumberData'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FullLeadToJson(FullLead instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'emailAddress': instance.emailAddress,
      'emailAddressData': instance.emailAddressData,
      'phoneNumberData': instance.phoneNumberData,
    };
