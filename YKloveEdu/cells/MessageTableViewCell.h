//
//  MessageTableViewCell.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;

@interface MessageTableViewCell : UITableViewCell
@property (nonatomic,strong) MessageModel *message;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
