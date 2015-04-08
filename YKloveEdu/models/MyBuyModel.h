//
//  MyBuyModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyBuyModel : NSObject
@property (nonatomic,copy) NSString *courseImageUrl;//图片url
@property (nonatomic,copy) NSString *courseName;//名字
@property (nonatomic,assign) NSUInteger courseId;//id

+ (instancetype)buyWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
