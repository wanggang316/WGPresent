//
//  WGPopoverView.h
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGPopoverView : UIView

@property (nonatomic, strong) UIView *contentView;


- (void)presentPopoverView;
- (void)dismissPopoverView;

@end
