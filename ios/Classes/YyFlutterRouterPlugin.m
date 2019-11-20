#import "YyFlutterRouterPlugin.h"
#import "TwinsHostViewController.h"

@implementation YyFlutterRouterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"yy_flutter_router"
            binaryMessenger:[registrar messenger]];
  YyFlutterRouterPlugin* instance = [YyFlutterRouterPlugin sharedInstance];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

#pragma mark -

+ (instancetype)sharedInstance
{
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self.class new];
    });
    
    return _instance;
}

- (void)prepareEngineIfNeeded
{
//    Class GeneratedPluginRegistrant = NSClassFromString(@"GeneratedPluginRegistrant");
    [TwinsHostViewController shared];
//    FlutterEngine *engine = [TwinsHostViewController sharedEngine];
//    if (GeneratedPluginRegistrant != NULL) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//        [GeneratedPluginRegistrant performSelector:@selector(registerWithRegistry:)
//                                        withObject:engine];
//#pragma clang diagnostic pop
//    }
}

@end
