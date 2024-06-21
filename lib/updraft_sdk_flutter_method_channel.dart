import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:updraft_sdk_flutter/updraft_settings.dart';

import 'updraft_sdk_flutter_platform_interface.dart';

/// An implementation of [UpdraftSdkFlutterPlatform] that uses method channels.
class MethodChannelUpdraftSdkFlutter extends UpdraftSdkFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('updraft_sdk_flutter');

  @override
  Future<void> initNativeSdk(UpdraftSettings settings) async {
    final version = await methodChannel.invokeMethod('initNativeSdk', settings.toMap());
    return version;
  }
}
