//
//  AnswerTableViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AnswerModel;

@interface AnswerTableViewCell : UITableViewCell
@property (nonatomic,strong)AnswerModel *answer;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
