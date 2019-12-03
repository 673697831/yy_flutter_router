//
//  UIViewController+YYViewControllers.m
//  YYMobile
//
//  Created by wuwei on 14/7/4.
//  Copyright (c) 2014年 YY.inc. All rights reserved.
//


#import "UIViewController+YYViewControllers.h"

@implementation UIViewController (YYViewControllers)

- (void)yy_viewWillDisappear
{

}

- (void)yy_viewDidAppear
{
    self.navigationController.navigationBarHidden = [self yy_preferredNavigationBarHidden];
}

@end

@implementation UIViewController (ViewControllerBasedNavigationBarAppearance)

- (BOOL)yy_preferredNavigationBarHidden
{
    return NO;
}

- (BOOL)yy_preferredNavigationBarTranslucent
{
    return YES;
}

- (UIImage *)yy_preferredNavigationBarBackgroundImageForBarMetrics:(UIBarMetrics)barMetrics
{
    return [UIImage new];
}

- (UIColor *)yy_preferredNavigationBarBackgroundColor
{
    return [UIColor clearColor];
}

- (UIImage *)yy_preferredNavigationBarShadowImage
{
    return [UIImage new];
}

- (UIColor *)yy_preferredNavigationBarBackViewColor
{
    return [UIColor whiteColor];
}

- (UIColor *)yy_preferredNavigationBarTintColor
{
    return [UIColor blackColor];
}

@end
