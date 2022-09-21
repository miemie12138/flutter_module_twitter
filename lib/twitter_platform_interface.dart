import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'twitter_method_channel.dart';

abstract class TwitterPlatform extends PlatformInterface {
  /// Constructs a TwitterPlatform.
  TwitterPlatform() : super(token: _token);

  static final Object _token = Object();

  static TwitterPlatform _instance = MethodChannelTwitter();

  /// The default instance of [TwitterPlatform] to use.
  ///
  /// Defaults to [MethodChannelTwitter].
  static TwitterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TwitterPlatform] when
  /// they register themselves.
  static set instance(TwitterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
