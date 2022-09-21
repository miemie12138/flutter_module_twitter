import 'package:flutter_test/flutter_test.dart';
import 'package:twitter/twitter_platform_interface.dart';
import 'package:twitter/twitter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTwitterPlatform with MockPlatformInterfaceMixin implements TwitterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TwitterPlatform initialPlatform = TwitterPlatform.instance;

  test('$MethodChannelTwitter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTwitter>());
  });

  test('getPlatformVersion', () async {});
}
