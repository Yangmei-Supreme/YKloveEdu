//
//  StudyViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StudyModel;

@interface StudyViewCell : UITableViewCell
@property (nonatomic,strong) StudyModel *study;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
