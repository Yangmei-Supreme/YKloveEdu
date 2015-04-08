//
//  AboutViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于";
    //返回
    [self aboutBack];
}

//返回
- (void)aboutBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(aboutBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}

//返回
- (void)aboutBackClick
{
    [self.navigationController popViewControllerAnimated:YES];
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar showTabBar];
    self.navigationController.navigationBar.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
