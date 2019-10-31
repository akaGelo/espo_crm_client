import 'package:dio/dio.dart' hide Headers;
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:espo_crm_client/actions/api.dart';
import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

const baseUrl = "https://demo2.espocrm.com/api/v1";
final demoCredentials = FirebaseUser.simple(baseUrl, "admin", "1");

final logger = Logger();

void main() {
  final client = RestClient(dio());

  test('Leads', () async {
    var list = await client.getLeads(demoCredentials);

    expect(list.list, isNotEmpty);
    expect(list.total, isPositive);
  });
  test('Full lead', () async {
    var lead = await client.getLead(demoCredentials, "53203b942952a");

    expect(lead.name, isNotEmpty);
  });

  test('Wrong login', () async {
    final wrongCredentials = FirebaseUser.simple(baseUrl, "wrong", "1");
    try {
      await client.getLeads(wrongCredentials);
      fail("exception not thrown");
    } on DioError catch (e) {
      expect(e.response.statusCode, 401);
    } catch (e) {
      fail("unxpected catch");
    }
  });
}

Dio dio() {
  final dio = Dio();
  dio.options.headers["Content-Type"] = "application/json";
//  dio.transformer = FlutterTransformer();
  return dio;
}
