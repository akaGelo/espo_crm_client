import 'dart:convert';

import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
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
  RestClient() : super(_defaultDio());

  Future<UserProfile> getUserProfile(FirebaseUser user) =>
      _getUserProfile(basicAuthenticationHeader(user))
          .then((ur) => Future.value(ur.user));

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

  static Dio _defaultDio() {
    final dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.transformer = FlutterTransformer();
    return dio;
  }
}

@RestApi()
abstract class _RestClient {
  factory _RestClient(Dio dio) = __RestClient;

  @GET("/api/v1/App/user")
  Future<UserResponse> _getUserProfile(
      @Header("Authorization") String authorization);

  @GET("/api/v1/Lead")
  Future<LeadsList> _getLeads(@Header("Authorization") String authorization,
      {int offset = 0,
      int maxSize = 20,
      String sortBy = "createdAt&order=desc",
      bool asc = true});

  @GET("/api/v1/Lead/{id}")
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

@JsonSerializable()
class UserResponse {
  UserProfile user;

  UserResponse();

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
