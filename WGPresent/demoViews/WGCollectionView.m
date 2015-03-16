//
//  WGCollectionView.m
//  WGPresent
//
//  Created by 王刚 on 15/3/16.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import "WGCollectionView.h"
#import "CollectionCell.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface WGCollectionView() <UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation WGCollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake((ScreenWidth-1)/2, 50);
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.dataSource = self;
        self.delegate = self;
        [self registerNib:[CollectionCell nib] forCellWithReuseIdentifier:NSStringFromClass([CollectionCell class])];
    }
    return self;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionCell class]) forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"2015-01-%@", @(indexPath.row)];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.eventDelegate && [self.eventDelegate respondsToSelector:@selector(didSelectedAtIndex:view:)]) {
        [self.eventDelegate didSelectedAtIndex:indexPath.row view:self];
    }
}

@end
