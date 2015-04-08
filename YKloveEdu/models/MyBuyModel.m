//
//  MyBuyModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MyBuyModel.h"

@implementation MyBuyModel

+ (instancetype)buyWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
    
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.courseImageUrl = dic[@"courseImageUrl"];
        self.courseName = dic[@"courseName"];
        self.courseId = [dic[@"courseId"] integerValue];
    }
    return self;
}
@end
