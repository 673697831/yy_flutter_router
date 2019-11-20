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

@interface YYFlutterTestRootViewController ()

@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong) YYFlutterViewController *testViewController;
@property (nonatomic, strong) TwinsFragment *testFragment2;
@property (nonatomic, strong) TwinsFragment *testFragment3;

@end

@implementation YYFlutterTestRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [Twins setReleaseMode:TwinsReleaseModeNonRef];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)]];
    [self onTap];
}

//- (void)onTap {
//    static NSString *text = @"A";
//    static int x = 0;
//    static int y = 80;
//    YYFlutterContainerView *testContainerView = [[YYFlutterContainerView alloc] initWithParams:@{@"text": text}];
//    testContainerView.frame = CGRectMake(x, y, 120, 120);
//    [self.view addSubview:testContainerView];
//    x += 120;
//    if (x > 360) {
//        x = 0;
//        y += 120;
//    }
//    text = [text isEqualToString:@"A"] ? @"B" : @"A";
//}

- (void)onTap {
    if (self.testFragment != nil) {
        TwinsDialog *dialog = [[TwinsDialog alloc] initWithParams:@{@"text": @"dialog"}];
        [dialog showInViewController:self];
//        [self.navigationController pushViewController:[TestViewController new] animated:YES];
        return;
    }
    [self.navigationController setNavigationBarHidden:YES];
    static NSString *text = @"A";
    static int x = 0;
//    static int y = 20 + 44;
    static int y = 0;
    self.testFragment = [[TwinsFragmentViewController alloc] initWithParams:@{@"text": text}];
    //self.testFragment.view.frame = CGRectMake(x, y, 375, 500);
    [self addChildViewController:self.testFragment];
    [self.view addSubview:self.testFragment.view];
//    x += 88;
//    if (x > 360) {
//        x = 0;
//        y += 88;
//    }
    text = [text isEqualToString:@"A"] ? @"B" : @"A";
}


@end
