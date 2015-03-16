//
//  CollectionCell.h
//  WGPresent
//
//  Created by 王刚 on 15/3/16.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UICollectionViewCell

+ (UINib *)nib;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
