//
//  SaleModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "SaleModel.h"

@implementation SaleModel

+ (instancetype)saleWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.iconUrl = dic[@"iconUrl"];
        self.name = dic[@"name"];
        self.sid = [dic[@"id"] integerValue];
        self.advUrl = dic[@"advUrl"];
        self.adid = [dic[@"adid"] integerValue];
    }
    return self;
}

@end
