// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return Authorization()
    ..username = json['username'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

LeadsList _$LeadsListFromJson(Map<String, dynamic> json) {
  return LeadsList()
    ..total = json['total'] as int
    ..list = (json['list'] as List)
        ?.map(
            (e) => e == null ? null : Lead.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LeadsListToJson(LeadsList instance) => <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class __RestClient implements _RestClient {
  __RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  @override
  _getLeads(authorization) async {
    ArgumentError.checkNotNull(authorization, 'authorization');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/Lead',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{'Authorization': authorization},
            extra: _extra),
        data: _data);
    final value = LeadsList.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  _getLead(authorization, id) async {
    ArgumentError.checkNotNull(authorization, 'authorization');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/Lead/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{'Authorization': authorization},
            extra: _extra),
        data: _data);
    final value = FullLead.fromJson(_result.data);
    return Future.value(value);
  }
}
