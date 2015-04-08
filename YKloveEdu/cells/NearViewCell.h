//
//  NearViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/19.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class nearModel;

@interface NearViewCell : UITableViewCell
@property (nonatomic,strong) nearModel *near;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
