//
//  LPTableView.h
//  LPTableView
//
//  Created by onecampus on 16/1/8.
//  Copyright © 2016年 onecampus. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kLPTableViewDidScroll @"LPTableViewDidScroll"
#define ScreenSize [UIScreen mainScreen].bounds.size
@interface LPTableView : UITableView<UIScrollViewDelegate>

- (void)setTableHeaderViewHeight:(CGFloat)height;
- (void)setContentOffset:(CGPoint)contentOffset quietly:(BOOL)quietly;


@end
