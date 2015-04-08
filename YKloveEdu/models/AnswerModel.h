//
//  AnswerModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnswerModel : NSObject

@property (nonatomic,copy) NSString *commentTime;//shijian
@property (nonatomic,copy) NSString *title;//题目
@property (nonatomic,copy) NSString *commentUserName;//名字
@property (nonatomic,copy) NSString *commentContent;//neirong
@property (nonatomic,copy) NSString *commentUserImg;//头像
@property (nonatomic,assign) NSUInteger topicId;//id

+ (instancetype)answerWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
