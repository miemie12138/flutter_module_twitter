#import "TwitterPlugin.h"
#if __has_include(<twitter/twitter-Swift.h>)
#import <twitter/twitter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "twitter-Swift.h"
#endif

@implementation TwitterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTwitterPlugin registerWithRegistrar:registrar];
}
@end
