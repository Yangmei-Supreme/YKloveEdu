//
//  NearViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/19.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "NearViewCell.h"
#import "nearModel.h"
#import "UIImageView+WebCache.h"

@interface NearViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseLbel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *juliLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation NearViewCell

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
    static NSString *ID = @"near";
    NearViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"NearViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setNear:(nearModel *)near
{
    _near = near;
    self.titleLabel.text = near.nearByTitle;
    self.courseLbel.text = near.nearByCourse;
    self.juliLabel.text = [NSString stringWithFormat:@"%ldm",(long)near.nearByJuli];
    self.nameLabel.text = near.nearByUserName;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:near.nearByUserImg]];
    
    
    
    //时间差
    NSDateFormatter *farmatter = [[NSDateFormatter alloc]init];
    [farmatter setDateFormat:@"YY/MM/dd HH:mm:ss"];
    NSDate *date1 = [farmatter dateFromString:near.nearByTime];
    NSDate *date2 = [NSDate date];
    NSTimeInterval aTimer = [date2 timeIntervalSinceDate:date1];
    int day = (int)(aTimer/86400);
    int hour = (int)(aTimer - day*86400)/3600;
    int minute = (int)(aTimer - day*86400 - hour* 3600)/60;
    int second = aTimer - day*86400 - hour*3600 - minute*60;
    NSString *dural = [NSString stringWithFormat:@"%d天%d时%d分%d秒",day,hour,minute,second];
    YMLog(@"dural2:%@,%d",dural,(int)aTimer);
    if ((int)aTimer < 3600) {
        self.timeLabel.text = [NSString stringWithFormat:@"%d分钟前",minute];
    }else if ( 3600 <= (int)aTimer && (int)aTimer < 86400) {
        self.timeLabel.text = [NSString stringWithFormat:@"%d小时前",hour];
    }else if (86400<= (int)aTimer && (int)aTimer < 31536000) {
        self.timeLabel.text = [NSString stringWithFormat:@"%d天前",day];
    }else if (31536000 <= (int)aTimer){
        self.timeLabel.text = [NSString stringWithFormat:@"n年前"];
    }else {
        self.timeLabel.text = @"long long ago";
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
