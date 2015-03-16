//
//  WGCollectionView.h
//  WGPresent
//
//  Created by 王刚 on 15/3/16.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WGViewsEventDelegate.h"

@interface WGCollectionView : UICollectionView

@property (nonatomic, weak) id<WGViewsEventDelegate> eventDelegate;

@end
