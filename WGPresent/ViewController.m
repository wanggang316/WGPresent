//
//  ViewController.m
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import "ViewController.h"
#import "WGPopoverView.h"
#import "WGAlertTableView.h"
#import "WGCollectionView.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface ViewController () <WGViewsEventDelegate>

@property (nonatomic, strong) WGPopoverView *popoverView;
@property (nonatomic, strong) WGAlertTableView *contentView;

@property (nonatomic, strong) WGPopoverView *popoverView1;
@property (nonatomic, strong) WGCollectionView *contentView1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


/************** style 1 ****************/

- (WGPopoverView *)popoverView {
    if (!_popoverView) {
        
        _popoverView = [[WGPopoverView alloc]init];
        _popoverView.contentView = self.contentView;
        
        _popoverView.presentAnimation = ^(UIView *contentView) {
            contentView.alpha = 1.f;
        };
        _popoverView.dismissAnimation = ^(UIView *contentView) {
            contentView.alpha = 0.f;
        };
    }
    return _popoverView;
}

- (WGAlertTableView *)contentView {
    if (!_contentView) {
        _contentView = [[WGAlertTableView alloc]init];
        _contentView.eventDelegate = self;
        _contentView.layer.cornerRadius = 6.f;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (IBAction)present:(id)sender {
    [self.popoverView presentPopoverView];
}


/************** style 2 ****************/

- (WGPopoverView *)popoverView1 {
    if (!_popoverView1) {
        
        _popoverView1 = [[WGPopoverView alloc]init];
        _popoverView1.contentView = self.contentView1;
        
        _popoverView1.presentAnimation = ^(UIView *contentView) {
            contentView.frame = CGRectMake(0, ScreenHeight-200, ScreenWidth, 200);
        };
        _popoverView1.dismissAnimation = ^(UIView *contentView) {
            contentView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 200);
        };
    }
    return _popoverView1;
}

- (WGCollectionView *)contentView1 {
    if (!_contentView1) {
        _contentView1 = [[WGCollectionView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 200)];
        _contentView1.eventDelegate = self;
    }
    return _contentView1;
}


- (IBAction)present1:(id)sender {
    [self.popoverView1 presentPopoverView];
}



#pragma mark - WGViewEventDelegate
- (void)didSelectedAtIndex:(NSInteger)index view:(UIView *)view {
    if ([view isKindOfClass:[UITableView class]]) {
        NSLog(@"did selected tableView at index : %@", @(index));

    } else if ([view isKindOfClass:[UICollectionView class]]) {
        NSLog(@"did selected collectionView at index : %@", @(index));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
