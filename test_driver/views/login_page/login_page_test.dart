// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Authorize', () {
    final errorMessage = find.byValueKey('login_page_erro_message');

    final hostField = find.byValueKey('login_page_url');
    final usernameField = find.byValueKey('login_page_login');
    final passwordField = find.byValueKey('login_page_password');

    final loginButton = find.byValueKey('login_page_password');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      Health health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Wrong password', () async {
      await driver.tap(hostField);
      await driver.enterText("demo2.espocrm.com");

      await driver.tap(usernameField);
      await driver.enterText("wrong");

      await driver.tap(passwordField);
      await driver.enterText("wrongPass");

      await driver.tap(loginButton);

      var s = await driver.getText(errorMessage);
      expect(s, "Wrong credentials");
      await driver.waitFor(loginButton);
    });

    test('Success password', () async {
//      await driver.tap(hostField);
//      await driver.enterText("demo2.espocrm.com");
//
//      await driver.tap(usernameField);
//      await driver.enterText("\b\b\b\b\b");
//      await driver.enterText("admin");
//
//      await driver.tap(passwordField);
//      await driver.enterText("\b\b\b\b\b\b\b\b");
//      await driver.enterText("1");
//
//      await driver.tap(loginButton);
//
//      await driver.waitForAbsent(errorMessage);
    });
  });
}
