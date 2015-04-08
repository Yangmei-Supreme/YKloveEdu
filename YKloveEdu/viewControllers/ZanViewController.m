//
//  ZanViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "ZanViewController.h"
#import "ZanModel.h"
#import "ZanTableViewCell.h"

@interface ZanViewController ()
@property (nonatomic,strong) NSArray *zanArray;

@end

@implementation ZanViewController

- (NSArray *)zanArray
{
    if (!_zanArray) {
        _zanArray = [NSArray array];
        
    }
    return _zanArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收到的赞";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 100;
    [self zanBack];
    [self dataGetRequest];
}

//返回
- (void)zanBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(zanBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}


- (void)zanBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@?userid=%d",kBaseURL_test,kZan,1];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSArray *dicArr = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr) {
            ZanModel *zan = [ZanModel zanWithDic:dic];
            //将model存储到tableView得数据源数组中
            [array addObject:zan];
        }
        self.zanArray = array;
        
        //刷新tableView
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        YMLog(@"faild");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.zanArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZanTableViewCell *cell = [ZanTableViewCell cellWithTableView:tableView];
    cell.zan = self.zanArray[indexPath.row]? : @" ";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
