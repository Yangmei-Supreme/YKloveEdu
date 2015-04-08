//
//  MyBuyViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MyBuyViewController.h"
#import "MyBuyCollectionViewCell.h"
#import "MyBuyModel.h"
#import "UIImageView+WebCache.h"

@interface MyBuyViewController () <UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    MyBuyModel *buy;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layOut;
@property (nonatomic,strong) NSArray *buyArray;

@end

@implementation MyBuyViewController

- (NSArray *)buyArray
{
    if (!_buyArray) {
        _buyArray = [NSArray array];
    }
    return _buyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的购买";
    _layOut.itemSize = CGSizeMake(kScreenWidth / 2 - 1, 110);
    self.collectView.dataSource = self;
    self.collectView.delegate = self;
    self.collectView.showsVerticalScrollIndicator = NO;
    [self.collectView registerClass:[MyBuyCollectionViewCell class] forCellWithReuseIdentifier:@"MyBuy"];
    [self buyBack];
    [self dataGetRequest];
    
}

//返回
- (void)buyBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(buyBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}

- (void)buyBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
    [tabBar showTabBar];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 网络请求
- (void)dataGetRequest
{
    //创建urlString
    NSString * urlString = [NSString stringWithFormat:@"%@%@?userid=%d",kBaseURL_test,kMyBuy,1];
    
    //数据请求的队列管理器,单利
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data,不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置之后请求到得数据就不会JSON解析
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableContainers error:nil];
        NSArray *dicArr = dict[@"courselist"];
        NSMutableArray *array = [NSMutableArray array];
        //遍历数组中的每个元素(都是字典)
        for (NSDictionary * dic in dicArr) {
            buy = [MyBuyModel buyWithDic:dic];
            //将model存储到tableView得数据源数组中
            [array addObject:buy];
        }
        self.buyArray = array;
        
        //刷新tableView
        [self.collectView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //失败
        YMLog(@"faild");
    }];
}


#pragma mark-coll delegate
#pragma mark - 数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.buyArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyBuyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyBuy" forIndexPath:indexPath];
    [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:buy.courseImageUrl]];
    cell.titleLabel.text = buy.courseName;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YMLog(@"%ld",indexPath.row);
}


@end
