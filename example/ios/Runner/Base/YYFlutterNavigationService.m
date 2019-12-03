//
//  YYFlutterNavigationService.m
//  Pods
//
//  Created by ouzhirui on 2019/11/28.
//

#import "YYFlutterNavigationService.h"
#import "YYFlutterTestRootViewController.h"
#import "YYFlutterViewController.h"

@interface YYFlutterNavigationService ()

@property (nonatomic, copy) FlutterEventSink eventSinkHandler;

@end

@implementation YYFlutterNavigationService

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar
{
    YYFlutterNavigationService *instance = [[self alloc] init];
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"plugins.yymobile/NavigationPluginMethod"
                                                      binaryMessenger:[registrar messenger]];
    
    [registrar addMethodCallDelegate:instance channel:channel];
    
    FlutterEventChannel *eventChannel =
    [FlutterEventChannel eventChannelWithName:@"plugins.yymobile/NavigationPluginEvent"
                              binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:instance];
}

- (void)openPage:(NSString *)name
          params:(NSDictionary *)params
        animated:(BOOL)animated
      completion:(void (^)(BOOL))completion
{
    
}

- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    
}

#pragma mark -

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result
{
    NSString *method = call.method;
    NSDictionary *arguments = call.arguments;
    if ([method isEqualToString:@"openPage"] && [arguments isKindOfClass:NSDictionary.class]) {
        NSUInteger count = [arguments[@"count"] unsignedIntegerValue];
        if (count % 3 == 0) {
            YYFlutterTestRootViewController *vc = [YYFlutterTestRootViewController new];
            vc.count = count;
            vc.page = arguments[@"page"];
            [self.navigationController pushViewController:vc animated:YES];
        }else
        {
            YYFlutterViewController *testViewController =  [[YYFlutterViewController alloc] initWithParams:@{
                @"count":@(count),
                @"page":arguments[@"page"],
                @"appBar":@1
            }];
            testViewController.yy_preferredNavigationBarHidden = YES;
            //self.testFragment.view.frame = CGRectMake(x, y, 375, 500);
            [self.navigationController pushViewController:testViewController animated:YES];
        }
        result(@0);
    } else if ([method isEqualToString:@"pop"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
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

- (UINavigationController *)navigationController
{
    UIViewController *vc = [YYFlutterNavigationService currentViewController];
    if ([vc isKindOfClass:UINavigationController.class]) {
        return (UINavigationController *)vc;
    } else {
        return vc.navigationController;
    }
}

+ (UIViewController *)currentViewController
{
    UIViewController *vc = [self currentVisiableRootViewController];

    if ([vc isKindOfClass:[UINavigationController class]]) {
        vc = [(UINavigationController *)vc topViewController];
    }

    if ([vc isKindOfClass:[UITabBarController class]]) {

        UIViewController *tVc = [(UITabBarController *)vc selectedViewController];
        if ([tVc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)tVc topViewController];
        } else {
            vc = tVc;
        }
    }

    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }

    return vc;
}

+ (UIViewController *)currentVisiableRootViewController
{
    __block UIViewController *result = nil;
    // Try to find the root view controller programmically
    // Find the top window (that is not an alert view or other window)
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    if (topWindow.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (topWindow in windows) {
            if (topWindow.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }

    NSArray *windowSubviews = [topWindow subviews];

    [windowSubviews
        enumerateObjectsWithOptions:NSEnumerationReverse
                         usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                             UIView *rootView = obj;

                             if ([NSStringFromClass([rootView class]) isEqualToString:@"UITransitionView"]) {

                                 NSArray *aSubViews = rootView.subviews;

                                 [aSubViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                     UIView *tempView = obj;

                                     id nextResponder = [tempView nextResponder];

                                     if ([nextResponder isKindOfClass:[UIViewController class]]) {
                                         result = nextResponder;
                                         *stop = YES;
                                     }
                                 }];
                                 *stop = YES;
                             } else {

                                 id nextResponder = [rootView nextResponder];

                                 if ([nextResponder isKindOfClass:[UIViewController class]]) {
                                     result = nextResponder;
                                     *stop = YES;
                                 }
                             }
                         }];

    if (result == nil && [topWindow respondsToSelector:@selector(rootViewController)] &&
        topWindow.rootViewController != nil) {
        if ([topWindow.rootViewController isKindOfClass:[UITabBarController class]]) {
            result = topWindow.rootViewController;
        }else if ([topWindow.rootViewController isKindOfClass:[UINavigationController class]]) {
            result = topWindow.rootViewController;
        }
    }

    return result;
}


@end
