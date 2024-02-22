import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ivs_player2_platform_interface.dart';

/// An implementation of [IvsPlayer2Platform] that uses method channels.
class MethodChannelIvsPlayer2 extends IvsPlayer2Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ivs_player2');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
