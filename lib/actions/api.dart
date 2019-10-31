import 'dart:convert';

import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:espo_crm_client/model/lead.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

part 'api.g.dart';

///for generate run:
///```
///$ flutter pub run build_runner build
///```

class RestClient extends __RestClient {
  RestClient(Dio dio) : super(dio);

  Future<LeadsList> getLeads(FirebaseUser authorization) =>
      _getLeads(basicAuthenticationHeader(authorization));

  Future<FullLead> getLead(FirebaseUser authorization, String id) =>
      _getLead(basicAuthenticationHeader(authorization), id);

  String basicAuthenticationHeader(FirebaseUser user) {
    //костылик конечно, но нужно, что бы было удобно задавать в пользователе хост crm
    _dio.options.baseUrl = user.baseUrl;
    var credentials = '${user.username}:${user.password}';
    return 'Basic ' + base64Encode(utf8.encode(credentials));
  }
}

@RestApi()
abstract class _RestClient {
  factory _RestClient(Dio dio) = __RestClient;

  @GET("/Lead")
  Future<LeadsList> _getLeads(@Header("Authorization") String authorization);

  @GET("/Lead/{id}")
  Future<FullLead> _getLead(
      @Header("Authorization") String authorization, @Path("id") String id);

//  @Headers(<String, String>{"accept": "image/jpeg"})
//  @GET("http://httpbin.org/image/jpeg")
//  @DioResponseType(ResponseType.bytes)
//  Future<List<int>> getFile();
}

@JsonSerializable()
class Authorization {
  String username;
  String password;

  Authorization();

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);
}

class _PageResponse<T> {
  int total;
  List<T> list;
}

@JsonSerializable()
class LeadsList extends _PageResponse<Lead> {
  LeadsList();

  factory LeadsList.fromJson(Map<String, dynamic> json) =>
      _$LeadsListFromJson(json);

  Map<String, dynamic> toJson() => _$LeadsListToJson(this);
}
