#import "YyFlutterRouterPlugin.h"
#import "TwinsHostViewController.h"

@interface YyFlutterRouterPlugin ()

@property (nonatomic, strong) FlutterEventSink eventSinkHandler;

@end

@implementation YyFlutterRouterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"yy_flutter_router"
            binaryMessenger:[registrar messenger]];
  YyFlutterRouterPlugin* instance = [YyFlutterRouterPlugin sharedInstance];
  [registrar addMethodCallDelegate:instance channel:channel];

    FlutterEventChannel *eventChannel =
    [FlutterEventChannel eventChannelWithName:@"yy_flutter_router_event"
                              binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

#pragma mark - FlutterStreamHandler

- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink
{
    self.eventSinkHandler = eventSink;
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments
{
    self.eventSinkHandler = nil;
    return nil;
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

+ (FlutterViewController *)shareHost
{
    return [TwinsHostViewController shared];
}

@end
