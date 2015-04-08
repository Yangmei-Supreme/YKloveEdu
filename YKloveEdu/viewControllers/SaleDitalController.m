//
//  SaleDitalController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/20.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "SaleDitalController.h"
#import "BriefView.h"
#import "CourseView.h"
#import "AboutView.h"
#import "SaleModel.h"
#import "UIImageView+WebCache.h"

@interface SaleDitalController ()
{
    BriefView *_briefView;
    CourseView *_courseView;
    AboutView *_aboutView;
    MBProgressHUD *_hud;
}
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;

@end

@implementation SaleDitalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //返回
    [self saleDitalBack];
    
    [_hud show:YES];
    [self initWidget];
    
    [self requestData];
}

//返回
- (void)saleDitalBack
{
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 35, 20);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [back addTarget:self action:@selector(saleDitalBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
}

//返回
- (void)saleDitalBackClick
{
    [self.navigationController popViewControllerAnimated:YES];
    if (self.navigationController.viewControllers.count == 1) {
        MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
        [tabBar showTabBar];
    }
}

- (void)initWidget
{
    CGRect frame =CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200);//如果没有导航栏，则去掉64
    //对应填写两个数组
    _briefView = [[BriefView alloc] initWithFrame:frame];
    _courseView = [[CourseView alloc] initWithFrame:frame];
    _aboutView = [[AboutView alloc] initWithFrame:frame];
    _aboutView.nav = self.navigationController;
    NSArray *views =@[_briefView,_courseView,_aboutView];
    NSArray *names =@[@"    简介     ",@"    课时     ",@" 相关课程 "];
    //创建使用
    self.scroll =[XLScrollViewer scrollWithFrame:frame withViews:views withButtonNames:names withThreeAnimation:222];
    //自定义各种属性。。打开查看
    self.scroll.xl_topBackColor =[UIColor whiteColor];
    //    self.scroll.xl_sliderColor =[UIColor colorWithRed:20 / 255.0 green:170 / 255.0 blue:0 / 255.0 alpha:1];
    self.scroll.xl_buttonColorNormal =[UIColor blackColor];
    self.scroll.xl_buttonColorSelected =[UIColor colorWithRed:20 / 255.0 green:170 / 255.0 blue:0 / 255.0 alpha:1];
    self.scroll.xl_buttonFont = 15;
    //    self.scroll.xl_buttonToSlider = 20;
    self.scroll.xl_sliderHeight = 44;
    self.scroll.xl_topHeight =44;
    self.scroll.xl_isSliderCorner =YES;
    //加入控制器视图
    [self.view addSubview:self.scroll];
}

#pragma mark - requestData
- (void)requestData
{
    NSString *urlString1 = [NSString stringWithFormat:@"%@%@%d",kBaseURL_test,kDetaile_Abstract,1];
    NSString *urlString2 = [NSString stringWithFormat:@"%@%@%d",kBaseURL_test,kDetaile_Course,1];
    NSString *urlString3 = [NSString stringWithFormat:@"%@%@%d",kBaseURL_test,kDetaile_StudyTime,1];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString1]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               YMLog(@"1");
                               if (connectionError) {
                                   YMLog(@"%@",connectionError);
                                   return ;
                               }
                               if (data) {
                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:nil];
                                   _briefView.dataDict = dict;
                                   self.title = dict[@"title"];
                               }
                           }];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString2]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               YMLog(@"2");
                               if (connectionError) {
                                   YMLog(@"%@",connectionError);
                                   return ;
                               }
                               if (data) {
                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:nil];
                                   _courseView.dataDict = dict;
                               }
                           }];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString3]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               YMLog(@"3");
                               if (connectionError) {
                                   YMLog(@"%@",connectionError);
                                   return ;
                               }
                               if (data) {
                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:nil];
                                   [_backImageView setImageWithURL:[NSURL URLWithString:dict[@"imageUrl"]]
                                                  placeholderImage:[UIImage imageNamed:@""]
                                    ];
                                   //
                                   _titleLabel.text = [NSString stringWithFormat:@"特价：%@",dict[@"price"]];
                                   _titleLabel.font = [UIFont systemFontOfSize:16];
                                   
                               }
                           }];
    [_hud hide:YES];
}

- (void)createHUD
{
    //创建菊花
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    
    [self.view addSubview:_hud];
    
    _hud.labelText = @"正在加载";
    _hud.mode = MBProgressHUDModeIndeterminate;
    //背景颜色
    _hud.color = [UIColor colorWithWhite:0 alpha:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

