//
//  WGAlertTableView.h
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WGViewsEventDelegate.h"

@interface WGAlertTableView : UITableView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<WGViewsEventDelegate> eventDelegate;

@end

