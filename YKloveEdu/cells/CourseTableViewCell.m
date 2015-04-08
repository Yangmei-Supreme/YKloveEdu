//
//  CourseTableViewCell.m
//  YKloveEdu
//
//  Created by Golven on 15/3/23.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "CourseTableViewCell.h"

@interface CourseTableViewCell()
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation CourseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setDataDict:(NSDictionary *)dataDict
{

    _dataDict = dataDict;
    
    UIImageView *playImage = [[UIImageView alloc]initWithFrame:CGRectMake(8, 25, 6, 9)];
    playImage.image = [UIImage imageNamed:@"greenplay"];
    [self.contentView addSubview:playImage];
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width, 30)];
        //        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
    }
    _titleLabel.text = dataDict[@"title"];
    //ranking
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 100, 30)];
    numLabel.font = [UIFont systemFontOfSize:14];
    numLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:numLabel];
    numLabel.text = dataDict[@"ranking"];
}

@end
