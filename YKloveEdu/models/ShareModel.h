//
//  ShareModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareModel : NSObject
@property (nonatomic,assign) NSInteger topicCommentnum;//评论数
@property (nonatomic,assign) NSInteger topicId;//id
@property (nonatomic,copy) NSString *topicImg;//头像图片
@property (nonatomic,copy) NSString *topicTime;//时间
@property (nonatomic,copy) NSString *topicTitle;//正文
@property (nonatomic,copy) NSString *topicUserName;//用户名字

@property (nonatomic,strong) NSString *advUrl;//广告
@property (nonatomic,assign) NSInteger courseId;//广告id

+ (instancetype)ShareWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end