//
//  ZanTableViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZanModel;

@interface ZanTableViewCell : UITableViewCell
@property (nonatomic,strong) ZanModel *zan;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
