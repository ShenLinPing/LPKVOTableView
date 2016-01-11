//
//  ViewController.m
//  LPTableView
//
//  Created by onecampus on 16/1/8.
//  Copyright © 2016年 onecampus. All rights reserved.
//

#import "ViewController.h"
#import "LPTableView.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#define ScreenSize [UIScreen mainScreen].bounds.size

@interface ViewController ()
{
    UIScrollView *_baseScroll;
    UIScrollView *_coverScroll;
    LPTableView *_testTable;
    UIView *_headView;
    
    OneViewController *_one;
    TwoViewController *_two;
    ThreeViewController *_three;
}

@end

@implementation ViewController

- (void)dealloc
{
    [self removeNotifications];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViews];
    [self addNotifications];
}

- (void)setUpViews
{
    UIScrollView *baseScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height)];
    baseScroll.contentSize = CGSizeMake(ScreenSize.width * 3, ScreenSize.height);
    baseScroll.pagingEnabled = YES;
    baseScroll.bounces = NO;
    [self.view addSubview:baseScroll];
    _baseScroll = baseScroll;

    _one = [[OneViewController alloc]init];
    [_one setHeadViewHeight:200];
    _one.view.frame = CGRectMake(0, 0, ScreenSize.width, ScreenSize.height);
    [baseScroll addSubview:_one.view];
    [self addChildViewController:_one];
    
    _two = [[TwoViewController alloc] init];
    [_two setHeadViewHeight:200];
    _two.view.frame = CGRectMake(ScreenSize.width, 0, ScreenSize.width, ScreenSize.height);
    [baseScroll addSubview:_two.view];
    [self addChildViewController:_two];
    
    _three = [[ThreeViewController alloc] init];
    [_three setHeadViewHeight:200];
    _three.view.frame = CGRectMake(ScreenSize.width*2, 0, ScreenSize.width, ScreenSize.height);
    [baseScroll addSubview:_three.view];
    [self addChildViewController:_three];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 200)];
    headView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:headView];
    [self.view bringSubviewToFront:headView];
    _headView = headView;
    
    
}


- (void)addNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableHeaderViewDidScroll:) name:kLPTableViewDidScroll object:nil];
}

- (void)removeNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kLPTableViewDidScroll object:nil];
}


- (void)tableHeaderViewDidScroll:(NSNotification *)noti
{
    NSNumber *object = noti.object;
    CGFloat height = object.floatValue;
    CGFloat max_height = _headView.frame.size.height;
    //设置_headView位置
    CGRect rect = _headView.frame;
    rect.origin.y = -height;
    if (rect.origin.y < -max_height) {
        rect.origin.y = -max_height;
    }else if(rect.origin.y > 0)
    {
        rect.origin.y = 0;
    }
    _headView.frame = rect;
    
    
    if (height > max_height) {
        height = max_height;
    }
    
    [_one.tableView setContentOffset:CGPointMake(_one.tableView.contentOffset.x, height) quietly:YES];
    [_two.tableView setContentOffset:CGPointMake(_two.tableView.contentOffset.x, height) quietly:YES];
    [_three.tableView setContentOffset:CGPointMake(_three.tableView.contentOffset.x, height) quietly:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
