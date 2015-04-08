//
//  SendViewController.h
//  沃24
//
//  Created by Mac on 14-12-18.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendViewController;
@class CoolViewController;
@class DetailViewController;

@interface SendViewController : UIViewController

@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic, copy) NSString * filePath;
@property (nonatomic, weak) CoolViewController * cvc;
@property (nonatomic, weak) DetailViewController * dvc;
@property (nonatomic, copy) NSString * pvcSid;

- (void) resSetCellTitle:(NSString *)title;

@end
