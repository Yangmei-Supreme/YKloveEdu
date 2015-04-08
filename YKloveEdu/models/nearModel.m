//
//  nearModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/19.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "nearModel.h"

@implementation nearModel

+ (instancetype)nearWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.nearByCourse = dic[@"nearByCourse"];
        self.nearById = [dic[@"nearById"] integerValue];
        self.nearByJuli = [dic[@"nearByJuli"] integerValue];
        self.nearByTime = dic[@"nearByTime"];
        self.nearByTitle = dic[@"nearByTitle"];
        self.nearByUserImg = dic[@"nearByUserImg"];
        self.nearByUserName = dic[@"nearByUserName"];
    }
    return self;
}

@end
