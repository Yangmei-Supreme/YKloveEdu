//
//  MyPostController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/30.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MyPostController.h"
#import "postModel.h"
#import "PostTableViewCell.h"


@interface MyPostController ()
@property (nonatomic,strong) NSMutableArray *postArray;

@end

@implementation MyPostController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的发帖";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //返回
    [self myPostBack];
    //网络请求
    [self dataGetRequest];
}

//返回
- (void)myPostBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(myPostBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}


- (void)myPostBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@?userid=%d",kBaseURL_test,kUserName,1];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dicArr = dict[@"topiclist"];
        
        if (!_postArray) {
            _postArray = [[NSMutableArray alloc] init];
        }
        [_postArray removeAllObjects];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr) {
            postModel *post = [postModel userWithDic:dic];
            //将model存储到tableView得数据源数组中
            [_postArray addObject:post];
        }
        
        //刷新tableView
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        YMLog(@"faild");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostTableViewCell *cell = [PostTableViewCell cellWithTableView:tableView];
    cell.post = self.postArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
