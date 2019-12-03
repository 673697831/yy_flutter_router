#include "AppDelegate.h"
#import "YYFlutterTestRootViewController.h"
#import "YYFlutterNavigationService.h"
#import "YyFlutterRouterPlugin.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [YYFlutterNavigationService registerWithRegistrar:[[YyFlutterRouterPlugin shareHost] registrarForPlugin:@"YYFlutterNavigationService"]];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:[[UINavigationController alloc] initWithRootViewController:[[YYFlutterTestRootViewController alloc] init]]];
    [self.window makeKeyAndVisible];
    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.window setRootViewController:[[YYFlutterTestRootViewController alloc] init]];
//    [self.window makeKeyAndVisible];
    return YES;
}

@end
