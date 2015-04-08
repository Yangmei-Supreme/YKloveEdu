//
//  ZanModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZanModel : NSObject

@property (nonatomic,copy) NSString *praiseTime;//shijian
@property (nonatomic,copy) NSString *topicTitle;//题目
@property (nonatomic,copy) NSString *praiseUserName;//名字

+ (instancetype)zanWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
