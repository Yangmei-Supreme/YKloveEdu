//
//  FindViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/16.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "FindViewController.h"
#import "LoginViewController.h"
#import "Header.h"

@interface FindViewController () <UITextFieldDelegate>
{
    UITextField *telepText;
    UITextField *yzmText;
}

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"找回密码";
    [self findBack];
    
    [self findPassword];
}

//返回按键
- (void)findBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(findBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}

- (void)findBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)findPassword
{
    //背景图片
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, 44)];
    backImage.image = [UIImage imageNamed:@"kuang"];
    [self.view addSubview:backImage];
    
    //背景图片2
    UIImageView *backImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30 + 44 + 10, kScreenWidth, 44)];
    backImage2.image = [UIImage imageNamed:@"kuang"];
    [self.view addSubview:backImage2];
    
    //前面的+86
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    numLabel.text = @"+86";
    numLabel.textColor = [UIColor blackColor];
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.font = [UIFont systemFontOfSize:15];
    [backImage addSubview:numLabel];
    
    //输入手机号
    telepText = [[UITextField alloc]initWithFrame:CGRectMake(50, 30, kScreenWidth - 50, 44)];
    telepText.delegate = self;
    telepText.tintColor = [UIColor grayColor];
    telepText.clearButtonMode = UITextFieldViewModeAlways;
    telepText.returnKeyType = UIReturnKeyNext;
    [telepText becomeFirstResponder];
    telepText.keyboardType = UIKeyboardTypeNumberPad;
    telepText.font = [UIFont systemFontOfSize:15];
    telepText.placeholder = @"请输入手机号";
    [self.view addSubview:telepText];
    
    yzmText = [[UITextField alloc]initWithFrame:CGRectMake(50, 30 + 44 + 10, kScreenWidth - 50 - 120, 44)];
    yzmText.delegate = self;
    yzmText.tintColor = [UIColor grayColor];
    yzmText.clearButtonMode = UITextFieldViewModeAlways;
    yzmText.returnKeyType = UIReturnKeyNext;
    yzmText.keyboardType = UIKeyboardTypeNumberPad;
    yzmText.font = [UIFont systemFontOfSize:15];
    yzmText.placeholder = @"请输入验证码";
    [self.view addSubview:yzmText];
    
    UIButton *saverNumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saverNumBtn.frame = CGRectMake(kScreenWidth - 120, 30 + 44 + 10 + 4, 100, 36);
    [saverNumBtn setBackgroundImage:[UIImage imageNamed:@"hqyzm_02"] forState:UIControlStateNormal];
    [saverNumBtn addTarget:self action:@selector(saverNumBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saverNumBtn];

}

//获取验证码按钮
- (void)saverNumBtnClick
{
    YMLog(@"saverNumBtnClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
