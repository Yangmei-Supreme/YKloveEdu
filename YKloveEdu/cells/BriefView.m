//
//  BriefView.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/20.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "BriefView.h"

@interface BriefView()
@property (weak, nonatomic) IBOutlet UILabel *publish;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UITextView *briefTextView;
@end

@implementation BriefView

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.bounces = YES;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor =[UIColor whiteColor];
        
        self = [[NSBundle mainBundle]loadNibNamed:@"BriefView" owner:self options:nil][0];
        
    }
    return self;
}

- (void) setDataDict:(NSDictionary *)dataDict
{
    if (!dataDict) {
        return;
    }
    _dataDict = dataDict;
    self.titleLabel.text = _dataDict[@"title"];
    self.ageLabel.text = [NSString stringWithFormat:@"适用年龄：%ld岁",[_dataDict[@"age"] longValue]];
    self.publish.text = _dataDict[@"publishers"];
    self.briefTextView.text = _dataDict[@"description"];
}

@end
