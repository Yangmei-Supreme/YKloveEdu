//
//  userNameModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/30.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface postModel : NSObject
@property (nonatomic,assign) NSUInteger topicCommentnum;//评论数
@property (nonatomic,copy) NSString *topicTime;//评论时间
@property (nonatomic,copy) NSString *topicSecTitle;//题目

+ (instancetype)userWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
