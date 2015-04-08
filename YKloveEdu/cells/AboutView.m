//
//  AboutView.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/20.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "AboutView.h"
#import "AboutTableViewCell.h"
#import "SaleDitalController.h"

@interface AboutView() <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_dataArr;
    
    SaleDitalController *_saleDital;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation AboutView

- (void)awakeFromNib {
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self requestData];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[UIColor whiteColor];
        self = [[NSBundle mainBundle]loadNibNamed:@"AboutView" owner:self options:nil][0];

    }
    return self;
}

#pragma mark - requestData
- (void)requestData
{
    NSString *urlString1 = [NSString stringWithFormat:@"%@%@",kBaseURL_test,kStudy];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString1]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               YMLog(@"1");
                               if (connectionError) {
                                   YMLog(@"%@",connectionError);
                                   return ;
                               }
                               if (data) {
                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:nil];
                                   NSArray *list = dict[@"list"];
                                   if (list.count != 0) {
                                       _dataArr = list;
                                       [_tableView reloadData];
                                   }
                               }
                           }];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell2";
    AboutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[AboutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.dict = _dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushDetialController:_dataArr[indexPath.row]];
}

- (void) pushDetialController:(SaleModel *)model
{
    _saleDital = [[SaleDitalController alloc] init];
    _saleDital.model = model;
    [self.nav pushViewController:_saleDital animated:YES];
}


@end
