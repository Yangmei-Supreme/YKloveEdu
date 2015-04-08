//
//  RegisterViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/13.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "RegisterViewController.h"

#import "Header.h"
#import "Register2ViewController.h"

@interface RegisterViewController () <UITextFieldDelegate>
{
    //电话号码输入
    UITextField *teleText;
    //下一步
    UIButton *nextBtn;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册新用户";
    //输入手机号
    [self inputTelephoneNumber];
    
    //返回
    [self navBack];
    
}

//返回按键
- (void)navBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(registerBackClick1) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];

}

//返回按键点击事件
- (void)registerBackClick1
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//输入手机号
- (void)inputTelephoneNumber
{
    //背景图片
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, 44)];
    backImage.image = [UIImage imageNamed:@"kuang"];
    [self.view addSubview:backImage];
    
    //前面的+86
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    numLabel.text = @"+86";
    numLabel.textColor = [UIColor blackColor];
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.font = [UIFont systemFontOfSize:15];
    [backImage addSubview:numLabel];
    
    //后面的输入手机号
    teleText = [[UITextField alloc]initWithFrame:CGRectMake(50, 30, kScreenWidth - 50, 44)];
    teleText.delegate = self;
    teleText.tintColor = [UIColor grayColor];
    teleText.clearButtonMode = UITextFieldViewModeAlways;
    teleText.returnKeyType = UIReturnKeyNext;
    [teleText becomeFirstResponder];
    teleText.keyboardType = UIKeyboardTypeNumberPad;
    teleText.font = [UIFont systemFontOfSize:15];
    teleText.placeholder = @"请输入手机号";
    [self.view addSubview:teleText];
    
    //中间的文字
    UILabel *MidLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, teleText.frame.size.height + 30, kScreenWidth, 30)];
    MidLabel.text = @"通过手机号可以找到更多好友，也可以用于找回密码";
    MidLabel.textAlignment = NSTextAlignmentCenter;
    MidLabel.textColor = [UIColor lightGrayColor];
    MidLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:MidLabel];

    
    //下一步button
    nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake((kScreenWidth - 128) * 0.5, teleText.frame.size.height + 30 + 40, 128, 33);
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"xyb_01"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.enabled = NO;
    
    [self.view addSubview:nextBtn];
}

//下一步
- (void)nextBtnClick
{
    //取消第一响应者身份
    [teleText resignFirstResponder];
    //跳转
    Register2ViewController *vc = [[Register2ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= 10) {
        [nextBtn setBackgroundImage:[UIImage imageNamed:@"xyb"] forState:UIControlStateNormal];
        nextBtn.enabled = YES;
    }
    if(textField.text.length >= 11 ){
        nextBtn.enabled = YES;
        [self.view endEditing:YES];
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"xyb_01"] forState:UIControlStateNormal];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
