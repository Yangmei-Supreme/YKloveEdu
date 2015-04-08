//
//  MJNewsCell.m
//  预习-03-无限滚动
//
//  Created by MJ Lee on 14-5-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJNewsCell.h"
#import "MJNews.h"
#import "UIImageView+WebCache.h"
#import "SaleModel.h"

@interface MJNewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation MJNewsCell


- (void)setNews:(MJNews *)news
{
    _news = news;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:news.advUrl]];

}

- (IBAction)btnClick:(id)sender {
    SaleModel * model = [[SaleModel alloc] init];
    model.sid = _news.sid;
    model.iconUrl = _news.iconUrl;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"advCellClick" object:nil userInfo:@{@"model":model}];
}

@end
