//
//  StudyViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "StudyViewController.h"

#import "StudyModel.h"
#import "StudyViewCell.h"
#import "FSDropDownMenu.h"
#import "SaleDitalController.h"

@interface StudyViewController () <FSDropDownMenuDataSource,FSDropDownMenuDelegate>
{
    SaleDitalController *_saleDital;
}

@property (nonatomic,strong)NSArray *studyArray;
@property(nonatomic,strong) NSArray *ageArr;

@end

@implementation StudyViewController

- (NSArray *)studyArray
{
    if (!_studyArray) {
        _studyArray = [NSArray array];
    }
    return _studyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"学习";
    [self.hud show:YES];
    [self createNavBtn];
    //网络请求
    [self dataGetRequest];
}

- (void)createNavBtn
{
    UIButton * sxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sxBtn.frame = CGRectMake(0, 0, 22, 17);
    [sxBtn setBackgroundImage:[UIImage imageNamed:@"shaixuan"] forState:UIControlStateNormal];
    [sxBtn addTarget:self action:@selector(loginBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sxBtn];
    
    _ageArr = @[@"0-3岁",@"3-6岁",@"6-9岁"];
    
    FSDropDownMenu *menu = [[FSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:132];
    menu.transformView = sxBtn.imageView;
    menu.tag = 1001;
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
}

- (void)loginBackClick
{
    FSDropDownMenu *menu = (FSDropDownMenu*)[self.view viewWithTag:1001];
    [UIView animateWithDuration:0.2 animations:^{
        
    } completion:^(BOOL finished) {
        [menu menuTapped];
    }];
}

#pragma mark - FSDropDown datasource & delegate

- (NSInteger)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{

    return _ageArr.count;
}
- (NSString *)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView titleForRowAtIndexPath:(NSIndexPath *)indexPath{

    return _ageArr[indexPath.row];
}


- (void)menu:(FSDropDownMenu *)menu tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
     YMLog(@"%@被点击了",_ageArr[indexPath.row]);
    
    [self requestAgeData:indexPath];
}

- (void)requestAgeData:(NSIndexPath *)indexPath
{
    
    //创建urlString
    NSInteger rowNum;
    if ([indexPath isEqual:@"0-3岁"]) {
        rowNum = 1;
    }else if ([indexPath isEqual:@"3-6岁"]) {
        rowNum = 2;
    }else if ([indexPath isEqual:@"6-9岁"]) {
        rowNum = 3;
    }
    YMLog(@"_ageArr[indexPath.row]--%@",_ageArr[indexPath.row]);
    NSString * urlString = [NSString stringWithFormat:@"%@%@?%ld",kBaseURL_test,kStudySift,rowNum];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArr = dict[@"list"];
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dict in dataArr) {
            StudyModel *study = [StudyModel studyWithDic:dict];
            //将model存储到tableView得数据源数组中
            [array addObject:study];
        }
        self.studyArray = array;
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
    return self.studyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudyViewCell *cell = [StudyViewCell cellWithTableView:tableView];
    cell.study = self.studyArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@",kBaseURL_test,kStudy];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArr = dict[@"list"];
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dict in dataArr) {
            StudyModel *study = [StudyModel studyWithDic:dict];
            //将model存储到tableView得数据源数组中
            [array addObject:study];
        }
        self.studyArray = array;
        //刷新tableView
        [self.myTableView reloadData];
        [self.hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        YMLog(@"faild");
        [self.hud hide:YES];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushDetialController:self.studyArray[indexPath.row]];
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar hideTabBar];
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

@end
