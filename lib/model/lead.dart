import 'package:espo_crm_client/model/contacts_fields.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lead.g.dart';

@JsonSerializable()
class Lead {
  String id;

  String name;
  String phone;
  String emailAddress;


  Lead();

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);

  Map<String, dynamic> toJson() => _$LeadToJson(this);
}

@JsonSerializable()
class FullLead extends Lead {
  List<EmailAddressData> emailAddressData;
  List<PhoneNumberData> phoneNumberData;


  FullLead();

  factory FullLead.fromJson(Map<String, dynamic> json) =>
      _$FullLeadFromJson(json);

  Map<String, dynamic> toJson() => _$FullLeadToJson(this);
}
