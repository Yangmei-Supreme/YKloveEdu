//
//  Register3ViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/13.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "Register3ViewController.h"

@interface Register3ViewController ()

@end

@implementation Register3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册新用户";
    self.view.backgroundColor = [UIColor whiteColor];
    [self register3Back];
}

//返回按键
- (void)register3Back
{
    //左边
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(register3BackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
    //右边
    UIButton * save = [UIButton buttonWithType:UIButtonTypeCustom];
    save.frame = CGRectMake(0, 0, 35, 20);
    [save setTitle:@"保存" forState:UIControlStateNormal];
    [save setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [save addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:save];
    
}

//返回点击事件
- (void)register3BackClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveClick
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
