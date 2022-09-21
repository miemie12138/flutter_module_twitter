import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'twitter_platform_interface.dart';

/// An implementation of [TwitterPlatform] that uses method channels.
class MethodChannelTwitter extends TwitterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('twitter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
