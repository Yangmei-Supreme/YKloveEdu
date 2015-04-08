//
//  Study0ViewCell.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/27.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "Study0ViewCell.h"

@implementation Study0ViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"Study0ViewCell" owner:self options:nil] lastObject];
    return self;
}

@end
