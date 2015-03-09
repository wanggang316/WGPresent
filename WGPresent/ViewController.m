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

@interface ViewController ()

@property (nonatomic, strong) WGPopoverView *popoverView;
@property (nonatomic, strong) WGAlertTableView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (WGPopoverView *)popoverView {
    if (!_popoverView) {
        _popoverView = [[WGPopoverView alloc]init];
        _popoverView.contentView = self.contentView;
    }
    return _popoverView;
}

- (WGAlertTableView *)contentView {
    if (!_contentView) {
        _contentView = [[WGAlertTableView alloc]initWithFrame:CGRectMake(100, 100, 100, 300)];
    }
    return _contentView;
}


- (IBAction)present:(id)sender {
    
    
    [self.popoverView presentPopoverView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
