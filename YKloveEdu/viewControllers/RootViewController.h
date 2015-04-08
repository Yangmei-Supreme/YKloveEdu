//
//  RootViewController.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import <CoreLocation/CoreLocation.h>

@interface RootViewController : UIViewController <CLLocationManagerDelegate>
//地理位置
@property (nonatomic, strong)CLLocation * location;
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) MBProgressHUD *hud;

@end
