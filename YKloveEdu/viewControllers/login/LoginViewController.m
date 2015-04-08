//
//  LoginViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/13.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "LoginViewController.h"

#import "Header.h"
#import "RegisterViewController.h"
#import "FindViewController.h"
#import "NavViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
{
    //qq，微信，微博按键
    UIButton *upBtn;
    //账号
    UITextField *accountText;
    //密码
    UITextField *passWordText;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    self.title = @"登录";
    //返回
    [self loginBack];
    //上面的imageview
    [self upImageView];

    
}

//返回按键
- (void)loginBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(loginBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}

//返回
- (void)loginBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//上面的image
- (void)upImageView
{
    NSArray *titleArr = @[@"QQ账号",@"微信账号",@"微博账号"];
    NSArray *imageArr = @[@"qq",@"weixin",@"weibo"];
    CGFloat space = 0.5 * (kScreenWidth - 270) ;
    CGFloat viewH = 100;
    CGFloat viewW = 90;
    CGFloat imageH = 50;

    for (int i = 0; i < 3; i++) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(space + viewW * i, space, viewW, viewH)];
        [self.view addSubview:backView];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, imageH, imageH)];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        [backView addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 90, 20)];
        titleLabel.text = titleArr[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [backView addSubview:titleLabel];
        
        upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        upBtn.frame = CGRectMake(space + viewW * i, space, viewW, viewH);
        upBtn.tag = i + 1;
        if (upBtn.tag == 1) {
            [upBtn addTarget:self action:@selector(upBtnClick1) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (upBtn.tag == 2) {
            [upBtn addTarget:self action:@selector(upBtnClick2) forControlEvents:UIControlEventTouchUpInside];

        }else {
        [upBtn addTarget:self action:@selector(upBtnClick3) forControlEvents:UIControlEventTouchUpInside];
        }

        [self.view addSubview:upBtn];
    }
    
    //下面登录按钮
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, space + viewH + 30, 100, 20)];
    label.text = @"账号登录";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    //登录框
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, space + viewH + 30 + 25, kScreenWidth, 90)];
    backImage.image = [UIImage imageNamed:@"etwgdl"];
    [self.view addSubview:backImage];
    
    accountText = [[UITextField alloc]initWithFrame:CGRectMake(50, space + viewH + 30 + 25, kScreenWidth - 50, 44)];
    accountText.delegate = self;
    accountText.tintColor = [UIColor grayColor];
    accountText.clearButtonMode = UITextFieldViewModeAlways;
    accountText.returnKeyType = UIReturnKeyNext;
    [accountText becomeFirstResponder];
    accountText.keyboardType = UIKeyboardTypeDefault;
    accountText.font = [UIFont systemFontOfSize:15];
    accountText.placeholder = @"手机号/邮箱/用户名";

    [self.view addSubview:accountText];
    
    passWordText = [[UITextField alloc]initWithFrame:CGRectMake(50, space + viewH + 30 + 25 + 44, kScreenWidth - 50, 44)];
    passWordText.delegate = self;
    passWordText.tintColor = [UIColor grayColor];
    passWordText.clearButtonMode = UITextFieldViewModeAlways;
    passWordText.returnKeyType = UIReturnKeyGo;
    passWordText.keyboardType = UIKeyboardTypeDefault;
    passWordText.font = [UIFont systemFontOfSize:15];
    passWordText.secureTextEntry = YES;
    passWordText.placeholder = @"密码";
    [self.view addSubview:passWordText];
    
    //登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(20, space + viewH + 30 + 25 + 44 + 44 + 20, kScreenWidth - 40, 44);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"sign-up"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //忘记密码
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame = CGRectMake(20, space + viewH + 30 + 25 + 44 + 44 + 20 + 44 + 10, 60, 20);
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [forgetBtn setTitle: @"忘记密码" forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [forgetBtn setTitleColor:[UIColor colorWithRed:57 / 255.0 green:175 / 255.0 blue:36 / 255.0 alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:forgetBtn];
    
    
    //无账号快速登录
    UIButton *fastLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fastLoginBtn.frame = CGRectMake(kScreenWidth - 115, space + viewH + 30 + 25 + 44 + 44 + 20 + 44 + 10, 100, 20);
    fastLoginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [fastLoginBtn addTarget:self action:@selector(fastLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [fastLoginBtn setTitle: @"无账号快捷登录" forState:UIControlStateNormal];
    [fastLoginBtn setTitleColor:[UIColor colorWithRed:57 / 255.0 green:175 / 255.0 blue:36 / 255.0 alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:fastLoginBtn];
}

- (void)upBtnClick1
{
    YMLog(@"1");
}

- (void)upBtnClick2
{
    YMLog(@"2");
}

- (void)upBtnClick3
{
    YMLog(@"3");
}

//登录按钮
- (void)loginClick
{
    YMLog(@"登录");
    
    
}

//找回密码
- (void)forgetBtnClick
{
    FindViewController *fvc = [[FindViewController alloc]init];
    NavViewController *fnav = [[NavViewController alloc]initWithRootViewController:fvc];
    [self presentViewController:fnav animated:YES completion:nil];
}

//无账号快捷登录
- (void)fastLoginBtnClick
{
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
