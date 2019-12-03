//
//  UIViewController+YYViewControllers.h
//  YYMobile
//
//  Created by wuwei on 14/7/4.
//  Copyright (c) 2014年 YY.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYNavigationBarAppearance;

@interface UIViewController (YYViewControllers)

- (void)yy_viewWillDisappear;
- (void)yy_viewDidAppear;

@end

#pragma mark - ViewController-Based Navigation Bar Appearance

@interface UIViewController (ViewControllerBasedNavigationBarAppearance)

/**
 *  Default is NO.
 */
- (BOOL)yy_preferredNavigationBarHidden;

/**
 *  Default is YES.
 */
- (BOOL)yy_preferredNavigationBarTranslucent;

/**
 *  Default is nil.
 *
 *  @param barMetrics see UIBarMetrics
 */
- (UIImage *)yy_preferredNavigationBarBackgroundImageForBarMetrics:(UIBarMetrics)barMetrics;

/**
 *  Default is nil.
 */
- (UIImage *)yy_preferredNavigationBarShadowImage;

/**
 *  Default is [UIColor clearColor].
 */
- (UIColor *)yy_preferredNavigationBarBackgroundColor;

/**
 *  Default is [UIColor whiteColor].
 */
- (UIColor *)yy_preferredNavigationBarBackViewColor;

/**
 *  Default is [UIColor blackColor]. Apply also to bar title's color
 */
- (UIColor *)yy_preferredNavigationBarTintColor;

@end
