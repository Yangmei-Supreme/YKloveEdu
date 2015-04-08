//
//  SaleModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaleModel : NSObject

@property (nonatomic,copy) NSString *iconUrl;//头像图片
@property (nonatomic,copy) NSString *name;//题目
@property (nonatomic,assign) NSUInteger sid;//id

@property (nonatomic,copy) NSString *advUrl;//广告图片
@property (nonatomic,assign) NSUInteger adid;//广告id

+ (instancetype)saleWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
