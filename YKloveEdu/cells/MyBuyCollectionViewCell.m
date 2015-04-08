//
//  MyBuyCollectionViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/4/1.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "MyBuyCollectionViewCell.h"

@interface MyBuyCollectionViewCell ()

@end

@implementation MyBuyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"MyBuyCollectionViewCell" owner:self options:nil] lastObject];
    return self;
}

@end
