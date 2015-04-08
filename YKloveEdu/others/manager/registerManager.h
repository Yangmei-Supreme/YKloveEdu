//
//  registerManager.h
//  沃24
//
//  Created by Mac on 14-12-17.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface registerManager : NSObject

//YES:已登录
@property (nonatomic, assign) BOOL isLogin;//是否登录
@property(nonatomic,copy)NSString*userName;//账号
@property(nonatomic,copy)NSString*passWord;//密码
@property (nonatomic, copy) NSString * uid;//UID
@property (nonatomic, copy) NSString * address;//地址
@property (nonatomic, copy) NSString * sex;//性别
@property (nonatomic, copy) NSString * nickName;//昵称
@property (nonatomic, copy) NSString * longitude;//经度
@property (nonatomic, copy) NSString * latitude;//纬度

//单例对象 记录账号
+ (id)shareManager;

@end
