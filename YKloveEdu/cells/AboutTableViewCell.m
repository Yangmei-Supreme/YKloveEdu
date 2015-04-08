//
//  AboutTableViewCell.m
//  YKloveEdu
//
//  Created by Golven on 15/3/23.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "AboutTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SaleModel.h"

@interface AboutTableViewCell()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation AboutTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setDict:(NSDictionary *)dict
{
    _dict = dict;
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(14, 14, 128, 72)];
    [iconImage sd_setImageWithURL:[NSURL URLWithString:dict[@"courseImageUrl"]]];
    [self.contentView addSubview:iconImage];
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 18, self.frame.size.width, 21)];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
    }
    _titleLabel.text = dict[@"title"];
    
    UILabel *keyLabel = [[UILabel alloc]initWithFrame:CGRectMake(155, 61, kScreenWidth, 21)];
    keyLabel.font = [UIFont systemFontOfSize:14];
    keyLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:keyLabel];
    keyLabel.text = dict[@"coursekeywork"];
}

@end
