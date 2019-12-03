#import <Flutter/Flutter.h>

@interface YyFlutterRouterPlugin : NSObject<FlutterPlugin, FlutterStreamHandler>

+ (instancetype)sharedInstance;

- (void)prepareEngineIfNeeded;

+ (FlutterViewController *)shareHost;

@end
