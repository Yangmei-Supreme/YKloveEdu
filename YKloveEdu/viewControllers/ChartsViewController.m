//
//  ChartsViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "ChartsViewController.h"

@interface ChartsViewController ()

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"排行";
    self.view.backgroundColor = [UIColor whiteColor];
    [self chartsBack];
}

//返回
- (void)chartsBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(chartsBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}

- (void)chartsBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar showTabBar];
    self.navigationController.navigationBar.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
