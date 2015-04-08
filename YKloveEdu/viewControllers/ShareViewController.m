//
//  ShareViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//


#import "ShareViewController.h"

#import "ShareModel.h"
#import "ShareViewCell.h"
#import "NavViewController.h"
#import "NearViewController.h"
#import "SendViewController.h"
#import "MJNews.h"
#import "MJNewsView.h"
#import "UIView+MJ.h"

@interface ShareViewController ()
@property (nonatomic,strong) NSArray *shareArray;
@property (strong,nonatomic) NSArray  *adArray;

@end

@implementation ShareViewController

- (NSArray *)shareArray
{
    if (!_shareArray) {
        _shareArray = [NSArray array];
    }
    return _shareArray;
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

    self.title = @"分享";
    [self.hud show:YES];
    //网络请求
    [self dataGetRequest];
    
    [self createNavButton];
}

- (void)createNavButton
{
    UIButton * ftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ftBtn.frame = CGRectMake(0, 0, 35, 20);
    [ftBtn setTitle:@"发帖" forState:UIControlStateNormal];
    [ftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ftBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [ftBtn addTarget:self action:@selector(ftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:ftBtn];
    
    UIButton * nearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nearBtn.frame = CGRectMake(0, 0, 12, 16);
    [nearBtn setBackgroundImage:[UIImage imageNamed:@"dw"] forState:UIControlStateNormal];
    [nearBtn addTarget:self action:@selector(nearBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:nearBtn];
}

//点击发帖
- (void)ftBtnClick
{
    SendViewController *vc = [[SendViewController alloc]init];
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

//附近
- (void)nearBtnClick
{
    NearViewController *nvc = [[NearViewController alloc]init];
    NavViewController *nnav = [[NavViewController alloc]initWithRootViewController:nvc];
    [self presentViewController:nnav animated:YES completion:nil];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@",kBaseURL_test,kShare];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dicArr1 = dict[@"topiclist"];
        
        NSMutableArray *array1 = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr1) {
            ShareModel *share = [ShareModel ShareWithDic:dic];
            //将model存储到tableView得数据源数组中
            [array1 addObject:share];
        }
        self.shareArray = array1;
        NSArray *dicArr2 = dict[@"advertlist"];
        
        NSMutableArray *array2 = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr2) {
            ShareModel *share = [ShareModel ShareWithDic:dic];
            //将model存储到tableView得数据源数组中
            [array2 addObject:share];
        }
        self.adArray = array2;
        
        //刷新tableView
        [self.myTableView reloadData];
        [self initAdView];
        [self.hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        YMLog(@"faild");
        [self.hud hide:YES];
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
    return self.shareArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShareViewCell *cell = [ShareViewCell cellWithTableView:tableView];
    cell.share = self.shareArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
