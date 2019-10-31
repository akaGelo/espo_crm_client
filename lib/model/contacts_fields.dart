import 'package:json_annotation/json_annotation.dart';

part 'contacts_fields.g.dart';

@JsonSerializable()
class EmailAddressData {
  String emailAddress;
  String lower;
  bool primary;
  bool optOut;
  bool invalid;

  EmailAddressData();

  factory EmailAddressData.fromJson(Map<String, dynamic> json) =>
      _$EmailAddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmailAddressDataToJson(this);
}

@JsonSerializable()
class PhoneNumberData {
  String phoneNumber;
  bool primary;
  String type;

  PhoneNumberData();

  factory PhoneNumberData.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberDataFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberDataToJson(this);
}
