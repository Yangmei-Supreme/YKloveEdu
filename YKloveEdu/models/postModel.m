//
//  userNameModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/30.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "postModel.h"

@implementation postModel

+ (instancetype)userWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.topicTime = dic[@"topicTime"];
        self.topicSecTitle = dic[@"topicSecTitle"];
        self.topicCommentnum = [dic[@"topicCommentnum"] integerValue];
    }
    return self;
}

@end
