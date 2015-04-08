//
//  AnswerTableViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "AnswerTableViewCell.h"
#import "AnswerModel.h"
#import "UIImageView+WebCache.h"

@interface AnswerTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation AnswerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setIconImage:(UIImageView *)iconImage
{
    _iconImage = iconImage;
    iconImage.layer.cornerRadius = 30;
    iconImage.layer.masksToBounds = YES;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"zan";
    AnswerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AnswerTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}

- (void)setAnswer:(AnswerModel *)answer
{
    _answer = answer;
    self.timeLabel.text = answer.commentTime;
    self.titleLabel.text = answer.title;
    self.contentLabel.text = answer.commentContent;
    self.nameLabel.text = answer.commentUserName;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:answer.commentUserImg]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
