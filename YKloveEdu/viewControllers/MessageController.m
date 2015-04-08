//
//  MessageController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MessageController.h"
#import "MessageModel.h"
#import "MessageTableViewCell.h"

@interface MessageController ()
@property (nonatomic,strong) NSArray *messageArray;

@end

@implementation MessageController

- (NSArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = [NSArray array];
    }
    return _messageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.title = @"系统消息";
    self.view.backgroundColor = [UIColor whiteColor];
    [self messageBack];
    [self dataGetRequest];
}

//返回
- (void)messageBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(messageBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}


- (void)messageBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@?userid=%d",kBaseURL_test,kMessage,1];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dicArr = dict[@"messageList"];
        
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr) {
            MessageModel *message = [MessageModel messageWithDic:dic];
            //将model存储到tableView得数据源数组中
            [array addObject:message];
        }
        self.messageArray = array;
        
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

    return self.messageArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [MessageTableViewCell cellWithTableView:tableView];
    cell.message = self.messageArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
