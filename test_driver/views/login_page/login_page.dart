import 'package:espo_crm_client/app.dart';
import 'package:espo_crm_client/globalbasestate/state.dart';
import 'package:espo_crm_client/globalbasestate/store.dart';
import 'package:espo_crm_client/views/login_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

import '../../test_utils.dart';

Future main() async {
  enableFlutterDriverExtension();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(await createTestApp('loginpage'));
}

