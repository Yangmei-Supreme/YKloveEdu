//
//  DetailContentViewController.m
//  YKloveEdu
//
//  Created by Golven on 15/4/2.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "DetailContentViewController.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "GCalculateSize.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface DetailContentViewController ()
{
    MBProgressHUD * _hud;//不解释
    NSDictionary *_dataDict;//数据字典
    UILabel *_contentlabel;//正文文本label
}
@property (strong, nonatomic) IBOutlet UILabel *controllerTitle;//页面标题
@property (strong, nonatomic) IBOutlet UIImageView *headImage;//头像
@property (strong, nonatomic) IBOutlet UITextView *titleLabel;//内容标题
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;//作者以及发布时间
@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;//内容父容器
@end

@implementation DetailContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self showHUD];
    [self widgetInit];
    [self requestData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self hideHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  statusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 初始化
- (void) widgetInit
{
    //头像
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = 30;
}

#pragma mark - 返回
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - 分享
- (IBAction)share:(id)sender {
    
}

#pragma mark - 获取整体数据
- (void) requestData
{
    NSString * urlString = @"http://video.yunkan.tv/ykajy/postsbody.htm?userid=1&&topicid=1";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
       [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
           if (connectionError) {
               NSLog(@"connecntion error");
               [self hideHUD];
               return ;
           }
           if (data) {
               NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               _dataDict = dict;
               [self calculate:_dataDict];
               
           }
       }];
}

#pragma mark - 计算高度
- (void)calculate:(NSDictionary *)dict
{
    //计算
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //文本内容size
        CGSize textSize = [GCalculateSize calculateTextSize:[NSString stringWithFormat:@"        %@",dict[@"topicContent"]]
                                                       font:[UIFont fontWithName:@"HelveticaNeue"
                                                       size:14.0f]
                                               contentWidth:kScreenWidth];
        //图片类容size
        CGSize imagesSize = [GCalculateSize calculateTotallyHeight:dict[@"topicImg"]];
        //总大小
        CGSize totalSize = {textSize.width+imagesSize.width, textSize.height+imagesSize.height};
        
        //主线程修改UI
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            [self configuration:totalSize textSize:textSize imageSize:imagesSize];
        });
    });
    
    
}

#pragma mark - 修改UI内容
- (void) configuration:(CGSize)totalSize textSize:(CGSize)textSize imageSize:(CGSize)imageSize
{
    //基本控件设置
    _titleLabel.text = _dataDict[@"topicTitle"];  //内容标题
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [_headImage sd_setImageWithURL:[NSURL URLWithString:_dataDict[@"topicImages"]]]; //头像
    _authorLabel.text = [NSString stringWithFormat:@"%@发布于%@",_dataDict[@"topicUserName"],_dataDict[@"topicTime"]];//作者以及发布时间
    //scrollView设置
    _contentScrollView.contentSize = CGSizeMake(kScreenWidth, textSize.height);
    //文本部分
    if (_contentlabel) {
        _contentlabel = nil;
    }
    _contentlabel= [[UILabel alloc] init];
    _contentlabel.frame = CGRectMake(0, 0, kScreenWidth,textSize.height);
    _contentlabel.text = [NSString stringWithFormat:@"        %@",_dataDict[@"topicContent"]];
    _contentlabel.numberOfLines = 0;
    _contentlabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
    _contentlabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_contentScrollView addSubview:_contentlabel];
    
    
    
//------------------图片部分,待续...(先弄一张上去看看效果)------------------
    UIImageView *image = [[UIImageView alloc] init];
    image.frame = CGRectMake((kScreenWidth-imageSize.width) / 2, textSize.height + 10, imageSize.width, imageSize.height);
    image.backgroundColor = [UIColor lightGrayColor];
    [image sd_setImageWithURL:_dataDict[@"topicImg"]];
    [_contentScrollView addSubview:image];
    [self hideHUD];
}

#pragma mark - HUD
- (void) showHUD
{
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:_hud];
        _hud.labelText = @"玩命加载中...";
        _hud.mode = MBProgressHUDModeIndeterminate;
        _hud.labelFont = [UIFont boldSystemFontOfSize:14];
        _hud.color = [UIColor colorWithWhite:0.5 alpha:1];
        _hud.dimBackground = NO;
        _hud.minSize = CGSizeMake(30, 30);
        _hud.animationType = MBProgressHUDAnimationFade;
    }
    [_hud show:NO];
    
}

- (void) hideHUD
{
    [_hud hide:NO];
}

@end






















