//
//  ShareModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "ShareModel.h"

@implementation ShareModel

+ (instancetype)ShareWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.topicCommentnum = [dic[@"topicCommentnum"] integerValue];
        self.topicId = [dic[@"topicId"] integerValue];
        self.topicImg = dic[@"topicImg"];
        self.topicTime = dic[@"topicTime"];
        self.topicTitle = dic[@"topicTitle"];
        self.topicUserName = dic[@"topicUserName"];
        
        self.advUrl = dic[@"advUrl"];
        self.courseId = [dic[@"courseId"] integerValue];
    }
    return self;
}

@end
