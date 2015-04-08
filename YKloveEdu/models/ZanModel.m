//
//  ZanModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "ZanModel.h"

@implementation ZanModel

+ (instancetype)zanWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];

}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.topicTitle = dic[@"topicTitle"];
        self.praiseTime = dic[@"praiseTime"];
        self.praiseUserName = dic[@"praiseUserName"];
    }
    return self;
}

@end
