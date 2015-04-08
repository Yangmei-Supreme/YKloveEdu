 //
//  MainTabBarViewController.m
//  沃24
//
//  Created by Mac on 14-11-17.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "MainTabBarViewController.h"

#import "RootViewController.h"
#import "RemoterViewController.h"
#import "SaleViewController.h"
#import "Study0ViewController.h"
#import "ShareViewController.h"
#import "MeViewController.h"
#import "NavViewController.h"

@interface MainTabBarViewController ()
@property (nonatomic,strong) UIButton *selectedButton;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //导航栏
    [self addNavigation];
    //tabbar
    [self addTabBar];
}

- (void)addNavigation
{
    NSArray *nameArr = @[@"RemoterViewController",@"SaleViewController",@"Study0ViewController",@"ShareViewController",@"MeViewController"];
    NSMutableArray *controllers = [NSMutableArray array];
    //获取每一个要创建对象的类名
    for (NSString *className in nameArr) {
        Class newClass = NSClassFromString(className);
        if (newClass) {
            //创建对象
            UIViewController *vc = [[newClass alloc]init];
            NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
            [controllers addObject:nav];
        }
    }
    self.viewControllers = controllers;
}

- (void)addTabBar
{
    self.tabBar.hidden = YES;
    NSArray *normalArr = @[@"tab_yaokong_01",@"tab_temai_01",@"tab_xuexi_01",@"tab_fenxiang_01",@"tab_wode_01"];
    NSArray *selectedArr = @[@"tab_yaokong_02",@"tab_temai_02",@"tab_xuexi_02",@"tab_fenxiang_02",@"tab_wode_02"];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - kScreenWidth / 6.53, [UIScreen mainScreen].bounds.size.width, kScreenWidth / 6.53)];
    _imageView.backgroundColor = [UIColor whiteColor];
    _imageView.userInteractionEnabled = YES;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.5f)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.tintColor = [UIColor lightGrayColor];
    [_imageView addSubview:lineView];
    
    for (int index = 0; index < selectedArr.count; index++) {
        CGFloat buttonW = self.view.frame.size.width / selectedArr.count;
        CGFloat buttonX = index * buttonW;
        CGFloat buttonY = 0;
        CGFloat buttonH = kScreenWidth / 6.53;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button setBackgroundImage:[UIImage imageNamed:normalArr[index]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:selectedArr[index]] forState:UIControlStateSelected];
        button.tag = index + 10;
        if (index == 0) {
            button.selected = YES;
            self.seletedButton = button;
        }
        button.adjustsImageWhenHighlighted = NO;
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:button];
    }
    
    [self.view addSubview:_imageView];
    
}

- (void)buttonOnClick:(UIButton *)button
{
    //当前选中的取消选中
    self.seletedButton.selected = NO;
    //新的被选中
    button.selected = YES;
    self.seletedButton = button;
    self.selectedIndex = button.tag - 10;
    
    YMLog(@"tabBar = %ld",(unsigned long)self.selectedIndex);
    
}

- (void)hideTabBar
{
    [self hideTabBarWithAnimation:YES];
}

- (void)hideTabBarWithAnimation:(BOOL)ret
{
    if (_isHiden == YES) return;
    CGRect frame = CGRectMake(0, kScreenHeight, kScreenWidth,  kScreenWidth / 6.53);
    if (ret == YES) {
        [UIView animateWithDuration:0.3 animations:^{
            _imageView.frame = frame;
            
        }];
        
    }else {
        _imageView.frame = frame;
        
    }
    
     _isHiden = YES;
     YMLog(@"hide....");
}

- (void)showTabBar
{
    if (_isHiden == NO ) return;
    CGRect frame = CGRectMake(0, kScreenHeight -  kScreenWidth / 6.53, kScreenWidth,  kScreenWidth / 6.53);
    [UIView animateWithDuration:0.3 animations:^{
        _isHiden = NO;
        _imageView.frame = frame;
        
    } completion:^(BOOL finished) {
        YMLog(@"show....");
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
