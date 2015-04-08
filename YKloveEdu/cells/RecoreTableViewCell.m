//
//  RecoreTableViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "RecoreTableViewCell.h"

@interface RecoreTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *perLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *playProgress;
- (IBAction)PlayBtnClick;

@end

@implementation RecoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)PlayBtnClick {
}
@end
