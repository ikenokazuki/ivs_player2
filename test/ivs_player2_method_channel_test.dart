import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ivs_player2/ivs_player2_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelIvsPlayer2 platform = MethodChannelIvsPlayer2();
  const MethodChannel channel = MethodChannel('ivs_player2');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
