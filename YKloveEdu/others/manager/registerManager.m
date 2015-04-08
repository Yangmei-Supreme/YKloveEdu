//
//  registerManager.m
//  沃24
//
//  Created by Mac on 14-12-17.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "registerManager.h"

@implementation registerManager

static registerManager*manager = nil;

+(id)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[registerManager alloc]init];
    });
    return manager;
}

@end
