//
//  SaleDitalController.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/19.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLScrollViewer.h"
@class SaleModel;

@interface SaleDitalController : UIViewController
@property(nonatomic ,strong)XLScrollViewer *scroll;//如果无需外部调用XLScrollViewer的属性，则无需写此属性
@property(nonatomic, weak) SaleModel *model;
@end
