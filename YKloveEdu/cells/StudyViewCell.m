//
//  StudyViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "StudyViewCell.h"
#import "StudyModel.h"
#import "UIImageView+WebCache.h"

@interface StudyViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *keyWordLabel;

@end

@implementation StudyViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"study";
    StudyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"StudyViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setStudy:(StudyModel *)study
{
    _study = study;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:study.courseImageUrl]];
    self.titlelabel.text = study.title;
    self.keyWordLabel.text = study.coursekeywork;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
