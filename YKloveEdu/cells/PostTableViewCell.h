//
//  PostTableViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/30.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class postModel;
@interface PostTableViewCell : UITableViewCell
@property (nonatomic,strong) postModel *post;
@property (weak, nonatomic) IBOutlet UILabel *secTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
