//
//  NearViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/19.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "NearViewController.h"

#import "nearModel.h"
#import "NearViewCell.h"

@interface NearViewController ()
@property (nonatomic,strong) NSArray *nearArray;

@end

@implementation NearViewController

- (NSArray *)nearArray
{
    if (!_nearArray) {
        _nearArray = [NSArray array];
    }
    return _nearArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"附近学习";
    [self nearBack];
    [self.hud show:YES];
    //网络请求
    [self dataGetRequest];
    
}

//返回按键
- (void)nearBack
{
    UIButton * nearBack = [UIButton buttonWithType:UIButtonTypeCustom];
    nearBack.frame = CGRectMake(0, 0, 35, 20);
    [nearBack setTitle:@"返回" forState:UIControlStateNormal];
    [nearBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nearBack.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [nearBack addTarget:self action:@selector(nearBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:nearBack];
    
}

//返回
- (void)nearBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    registerManager *rManager = [registerManager shareManager];
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@?longitude=%@&latitude=%@",kBaseURL_test,kNearStudy,rManager.longitude,rManager.latitude];
    YMLog(@"url:%@",urlString);

    //传出经纬度
    NSURL *locaUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?longitude=%@&latitude=%@",kBaseURL_test,kNearStudy,rManager.longitude,rManager.latitude]];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:locaUrl];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    }];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSArray *dicArr   = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dict in dicArr) {
            nearModel *near = [nearModel nearWithDic:dict];
            //将model存储到tableView得数据源数组中
            [array addObject:near];
        }
        self.nearArray = array;
        //刷新tableView
        [self.myTableView reloadData];
        
        [self.hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        YMLog(@"faild");
        [self.hud hide:YES];
    }];
}

#pragma mark- tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nearArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NearViewCell *cell = [NearViewCell cellWithTableView:tableView];
    cell.near = self.nearArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
