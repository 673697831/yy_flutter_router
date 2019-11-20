//
//  YYFlutterContainerView.m
//  Pods
//
//  Created by ouzhirui on 2019/11/18.
//

#import "YYFlutterContainerView.h"
#import "TwinsFragment.h"
#import "YyFlutterRouterPlugin.h"

@interface YYFlutterContainerView ()

@property (nonatomic, strong) TwinsFragment *realView;

@end

@implementation YYFlutterContainerView

- (instancetype)initWithParams:(NSDictionary *)params
{
    //[[YyFlutterRouterPlugin sharedInstance] prepareEngineIfNeeded];
    if (self = [super initWithFrame:CGRectZero]) {
        _realView = [[TwinsFragment alloc] initWithParams:params];
        [self addSubview:_realView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithParams:@{}];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.realView.frame = self.bounds;
}

@end
