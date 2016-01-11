//
//  LPTableView.m
//  LPTableView
//
//  Created by onecampus on 16/1/8.
//  Copyright © 2016年 onecampus. All rights reserved.
//

#import "LPTableView.h"
#define ScreenSize [UIScreen mainScreen].bounds.size
@interface LPTableView()

@property (nonatomic, strong) UIView *headView;

@end

@implementation LPTableView

- (void)setTableHeaderViewHeight:(CGFloat)height
{
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, height)];
    self.tableHeaderView = self.headView;
}


- (void)setContentOffset:(CGPoint)contentOffset quietly:(BOOL)quietly
{
    //在滚动时不做处理
    if (self.tracking||self.decelerating||self.dragging) {
        return;
    }

    if (quietly) {
        [super setContentOffset:contentOffset];
    }else
    {
        [self setContentOffset:contentOffset];
    }
}

- (void)setContentOffset:(CGPoint)contentOffset
{
    [super setContentOffset:contentOffset];
    
    if (self.headView) {
        CGFloat y = contentOffset.y;
        if (y > self.headView.frame.size.height) {
            y = self.headView.frame.size.height;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kLPTableViewDidScroll object:@(y)];
    }
}


@end
