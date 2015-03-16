//
//  WGViewsEventDelegate.h
//  WGPresent
//
//  Created by 王刚 on 15/3/16.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WGViewsEventDelegate <NSObject>

- (void)didSelectedAtIndex:(NSInteger)index view:(UIView *)view;

@end
