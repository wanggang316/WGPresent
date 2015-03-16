//
//  WGPopoverView.h
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WGPopoverAnimation)(UIView *contentView);
typedef void (^WGPopoverAnimationCompletion)(BOOL finished);

@protocol WGPopoverViewDelegate;
@interface WGPopoverView : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, weak) id<WGPopoverViewDelegate> delegate;

@property (nonatomic, copy) WGPopoverAnimation presentAnimation;
@property (nonatomic, copy) WGPopoverAnimationCompletion presentCompletion;
@property (nonatomic, copy) WGPopoverAnimation dismissAnimation;
@property (nonatomic, copy) WGPopoverAnimationCompletion dismissCompletion;

- (void)presentPopoverView;
- (void)dismissPopoverView;

@end