//
//  YYFlutterViewController.m
//  yy_flutter_router
//
//  Created by ouzhirui on 2019/11/20.
//

#import "YYFlutterViewController.h"
#import "UIViewController+YYViewControllers.h"

@interface YYFlutterViewController ()

@end

@implementation YYFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self yy_viewDidAppear];
    [super viewDidAppear:animated];
}



@end
