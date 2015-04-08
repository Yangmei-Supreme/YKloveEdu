//
//  SaleViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "SaleViewController.h"

#import "UIImageView+WebCache.h"
#import "SaleModel.h"
#import "SaleViewCell.h"
#import "MJNews.h"
#import "MJNewsView.h"
#import "UIView+MJ.h"
#import "SaleDitalController.h"

@interface SaleViewController ()
{
    SaleDitalController *_saleDital;
}
@property (nonatomic,strong) NSArray *saleArray;
@property (nonatomic,strong) UIView *headerView;
@property (strong,nonatomic) NSArray  *adArray;

@end

@implementation SaleViewController

//懒加载
- (NSArray *)saleArray
{
    if (!_saleArray) {
        _saleArray = [NSArray array];
    }
    return _saleArray;
}

- (NSArray *)adArray
{
    if (!_adArray) {
        _adArray = [NSArray array];
    }
    return _adArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(advCellClick:)
                                                 name:@"advCellClick"
                                               object:nil
                                            ];
    self.view.backgroundColor = [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1];
    self.title = @"特卖";
    self.myTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.hud show:YES];
    [self dataGetRequest];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@",kBaseURL_test,kSale];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *downArr = dict[@"courseList"];
        NSArray *upArr = dict[@"adlist"];
        NSMutableArray *array1 = [NSMutableArray array];
        NSMutableArray *array2 = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dict in downArr) {
            SaleModel *sale = [SaleModel saleWithDic:dict];
            
            //将model存储到tableView得数据源数组中
            [array1 addObject:sale];
        }
        self.saleArray = array1;
        for (NSDictionary *dict in upArr) {
            SaleModel *sale = [SaleModel saleWithDic:dict];
            [array2 addObject:sale];
        }
        self.adArray = array2;
        //刷新tableView
        [self.myTableView reloadData];
        [self initAdView];
        [self.hud hide:YES];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
//        YMLog(@"faild");
        [self.hud hide:YES];

        YMLog(@"%@",error);
    }];
}

//广告位
- (void) initAdView
{
    MJNewsView *newsView = [MJNewsView newsView];
    newsView.x = 0;
    newsView.y = 0;
    newsView.newses = self.adArray;
    self.myTableView.tableHeaderView = newsView;
}

#pragma mark- tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.saleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaleViewCell *cell = [SaleViewCell cellWithTableView:tableView];
    cell.sale = self.saleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushDetialController:self.saleArray[indexPath.row]];
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar hideTabBar];
}

- (void) advCellClick:(NSNotification *)notif
{
    SaleModel * model = notif.userInfo[@"model"];
    [self pushDetialController:model];
}

- (void) pushDetialController:(SaleModel *)model
{
    _saleDital = [[SaleDitalController alloc] init];
    _saleDital.model = model;
    [self.navigationController pushViewController:_saleDital animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"advCellClick" object:nil];
}

@end
