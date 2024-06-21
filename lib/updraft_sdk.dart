import 'package:flutter/material.dart';
import 'package:updraft_sdk_flutter/updraft_settings.dart';

import 'updraft_sdk_flutter_platform_interface.dart';

class UpdraftSdk {
  static Future<void> init(UpdraftSettings settings) {
    WidgetsFlutterBinding.ensureInitialized();
    return UpdraftSdkFlutterPlatform.instance.initNativeSdk(settings);
  }
}
