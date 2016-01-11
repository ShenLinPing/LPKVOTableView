//
//  LPKVOTableViewController.h
//  LPTableView
//
//  Created by onecampus on 16/1/11.
//  Copyright © 2016年 onecampus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPTableView.h"
@interface LPKVOTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) LPTableView *tableView;

- (void)setHeadViewHeight:(CGFloat)heigth;

@end
