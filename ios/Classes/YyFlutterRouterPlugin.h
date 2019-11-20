#import <Flutter/Flutter.h>

@interface YyFlutterRouterPlugin : NSObject<FlutterPlugin>

+ (instancetype)sharedInstance;

- (void)prepareEngineIfNeeded;

@end
