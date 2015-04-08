//
//  nearModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/19.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface nearModel : NSObject
@property (nonatomic,copy) NSString *nearByCourse;//学习课程
@property (nonatomic,assign) NSInteger nearById;//id
@property (nonatomic,assign) NSInteger nearByJuli;//距离
@property (nonatomic,copy) NSString *nearByTime;//时间
@property (nonatomic,copy) NSString *nearByTitle;//标题
@property (nonatomic,copy) NSString *nearByUserImg;//头像
@property (nonatomic,copy) NSString *nearByUserName;//名字

+ (instancetype)nearWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
