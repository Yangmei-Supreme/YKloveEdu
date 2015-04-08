
//  SendViewCell0.m
//  沃24
//
//  Created by yangmei on 15/1/10.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "SendViewCell0.h"

@implementation SendViewCell0
{
    //水印文字
    UILabel *placeholderLabel;
//    UIScrollView * _scrollView;
    UIButton * _btn;
}

- (void)awakeFromNib
{
    _imageArray = [[NSMutableArray alloc] init];
    [_textView becomeFirstResponder];
    
    //注册通知 监听textView输入字符长度
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textExchange) name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (IBAction)btnClick:(id)sender
{
    YMButton * btn = (YMButton *)sender;
    NSLog(@"sender %ld",(long)btn.tag);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectePhoto" object:nil];

}

- (void)setImageArr:(NSMutableArray *)imageArr
{
    _imageArr = imageArr;
    for (UIImage * image in _imageArr) {
        if (_imageArray.count < 9) {
            [_imageArray addObject:image];
            
        }else {
            break;
            
        }
    }
}

- (void) reload
{
            _btnArr = @[
                         _btn1,
                         _btn2,
                         _btn3,
                         _btn4,
                         _btn5,
                         _btn6,
                         _btn7,
                         _btn8,
                         _btn9
                         ];
    
    for (int i = 0; i < _imageArray.count; i++) {
        NSLog(@"%d",i);
        if (i <= 9) {
            YMButton * btn = _btnArr[i];
            btn.enabled = NO;
            [btn setImage:_imageArray[i] forState:UIControlStateDisabled];
        }
    }
    
    if (_imageArray.count < 9) {
        YMButton * btn = _btnArr[_imageArray.count];
        btn.enabled = YES;
        [btn setImage:[UIImage imageNamed:@"addpic"] forState:UIControlStateNormal];
    }
}

- (void) reloadData:(void (^) (NSString * nine))result
{
    [self reload];
    NSLog(@"%ld",(unsigned long)_imageArray.count);
    if (_imageArray.count >= 8) {
        result(@"refresh");
    }
}

- (void)setTextView:(UITextView *)textView
{
    self.textView.returnKeyType = UIReturnKeySend;
    [self.textView becomeFirstResponder];
    placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(4, 0, textView.frame.size.width, 30)];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    placeholderLabel.text = @"内容";
    placeholderLabel.font = [UIFont systemFontOfSize:15];
    [textView addSubview:placeholderLabel];
    textView.showsVerticalScrollIndicator = NO;
    
}

- (void)textExchange
{
    placeholderLabel.hidden = YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.contentView endEditing:YES];
}

@end
