//
//  SaleViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SaleModel;
@interface SaleViewCell : UITableViewCell

@property (nonatomic,strong) SaleModel *sale;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
