import 'package:dio/dio.dart' hide Headers;
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:espo_crm_client/actions/api.dart';
import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

const baseUrl = "https://demo2.espocrm.com";
final demoCredentials =
    Credentials.simple(baseUrl: baseUrl, username: "admin", password: "1");

final logger = Logger();

void main() {
  final client = RestClient();

  test('Get User', () async {
    var user = await client.getUserProfile(demoCredentials);

    expect(user.name, isNotEmpty);
    expect(user, isNotNull);
  });

  test('Get User 401', () async {
    final wrongCredentials =
        Credentials.simple(baseUrl: baseUrl, username: "wrong", password: "1");
    try {
      await client.getUserProfile(wrongCredentials);
      fail("exception not thrown");
    } on DioError catch (e) {
      expect(e.response.statusCode, 401);
    } catch (e) {
      fail("unxpected catch");
    }
  });

  test('Leads', () async {
    var list = await client.getLeads(demoCredentials);

    expect(list.list, isNotEmpty);
    expect(list.total, isPositive);
  });

  test('Full lead', () async {
    var lead = await client.getLead(demoCredentials, "53203b942952a");

    expect(lead.name, isNotEmpty);
  });
}
