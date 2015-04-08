//
//  MessageModel.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

+ (instancetype)messageWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
    
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.messageTitle = dic[@"messageTitle"];
        self.messageTime = dic[@"messageTime"];
        self.messageId = [dic[@"messageId"] integerValue];
    }
    return self;
}

@end
