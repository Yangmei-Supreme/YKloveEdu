//
//  RecordViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()
@property (nonatomic,strong) NSArray *recordArray;

@end

@implementation RecordViewController

- (NSArray *)recordArray
{
    if (!_recordArray) {
        _recordArray = [NSArray array];
    }
    return _recordArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"观看记录";
    [self recordBack];
}

//返回
- (void)recordBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(recordBackClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
    UIButton * edit = [UIButton buttonWithType:UIButtonTypeCustom];
    edit.frame = CGRectMake(0, 0, 35, 20);
    [edit setTitle:@"编辑" forState:UIControlStateNormal];
    [edit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    edit.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(recordEditClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:edit];
    
}

- (void)recordBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar showTabBar];
    self.navigationController.navigationBar.hidden = YES;
}

//编辑
- (void)recordEditClick
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end
