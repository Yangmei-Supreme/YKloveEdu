//
//  RemoterViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "RemoterViewController.h"
#import "RemoterTableViewCell.h"
#import "HelpViewController.h"
#import "RemoterDetailController.h"

@interface RemoterViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *rTableView;

@end

@implementation RemoterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"遥控";
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    [self createRemoterUI];
    [self initTableView];
}

- (void)createRemoterUI
{
    UIView *upView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 210)];
    upView.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:141 / 255.0  blue:205 / 255.0  alpha:1];
    [self.view addSubview:upView];
    UIImageView *imaggView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 90) / 2, 80, 90, 90)];
    
    UILabel *joinLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, 21 )];
    joinLabel.textColor = [UIColor whiteColor];
    joinLabel.font = [UIFont boldSystemFontOfSize:17];
    joinLabel.textAlignment = NSTextAlignmentCenter;
    joinLabel.text = @"未连接";
    [upView addSubview:joinLabel];
    
    imaggView.image = [UIImage imageNamed:@"remoter"];
    [upView addSubview:imaggView];
    
    UILabel *wifiLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, kScreenWidth - 10, 21)];
    wifiLabel.text = @"当前网络：SD-0503";
    wifiLabel.textColor = [UIColor whiteColor];
    wifiLabel.font = [UIFont systemFontOfSize:17];
    [upView addSubview:wifiLabel];
    
   
}

- (void)initTableView
{
    self.rTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, kScreenWidth, kScreenHeight - 210) style:UITableViewStylePlain];
    [self.view addSubview:self.rTableView];
    self.rTableView.backgroundColor = [UIColor blackColor];
    self.rTableView.separatorStyle = UITableViewCellAccessoryNone;
    self.rTableView.dataSource = self;
    self.rTableView.delegate = self;
    //帮助
    UIButton *helpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    helpBtn.frame = CGRectMake((kScreenWidth - 100) / 2, 150, 100, 30);
//    helpBtn.backgroundColor = [UIColor redColor];
    [helpBtn setTitle:@"连接帮助" forState:UIControlStateNormal];
    helpBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [helpBtn setTitleColor:[UIColor colorWithRed:0 / 255.0 green:141 / 255.0  blue:205 / 255.0  alpha:1] forState:UIControlStateNormal];
    [helpBtn addTarget:self action:@selector(helpBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.rTableView addSubview:helpBtn];
}

//帮助
- (void)helpBtnClick
{
    HelpViewController *vc = [[HelpViewController alloc]init];
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark- tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RemoterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"remoter"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RemoterTableViewCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RemoterDetailController *vc = [[RemoterDetailController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    self.navigationController.navigationBar.hidden = NO;
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar hideTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
