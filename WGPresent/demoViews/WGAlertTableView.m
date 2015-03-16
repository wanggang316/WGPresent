//
//  WGAlertTableView.m
//  WGPresent
//
//  Created by 王刚 on 15/3/9.
//  Copyright (c) 2015年 wwwlife. All rights reserved.
//

#import "WGAlertTableView.h"
#import "Cell.h"


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface WGAlertTableView() <UITableViewDataSource, UITableViewDelegate>


@end

@implementation WGAlertTableView


- (instancetype)init
{
    _items = @[@"登录",@"注册",@"认证",@"取消"];

    CGFloat height = 60+44*_items.count;
    
    CGRect frame = CGRectMake(ScreenWidth*0.15, (ScreenHeight-height)/2, ScreenWidth*0.7, height);
    
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"defaultCell"];
        [self registerNib:[Cell nib] forCellReuseIdentifier:@"cell"];
        
        self.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0);
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 60)];
        titleLabel.text = @"您尚未登录";
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.backgroundColor = [UIColor whiteColor];
        
        self.tableHeaderView = titleLabel;
        
        self.scrollEnabled = NO;
        
    }
    return self;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        
        self.items = @[@"登录",@"注册",@"认证",@"取消"];
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        self.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0);
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 60)];
        titleLabel.text = @"您尚未登录";
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.backgroundColor = [UIColor whiteColor];
        
        self.tableHeaderView = titleLabel;
        
        self.frame = CGRectMake(ScreenWidth*0.15, ScreenHeight*0.3, ScreenWidth*0.7, ScreenHeight*0.4);
        
    }
    return self;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.titleLabel.text = self.items[indexPath.row];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell" forIndexPath:indexPath];
        cell.textLabel.text = self.items[indexPath.row];
        cell.textLabel.textColor = [UIColor blueColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
    }
   
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.eventDelegate && [self.eventDelegate respondsToSelector:@selector(didSelectedAtIndex:view:)]) {
        [self.eventDelegate didSelectedAtIndex:indexPath.row view:self];
    }
}

@end
