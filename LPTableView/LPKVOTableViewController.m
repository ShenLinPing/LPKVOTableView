//
//  LPKVOTableViewController.m
//  LPTableView
//
//  Created by onecampus on 16/1/11.
//  Copyright © 2016年 onecampus. All rights reserved.
//

#import "LPKVOTableViewController.h"

@interface LPKVOTableViewController()

@property (nonatomic, assign) CGFloat viewHeight;

@end

@implementation LPKVOTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTableView];
}

- (void)initTableView
{
    self.tableView = [[LPTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setTableHeaderViewHeight:_viewHeight];
    
    [self.view addSubview:_tableView];
}

- (void)setHeadViewHeight:(CGFloat)heigth
{
    self.viewHeight = heigth;
    if (_tableView) {
        [_tableView setTableHeaderViewHeight:heigth];
    }
}


@end
