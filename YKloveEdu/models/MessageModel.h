//
//  MessageModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic,copy) NSString *messageTime;//shijian
@property (nonatomic,copy) NSString *messageTitle;//题目
@property (nonatomic,assign) NSUInteger messageId;//id

+ (instancetype)messageWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
