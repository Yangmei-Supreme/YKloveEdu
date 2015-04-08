//
//  StudyModel.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudyModel : NSObject
@property (nonatomic,copy) NSString *courseImageUrl;//课程图片
@property (nonatomic,copy) NSString *coursekeywork;//关键字
@property (nonatomic,copy) NSString *title;//title
@property (nonatomic,assign) NSUInteger courseId;//id

+ (instancetype)studyWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
