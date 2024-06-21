import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'updraft_sdk_flutter_method_channel.dart';
import 'updraft_settings.dart';

abstract class UpdraftSdkFlutterPlatform extends PlatformInterface {
  /// Constructs a UpdraftSdkFlutterPlatform.
  UpdraftSdkFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static UpdraftSdkFlutterPlatform _instance = MethodChannelUpdraftSdkFlutter();

  /// The default instance of [UpdraftSdkFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelUpdraftSdkFlutter].
  static UpdraftSdkFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UpdraftSdkFlutterPlatform] when
  /// they register themselves.
  static set instance(UpdraftSdkFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initNativeSdk(UpdraftSettings settings) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
