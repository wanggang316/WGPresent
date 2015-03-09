//
//  WGPopoverView.m
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import "WGPopoverView.h"

@interface WGPopoverView() <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *popoverView;
@property (nonatomic, strong) UIView *displayView;
@property (nonatomic, strong) UIView *containerView;

@end

@implementation WGPopoverView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc]init];
        _containerView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.2];
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAnimation)];
        tapGesture.delegate = self;
        [_containerView addGestureRecognizer:tapGesture];
        
    }
    return _containerView;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (touch.view == self || touch.view == self.containerView) {
        return YES;
    }
    return NO;
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    
    [self.containerView addSubview:_contentView];
}


- (void)presentPopoverView {
    
//    if (self.isShowing) {
//        [self dismaissPopover];
//    } else {
        if (!self.displayView) {
    
            NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
            for (UIWindow *window in frontToBackWindows){
                BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
                BOOL windowIsVisible = !window.hidden && window.alpha > 0;
                BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
                
                if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
                    
//                    if ([window.rootViewController isKindOfClass:[UINavigationController class]]) {
//                        UINavigationController *rootnav = (UINavigationController *)window.rootViewController;
//                        CGFloat topbarHeight = rootnav.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
//                        self.containerView.frame = CGRectMake(0, 64, window.frame.size.width, window.frame.size.height -64);
//                    } else {
                    self.containerView.frame = window.frame;
//                    }
                    self.frame = window.frame;
//                    [self addSubview:self.containerView];
                    self.displayView = window;
                    [self presentAnimation];
                    break;
                }
            }
//        }else {
//            [self presentAnimation];
//        }
    
//        self.isShowing = YES;
        } else {
            [self presentAnimation];
        }
}

- (void)dismissPopoverView {
    
}


- (void)presentAnimation {
    
    self.containerView.alpha = 0.f;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [self.displayView addSubview:self.containerView];
        [self.displayView bringSubviewToFront:self.containerView];
    }];
}

- (void)dismissAnimation {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.containerView removeFromSuperview];
    }];
    
    
}

    
    

@end
