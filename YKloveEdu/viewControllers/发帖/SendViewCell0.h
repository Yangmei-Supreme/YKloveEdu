//
//  SendViewCell0.h
//  沃24
//
//  Created by yangmei on 15/1/10.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMButton.h"

@interface SendViewCell0 : UITableViewCell
{
    BOOL _isRefresh;
}
//是否已经刷新

//content
@property (weak, nonatomic) IBOutlet UITextView *textView;
//images
@property (weak, nonatomic) IBOutlet YMButton *btn1;
@property (weak, nonatomic) IBOutlet YMButton *btn2;
@property (weak, nonatomic) IBOutlet YMButton *btn3;
@property (weak, nonatomic) IBOutlet YMButton *btn4;
@property (weak, nonatomic) IBOutlet YMButton *btn5;
@property (weak, nonatomic) IBOutlet YMButton *btn6;
@property (weak, nonatomic) IBOutlet YMButton *btn7;
@property (weak, nonatomic) IBOutlet YMButton *btn8;
@property (weak, nonatomic) IBOutlet YMButton *btn9;

@property (strong, nonatomic) NSMutableArray * imageArr;
@property (strong, nonatomic) NSMutableArray * imageArray;
@property (strong, nonatomic) NSArray * btnArr;
- (void) reload;
- (void) reloadData:(void (^) (NSString * nine))result;

@end
