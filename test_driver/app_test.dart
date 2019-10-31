// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Global integration test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Health test', () async {
      Health health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });
  });
}
