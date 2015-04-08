//
//  UserNameController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/30.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "UserNameController.h"

@interface UserNameController ()

@end

@implementation UserNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号设置";
    self.view.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:239 / 255.0  blue:244 / 255.0  alpha:1];
    //返回
    [self settingBack];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

//返回
- (void)settingBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(settingBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}


- (void)settingBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else {
        return 3;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userName"];
    if (!cell) {
//        if (indexPath.row == 0) {
//            cell = [[[NSBundle mainBundle] loadNibNamed:@"UserNameViewCell" owner:self options:nil]lastObject];
//        }else {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userName"];
//        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 20;
    }else {
        return 0;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 44;
//}

@end
