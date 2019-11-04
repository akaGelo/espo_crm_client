import 'package:flutter/material.dart';

import 'app.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;


Future main() async {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await createApp());
}
