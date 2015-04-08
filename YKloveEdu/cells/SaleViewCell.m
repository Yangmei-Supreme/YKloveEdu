//
//  SaleViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/17.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "SaleViewCell.h"
#import "SaleModel.h"
#import "UIImageView+WebCache.h"

@interface SaleViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SaleViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"sale";
    SaleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"SaleViewCell" bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setSale:(SaleModel *)sale
{
    _sale = sale;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:sale.iconUrl]];
    self.nameLabel.text = sale.name;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
