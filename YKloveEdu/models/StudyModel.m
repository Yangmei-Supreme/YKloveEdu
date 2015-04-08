//
//  StudyModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "StudyModel.h"

@implementation StudyModel

+ (instancetype)studyWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.courseImageUrl = dic[@"courseImageUrl"];
        self.title = dic[@"title"];
        self.coursekeywork = dic[@"coursekeywork"];
        self.courseId = [dic[@"courseId"] integerValue];
    }
    return self;
}

@end
