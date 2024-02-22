import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ivs_player2_method_channel.dart';

abstract class IvsPlayer2Platform extends PlatformInterface {
  /// Constructs a IvsPlayer2Platform.
  IvsPlayer2Platform() : super(token: _token);

  static final Object _token = Object();

  static IvsPlayer2Platform _instance = MethodChannelIvsPlayer2();

  /// The default instance of [IvsPlayer2Platform] to use.
  ///
  /// Defaults to [MethodChannelIvsPlayer2].
  static IvsPlayer2Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IvsPlayer2Platform] when
  /// they register themselves.
  static set instance(IvsPlayer2Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
