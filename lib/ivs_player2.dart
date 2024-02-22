

import 'package:flutter/services.dart';

class IvsPlayer2 {
  static const MethodChannel _channel = MethodChannel('ivs_player2');

  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> playStream(String url) async {
    return await _channel.invokeMethod('playStream', <String, dynamic>{
      'url': url,
    });
  }
}
