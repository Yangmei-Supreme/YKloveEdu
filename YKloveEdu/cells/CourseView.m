//
//  CourseView.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/20.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "CourseView.h"
#import "CourseTableViewCell.h"

@interface CourseView()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CourseView

- (void)awakeFromNib {
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[UIColor whiteColor];
        self = [[NSBundle mainBundle]loadNibNamed:@"CourseView" owner:self options:nil][0];
    }
    return self;
}

#pragma mark - data
- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    [_tableView reloadData];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataDict[@"studucourse"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.dataDict = _dataDict[@"studucourse"][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
