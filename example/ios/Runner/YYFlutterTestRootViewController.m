//
//  YYFlutterTestRootViewController.m
//  Runner
//
//  Created by ouzhirui on 2019/11/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "YYFlutterTestRootViewController.h"
#import "YYFlutterContainerView.h"
#import "YYFlutterViewController.h"
#import "UIViewController+YYViewControllers.h"

@interface YYFlutterTestRootViewController ()
{
    int _x;
    int _y;
}

@property (nonatomic, strong) YYFlutterViewController *testViewController;

@end

@implementation YYFlutterTestRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [Twins setReleaseMode:TwinsReleaseModeNonRef];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)]];
    self.title = @"我是原生页面";
    _x = 0;
    _y = 80;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self yy_viewDidAppear];
}

- (void)onTap {
    NSString *page = [self.page isEqualToString:@"A"]?@"B":@"A";
    YYFlutterContainerView *testContainerView = [[YYFlutterContainerView alloc] initWithParams:@{@"page":page, @"count": @(self.count).stringValue}];
    testContainerView.frame = CGRectMake(_x, _y, 120, 120);
    [self.view addSubview:testContainerView];
    _x += 120;
    if (_x > 360) {
        _x = 0;
        _y += 120;
    }
    self.page = page;
}

//- (void)onTap {
//    if (self.testViewController != nil) {
//        return;
//    }
//    static NSString *text = @"A";
//    static int x = 0;
////    static int y = 20 + 44;
//    static int y = 0;
//    self.testViewController = [[YYFlutterViewController alloc] initWithParams:@{@"text": text}];
//    self.testViewController.yy_preferredNavigationBarHidden = YES;
//    //self.testFragment.view.frame = CGRectMake(x, y, 375, 500);
//    [self addChildViewController:self.testViewController];
//    [self.view addSubview:self.testViewController.view];
////    x += 88;
////    if (x > 360) {
////        x = 0;
////        y += 88;
////    }
//    text = [text isEqualToString:@"A"] ? @"B" : @"A";
//}


@end
