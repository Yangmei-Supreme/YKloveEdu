//
//  Register2ViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/13.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "Register2ViewController.h"

#import "Header.h"
#import "Register3ViewController.h"

@interface Register2ViewController () <UITextFieldDelegate>
{
    //验证码的框
    UITextField *upTextFild;
    //密码框
    UITextField *downTextFild;
    
    //下一步
    UIButton *nextButton;
    //重新发送
    UIButton *againBtn;
    
    //倒计时
    int time;
    //定时器
    NSTimer *timer;
}

@end

@implementation Register2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册新用户";
    //返回
    [self register2Back];
    
    //设置上面的框框
    [self settingkuang];
}

//返回按键
- (void)register2Back
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(register2BackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];

}

//返回点击事件
- (void)register2BackClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

//设置上面的框框
- (void)settingkuang
{
    //背景图片
    UIImageView *backImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, 44)];
    backImage1.image = [UIImage imageNamed:@"kuang"];
    [self.view addSubview:backImage1];
    
    UIImageView *backImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30 + 55, kScreenWidth, 44)];
    backImage2.image = [UIImage imageNamed:@"kuang"];
    [self.view addSubview:backImage2];
    
    //后面的输入验证码
    upTextFild = [[UITextField alloc]initWithFrame:CGRectMake(30, 30, kScreenWidth - 30, 44)];
    upTextFild.delegate = self;
    upTextFild.tintColor = [UIColor grayColor];
    upTextFild.clearButtonMode = UITextFieldViewModeAlways;
    upTextFild.returnKeyType = UIReturnKeyNext;
    [upTextFild becomeFirstResponder];
    upTextFild.keyboardType = UIKeyboardTypeNumberPad;
    upTextFild.font = [UIFont systemFontOfSize:15];
    upTextFild.placeholder = @"请输入验证码";
    [self.view addSubview:upTextFild];
    
    //输入密码
    downTextFild = [[UITextField alloc]initWithFrame:CGRectMake(30, 30 + 55, kScreenWidth - 30, 44)];
    downTextFild.delegate = self;
    downTextFild.tintColor = [UIColor grayColor];
    downTextFild.clearButtonMode = UITextFieldViewModeAlways;
    downTextFild.returnKeyType = UIReturnKeyDefault;
    downTextFild.keyboardType = UIKeyboardTypeDefault;
    downTextFild.font = [UIFont systemFontOfSize:15];
    downTextFild.placeholder = @"设置密码，仅限字母和数字";
    //密文
//    downTextFild.secureTextEntry = YES;
    [self.view addSubview:downTextFild];
    
    //下一步的button 和重新发送
    nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake((kScreenWidth - 256) / 3,44 * 2 + 30 + 40, 128, 33);
    [nextButton setBackgroundImage:[UIImage imageNamed:@"xyb_01"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
    nextButton.enabled = NO;
    [self.view addSubview:nextButton];
    
    time = 60;

    //重新发送
    againBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    againBtn.frame = CGRectMake(2 * ((kScreenWidth - 256) / 3) + 128 , 44 * 2 + 30 + 40, 128, 33);
    [againBtn setBackgroundImage:[UIImage imageNamed:@"cxfs"] forState:UIControlStateNormal];
    [againBtn addTarget:self action:@selector(againButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [againBtn setTitle:[NSString stringWithFormat:@"重新发送（ %d ）",time] forState:UIControlStateNormal];
    [againBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    againBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:againBtn];

}

//下一步点击
- (void)nextButtonClick
{
    Register3ViewController *vc = [[Register3ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

//重新发送
- (void)againButtonClick
{
    //重启定时器
    [self createTimer];
}

- (void)createTimer
{
    //如果定时器无效,则创建定时器,定时器创建即启动
    if (timer.isValid == NO) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
        
    }else {
        //重启定时器
        [timer setFireDate:[NSDate distantPast]];
    }
}

- (void)timeClick
{
    time--;
    //设置btn title
    [self setBtnTitle];
}

//设置btn Title
- (void)setBtnTitle{
    [againBtn setTitle:[NSString stringWithFormat:@"重新发送（ %d ）",time] forState:UIControlStateNormal];
    if (time <= 0) {
        againBtn.userInteractionEnabled = YES;
        [againBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [againBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        //暂停定时器
        //并且设置time为60秒
        [timer setFireDate:[NSDate distantFuture]];
        time = 60;
    }else {
        againBtn.userInteractionEnabled = NO;
        
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (upTextFild.text.length >= 3) {
        [nextButton setBackgroundImage:[UIImage imageNamed:@"xyb"] forState:UIControlStateNormal];
        nextButton.enabled = YES;
    }
    if(textField.text.length >= 4){
        nextButton.enabled = YES;
        [self.view endEditing:YES];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    nextButton.enabled = NO;
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
