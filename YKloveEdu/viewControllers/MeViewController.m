//
//  MeViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/26.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MeViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "NavViewController.h"
#import "MeViewCell.h"
#import "UserNameController.h"
#import "MyPostController.h"
#import "ZanViewController.h"
#import "AnswerController.h"
#import "MessageController.h"
#import "AboutViewController.h"
#import "MyBuyViewController.h"
#import "ChartsViewController.h"
#import "RecordViewController.h"

@interface MeViewController () <UITableViewDataSource,UITableViewDelegate>
{
    //中间的点击btn
    UIButton *button;
    
    //tableView数据源
    NSDictionary * _tableDic;
}
- (IBAction)setBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *iconImage;
- (IBAction)iconImageBtnClick;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *qmLabel;
@property (weak, nonatomic) IBOutlet UITableView *MeTableView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:239 / 255.0  blue:244 / 255.0  alpha:1];
//    self.title = @"我的";
    //我的页面UI搭建
    //    registerManager *manager = [registerManager shareManager];
    //    if (manager.isLogin == NO) {
    //        [self createMeUI];
    //    }else {
    //
    //    }
    
    //测试登录状态：
    self.navigationController.navigationBar.hidden = YES;
    [self createMeButton];
    [self initTableView];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initTableDic];
}

- (void)initTableView
{
    self.MeTableView.delegate = self;
    self.MeTableView.dataSource = self;
    self.MeTableView.tableFooterView = [[UIView alloc]init];
//    self.MeTableView.bounces = NO;
    self.MeTableView.showsVerticalScrollIndicator = NO;
}


- (void)createMeButton
{
    NSArray *wordArr = @[@"我的帖子",@"收到的赞",@"收到回复",@"系统消息"];
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 59)];
    backImageView.image  = [UIImage imageNamed:@"center"];
    [self.view addSubview:backImageView];
    CGFloat bViewH = 59;
    CGFloat bViewW = kScreenWidth / 4;
    for (int i = 0; i < 4; i++) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(bViewW * i, 200, bViewW, bViewH)];
//        backView.backgroundColor = [UIColor lightGrayColor];
//        backView.alpha = 0.5;
        [self.view addSubview:backView];
        UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, bViewW, 29)];
//        numLabel.backgroundColor = [UIColor redColor];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.text = @"3";
        [backView addSubview:numLabel];
        UILabel *wordLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 29, bViewW, 30)];
//        wordLabel.backgroundColor = [UIColor redColor];
        wordLabel.textColor = [UIColor lightGrayColor];
        wordLabel.font = [UIFont systemFontOfSize:14];
        wordLabel.textAlignment = NSTextAlignmentCenter;
        wordLabel.text = wordArr[i];
        [backView addSubview:wordLabel];
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(bViewW * i, 200, bViewW, bViewH);
//        button.backgroundColor = [UIColor redColor];
//        button.alpha = 0.6;
        button.tag = i + 10;
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)buttonClick:(UIButton *)btn
{
    
    switch (btn.tag) {
        case 10:
        {
            MyPostController *mvc = [[MyPostController alloc]init];
            NavViewController *nav = [[NavViewController alloc]initWithRootViewController:mvc];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case 11:
        {
            ZanViewController *vc = [[ZanViewController alloc]init];
            NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case 12:
        {
            AnswerController *vc = [[AnswerController alloc]init];
            NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case 13:
        {
            MessageController *vc = [[MessageController alloc]init];
            NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}

//我的页面UI搭建
- (void)createMeUI
{
    //上面的image
    UIImageView *upImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth / 1.6)];
    //    upImageView.backgroundColor = [UIColor redColor];
    upImageView.image = [UIImage imageNamed:@"ykajy"];
    [self.view addSubview:upImageView];
    
    //中间文字
    UILabel *MidLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, upImageView.frame.size.height + 15, kScreenWidth, 30)];
    MidLabel.text = @"现在登录，立即畅想海量学习资源";
    MidLabel.textAlignment = NSTextAlignmentCenter;
    MidLabel.textColor = [UIColor lightGrayColor];
    MidLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:MidLabel];
    
    //下面button
    //注册button
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(kScreenWidth / 16, upImageView.frame.size.height + 15 + MidLabel.frame.size.height + 15, kScreenWidth * 0.875, kScreenWidth * 0.875 * 0.157);
    registerBtn.backgroundColor = [UIColor redColor];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"zc"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(kScreenWidth / 16, upImageView.frame.size.height + 15 + MidLabel.frame.size.height + 15 + registerBtn.frame.size.height + 15, kScreenWidth * 0.875, kScreenWidth * 0.875 * 0.157);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"dl"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

//注册按钮点击事件
- (void)registerBtnClick
{
    RegisterViewController *rvc = [[RegisterViewController alloc]init];
    NavViewController *rnav = [[NavViewController alloc]initWithRootViewController:rvc];
    [self presentViewController:rnav animated:YES completion:nil];
}

//登录按钮被点击
- (void)loginBtnClick
{
    LoginViewController *vc = [[LoginViewController alloc]init];
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

//设置
- (IBAction)setBtnClick
{
    UserNameController *uvc = [[UserNameController alloc]init];
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:uvc];
    [self presentViewController:nav animated:YES completion:nil];
    
}

//点击头像
- (IBAction)iconImageBtnClick
{
    
}

- (void)setIconImage:(UIButton *)iconImage
{
    _iconImage = iconImage;
    iconImage.layer.cornerRadius = 40;
    iconImage.layer.masksToBounds = YES;
}

- (void)initTableDic{
    _tableDic = @{
                  @"0_image":@"wdgm",
                  @"1_image":@"ph",
                  @"2_image":@"gkjl",
                  @"3_image":@"xxbg",
                  @"4_image":@"wdcj",
                  @"5_image":@"zjjy",
                  @"6_image":@"about",
                  
                  @"0_title":@"我的购买",
                  @"1_title":@"排行",
                  @"2_title":@"观看记录",
                  @"3_title":@"学习报告",
                  @"4_title":@"我的成就",
                  @"5_title":@"专家建议",
                  @"6_title":@"关于"
                  };
}

#pragma mark- tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"me"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MeViewCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.pImageView.image = [UIImage imageNamed:_tableDic[[NSString stringWithFormat:@"%ld_image",(long)indexPath.row]]];
    cell.tLabel.text = _tableDic[[NSString stringWithFormat:@"%ld_title",(long)indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            MyBuyViewController *buy = [[MyBuyViewController alloc]initWithNibName:@"MyBuyViewController" bundle:nil];
            [self.navigationController pushViewController:buy animated:YES];

            break;
        }
        case 1:
        {
            ChartsViewController *vc = [[ChartsViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case 2:
        {
            RecordViewController *vc = [[RecordViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];

            break;
        }
        case 3:
        {
            ChartsViewController *vc = [[ChartsViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:
        {
            ChartsViewController *vc = [[ChartsViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:
        {
            ChartsViewController *vc = [[ChartsViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6:
        {
            AboutViewController *about = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
            [self.navigationController pushViewController:about animated:YES];
            
            break;
        }
            
        default:
            break;
    }
    
    self.navigationController.navigationBar.hidden = NO;
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar hideTabBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
