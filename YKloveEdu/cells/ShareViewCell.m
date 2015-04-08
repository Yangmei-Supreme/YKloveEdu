//
//  ShareViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "ShareViewCell.h"
#import "ShareModel.h"
#import "UIImageView+WebCache.h"

@interface ShareViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *topicTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UILabel *countNum;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *myName;

@end

@implementation ShareViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"share";
    ShareViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"ShareViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setShare:(ShareModel *)share
{
    _share = share;
    self.topicTitleLabel.text = share.topicTitle;
    self.countNum.text = [NSString stringWithFormat:@"%ld",share.topicCommentnum];
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:share.topicImg]];

    NSDateFormatter *farmatter = [[NSDateFormatter alloc]init];
    [farmatter setDateFormat:@"YY/MM/dd HH:mm:ss"];
    
    //时间差
    NSDate *date1 = [farmatter dateFromString:share.topicTime];
    NSDate *date2 = [NSDate date];
    NSTimeInterval aTimer = [date2 timeIntervalSinceDate:date1];
    int day = (int)(aTimer/86400);
    int hour = (int)(aTimer - day*86400)/3600;
    int minute = (int)(aTimer - day*86400 - hour* 3600)/60;
    int second = (int)(aTimer - day*86400 - hour*3600 - minute*60);
    NSString *dural = [NSString stringWithFormat:@"%d天%d时%d分%d秒",day,hour,minute,second];
    YMLog(@"dural:%@,%d",dural,(int)aTimer);
    if ((int)aTimer < 3600) {
        self.timelabel.text = [NSString stringWithFormat:@"%d分钟前",minute];
    }else if ( 3600 <= (int)aTimer && (int)aTimer < 86400) {
        self.timelabel.text = [NSString stringWithFormat:@"%d小时前",hour];
    }else if (86400 <= (int)aTimer && (int)aTimer < 31536000) {
        self.timelabel.text = [NSString stringWithFormat:@"%d天前",day];
    }else if (31536000 <= (int)aTimer){
        self.timelabel.text = [NSString stringWithFormat:@"n年前"];
    }else {
        self.timelabel.text = @"long long ago";
    }
    self.myName.text = share.topicUserName;
}

- (void)setIconImage:(UIImageView *)iconImage
{
    _iconImage = iconImage;
    iconImage.layer.cornerRadius = 30.0;
    iconImage.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
