//
//  MJNews.h
//  预习-03-无限滚动
//
//  Created by MJ Lee on 14-5-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJNews : NSObject
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *icon;

@property (nonatomic,strong) NSString *advUrl;//广告图片
@property (nonatomic,strong) NSString *adid;//广告id

@property (nonatomic,strong) NSString *iconUrl;//头像图片
@property (nonatomic,strong) NSString *name;//题目
@property (nonatomic,assign) NSUInteger sid;//id
@end
