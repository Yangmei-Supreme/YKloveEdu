//
//  AnswerModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "AnswerModel.h"

@implementation AnswerModel

+ (instancetype)answerWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
    
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.commentTime = dic[@"commentTime"];
        self.commentUserImg = dic[@"commentUserImg"];
        self.commentContent = dic[@"commentContent"];
        self.topicId = [dic[@"topicId"] integerValue];
        self.commentUserName = dic[@"commentUserName"];
    }
    return self;
}

@end
