//
//  MainTabBarViewController.h
//  沃24
//
//  Created by Mac on 14-11-17.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarViewController : UITabBarController

@property (nonatomic ,assign) BOOL isHiden;
@property (nonatomic ,strong) UIImageView *imageView;
//被选中的button
@property (nonatomic,strong) UIButton *seletedButton;

/**显示tabBar*/
- (void)showTabBar;

/**影藏tabBar*/
- (void)hideTabBar;
- (void)hideTabBarWithAnimation:(BOOL)ret;

@end
