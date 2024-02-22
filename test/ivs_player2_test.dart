import 'package:flutter_test/flutter_test.dart';
import 'package:ivs_player2/ivs_player2.dart';
import 'package:ivs_player2/ivs_player2_platform_interface.dart';
import 'package:ivs_player2/ivs_player2_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIvsPlayer2Platform
    with MockPlatformInterfaceMixin
    implements IvsPlayer2Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IvsPlayer2Platform initialPlatform = IvsPlayer2Platform.instance;

  test('$MethodChannelIvsPlayer2 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIvsPlayer2>());
  });

  test('getPlatformVersion', () async {
    IvsPlayer2 ivsPlayer2Plugin = IvsPlayer2();
    MockIvsPlayer2Platform fakePlatform = MockIvsPlayer2Platform();
    IvsPlayer2Platform.instance = fakePlatform;

    expect(await ivsPlayer2Plugin.getPlatformVersion(), '42');
  });
}
