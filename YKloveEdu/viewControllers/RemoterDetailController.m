//
//  RemoterDetailController.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "RemoterDetailController.h"

@interface RemoterDetailController ()

@end

@implementation RemoterDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Blacktitle"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"天猫魔盒";
    //返回
    [self remoterDetailBack];
}

//返回
- (void)remoterDetailBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(remoterDetailBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
}

//返回
- (void)remoterDetailBackClick
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.hidden = YES;
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar showTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
