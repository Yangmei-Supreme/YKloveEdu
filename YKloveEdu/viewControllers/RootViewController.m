//
//  RootViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "RootViewController.h"

#import "RemoterViewController.h"
#import "SaleViewController.h"
#import "StudyViewController.h"
#import "ShareViewController.h"
#import "MeViewController.h"
#import "CLLocation+Sino.h"

@interface RootViewController () <UITableViewDelegate,UITableViewDataSource>
{
    //定位管理器
    CLLocationManager * _locationManager;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化tableview
    if ([self isKindOfClass:[RemoterViewController class]] == NO && [self isKindOfClass:[MeViewController class]] == NO) {
        [self initTableView];
    }
    [self createHUD];
    //定位
    [self locationService];
}

#pragma mark - 初始化tableview
- (void)initTableView
{
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    self.myTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.myTableView];
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

#pragma mark - 定位
- (void)locationService
{
    if ([CLLocationManager locationServicesEnabled] == NO && [CLLocationManager headingAvailable] == NO)  {
        //定位服务不可用
        NSLog(@"-->定位服务不可用");
        return;
        
    }else {
        //定位服务可用
        //设备可以使用
        if (!_locationManager) {
            _locationManager = [[CLLocationManager alloc] init];
            if ([[[UIDevice currentDevice] systemVersion] doubleValue] > 8.0)
            {
                //设置定位权限 仅ios8有意义
                [_locationManager requestWhenInUseAuthorization];// 前台定位
                
                [_locationManager requestAlwaysAuthorization];// 前后台同时定位
            }
            //做定位的相关设置
            
            //设置定位的精度,几种精度一目了然
            //定位精度越高越费电
            _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            
            //设置当位置发生多少改变会重新定位（回调位置改变的方法）
            _locationManager.distanceFilter = 1;
            //单位是 米
            
            //设置代理
            _locationManager.delegate = self;
            
            /* * 以下是方向定位的设置 * */
            
            //设置方向转动角度达到一定时,回调相关方法
            _locationManager.headingFilter = 5;
            //单位   角度( ° )
            
            //设置手机的当前方向,指的是以上方前,还是横屏,甚至是以button为前
            _locationManager.headingOrientation = CLDeviceOrientationPortrait;
            
        }
        //启动定位
        [_locationManager startUpdatingLocation];
        
        //启动方向定位服务
        [_locationManager startUpdatingHeading];
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败...");
    if (error.code == kCLErrorDenied) {
        NSLog(@"用户不允许使用定位服务..");
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.location = [locations lastObject];
    self.location = self.location.locationBearPawFromMars;
    
    //只需要定位一次
    [manager stopUpdatingHeading];
    [manager stopUpdatingLocation];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:self.location completionHandler:^(NSArray *placemark,NSError *error){
//        CLPlacemark * mark = [placemark objectAtIndex:0];
//        NSDictionary * dict = mark.addressDictionary;
        registerManager *rManager = [registerManager shareManager];
        rManager.longitude = [NSString stringWithFormat:@"%f",self.location.coordinate.longitude];
        rManager.latitude = [NSString stringWithFormat:@"%f",self.location.coordinate.latitude];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
