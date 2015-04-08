//
//  ZanTableViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/31.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "ZanTableViewCell.h"
#import "ZanModel.h"

@interface ZanTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *conLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ZanTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"zan";
    ZanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZanTableViewCell" owner:self options:nil]lastObject];
    }
    return cell;
}

- (void)setZan:(ZanModel *)zan
{
    _zan = zan;
    self.nameLabel.text = zan.praiseUserName;
    self.conLabel.text = zan.topicTitle;
    self.timeLabel.text = zan.praiseTime;
}

@end
