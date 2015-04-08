//
//  AnswerController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "AnswerController.h"
#import "AnswerModel.h"
#import "AnswerTableViewCell.h"

@interface AnswerController ()
@property (nonatomic,strong) NSArray *answerArray;

@end

@implementation AnswerController

- (NSArray *)answerArray
{
    if (!_answerArray) {
        _answerArray = [NSArray array];
    }
    return _answerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"收到回复";
    [self answerBack];
    [self dataGetRequest];
}

//返回
- (void)answerBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(answerBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}


- (void)answerBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@?userid=%d",kBaseURL_test,kAnswer,1];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dicArr = dict[@"comments"];
        
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr) {
            AnswerModel *answer = [AnswerModel answerWithDic:dic];
            //将model存储到tableView得数据源数组中
            [array addObject:answer];
        }
        self.answerArray = array;
        
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
    return self.answerArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnswerTableViewCell *cell = [AnswerTableViewCell cellWithTableView:tableView];
    cell.answer = self.answerArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
