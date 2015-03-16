//
//  WGPopoverView.m
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import "WGPopoverView.h"

@interface WGPopoverView() <UIGestureRecognizerDelegate>

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
        _containerView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.3];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissPopoverAnimation)];
        tapGesture.delegate = self;
        [_containerView addGestureRecognizer:tapGesture];
        
    }
    return _containerView;
}



- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
}

- (void)presentPopoverView {
    if (!self.displayView) {
        
        NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows){
            BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
            BOOL windowIsVisible = !window.hidden && window.alpha > 0;
            BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
            
            if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
                
                self.containerView.frame = window.frame;
                self.displayView = window;
                
                [self presentPopoverAnimation];
                break;
            }
        }
    } else {
        [self presentPopoverAnimation];
    }}

- (void)dismissPopoverView {
    [self dismissPopoverAnimation];
}


- (void)presentPopoverAnimation {
    
    self.containerView.alpha = 0.f;
    [self.displayView addSubview:self.containerView];
    [self.displayView addSubview:self.contentView];
    [self.displayView bringSubviewToFront:self.contentView];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.alpha = 1.f;
        
        if (self.presentAnimation) {
            self.presentAnimation(self.contentView);
        }
    } completion:^(BOOL finished) {
        
        if (self.presentCompletion) {
            self.presentCompletion(YES);
        }
    }];
}

- (void)dismissPopoverAnimation {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.alpha = 0.0;
        
        if (self.dismissAnimation) {
            self.dismissAnimation(self.contentView);
        }
    } completion:^(BOOL finished) {
        [self.containerView removeFromSuperview];
        [self.contentView removeFromSuperview];
        if (self.dismissCompletion) {
            self.dismissCompletion(YES);
        }
    }];
    
    
}



#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (touch.view == self || touch.view == self.containerView) {
        return YES;
    }
    return NO;
}
    
    

@end
