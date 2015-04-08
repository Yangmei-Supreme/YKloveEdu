//
//  ShareViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShareModel;

@interface ShareViewCell : UITableViewCell
@property (nonatomic,strong) ShareModel *share;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
