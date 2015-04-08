//
//  MessageTableViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "MessageModel.h"

@interface MessageTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation MessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"message";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}

- (void)setMessage:(MessageModel *)message
{
    _message = message;
    self.contentLabel.text = message.messageTitle;
    self.timeLabel.text = message.messageTime;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
