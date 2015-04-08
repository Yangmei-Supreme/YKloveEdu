//
//  SendViewController.m
//  沃24
//
//  Created by Mac on 14-12-18.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "SendViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

#import "SendViewController.h"
#import "UzysAssetsPickerController.h"
#import "SendViewCell0.h"
#import "MainTabBarViewController.h"

@interface SendViewController () <UITextViewDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate, UzysAssetsPickerControllerDelegate,UIAlertViewDelegate>
{
    //输入框
    UITextView *textView;
    
    NSString * _position;
    
    MBProgressHUD * _hud;
    
    NSInteger cellHeight;
}
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation SendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self postBack];
    
    [self createTableView];
    
    cellHeight = 209;
    //注册通知 照片选择
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photoPicker) name:@"selectePhoto" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//dataarray懒加载
- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

#pragma mark - 创建tableView
- (void)createTableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_tableView];
    }
}

//返回按键
- (void)postBack
{
    UIButton * postbBack = [UIButton buttonWithType:UIButtonTypeCustom];
    postbBack.frame = CGRectMake(0, 0, 35, 20);
    [postbBack setTitle:@"返回" forState:UIControlStateNormal];
    [postbBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    postbBack.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [postbBack addTarget:self action:@selector(postBackClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:postbBack];
    
    
    //发送
    UIButton *send = [UIButton buttonWithType:UIButtonTypeCustom];
    send.frame = CGRectMake(0,0,40,30);
    [send setTitle:@"发表" forState:UIControlStateNormal];
    [send setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    send.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [send addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:send];
}

//返回
- (void)postBackClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendClick
{
    //不能在这里判断登录,应该前一个页面判断...算了,先写在这儿
    NSDictionary * dict = nil;
   
    registerManager * manager = [registerManager shareManager];
    if (manager.isLogin == YES)  {
        SendViewCell0 * cell0 = (SendViewCell0 *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        UITextView * text = (UITextView *)[cell0 viewWithTag:220];
        NSMutableArray * arr = cell0.imageArray;
        if (_position == nil) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"请选择所在位置" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            alert.tag = 1222;
            alert.delegate = self;
            [alert show];
            return;
        }
        if (text.text == nil) {
            text.text = @"";
        }
        if (arr.count == 0) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"请选择图片" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
        
        YMLog(@"发表textView.text = %@",text.text);
        dict = @{
                 @"merchantId":self.pvcSid,
                 @"uid":manager.uid,
                 @"imageSize":[NSString stringWithFormat:@"%ld",(unsigned long)arr.count],
                 @"content":text.text,
                 @"position":[NSString stringWithFormat:@"%@,%@",manager.longitude,manager.latitude]
                };
//        //发送上传请求
//        [self addPicWithDictionary:dict];
        
    }
}

#pragma mark - alertviewdelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1222) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            
        }
    }
}

#pragma mark - tableviewdelegate
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SendViewCell" owner:self options:nil] lastObject];
            
        }else {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SendViewCell0" owner:self options:nil] lastObject];
                        
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return cellHeight;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        
    }
}

- (void) resSetCellTitle:(NSString *)title
{
    NSIndexPath * indexPatht = [NSIndexPath indexPathForRow:1 inSection:0];
    UITableViewCell * cell = [_tableView cellForRowAtIndexPath:indexPatht];
    UILabel *label = (UILabel *)[cell viewWithTag:110];
    label.text = title;
    _position = title;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//#pragma mark - POST上传
////ASIFormDataRequest方式 POST上传图片
//- (void) addPicWithDictionary:(NSDictionary *)sugestDic
//{
//    //测试
////    NSURL * URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.101:8081/liveplat_server/addDiary.htm"]];
//    
//    NSURL * URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseURL,kCool]];
//    ASIFormDataRequest * form = [ASIFormDataRequest requestWithURL:URL];
//    form = [[ASIFormDataRequest alloc] initWithURL:URL];
//    //超时时间
//    [form setTimeOutSeconds: 2 * 60.0];
//    form.delegate = self;
//    NSError *error = [form error];//error 超时处理是返回为空的为什么
//    if (error){
//        NSLog(@"%@",error);
//        NSException * tException=[NSException exceptionWithName:@"网络连接失败" reason:[error domain] userInfo:[error userInfo]];
//        @throw tException;
//    }
//    
//    [form setNumberOfTimesToRetryOnTimeout:2];
//
//    //声明myRequestData，用来放入http body
//    NSMutableData *myRequestData = [NSMutableData data];
//    
//    //分界线的标识符
//    NSString *TWITTERFON_FORM_BOUNDARY = @"------WebKitFormBoundaryC1vh0xo9rsWXbhDS";
//    //分界线 --AaB03x
//    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
//    //结束符 AaB03x--
//    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
//    
//    //http body的字符串
//    NSMutableData *body=[[NSMutableData alloc]init];
//    //参数的集合的所有key的集合
//    NSArray *keys= [sugestDic allKeys];
//    //遍历keys
//    for(int i=0;i<[keys count];i++){
//        //得到当前key
//        NSString *key=[keys objectAtIndex:i];
//        //如果key不是pic，说明value是字符类型，比如name：Boris
//        if(![key isEqualToString:@"files"]){
//            //添加分界线，换行
//            [body appendData:[[NSString stringWithFormat:@"%@\r\n",MPboundary] dataUsingEncoding:NSUTF8StringEncoding]];
//            //添加字段名称，换2行
//            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key] dataUsingEncoding:NSUTF8StringEncoding]];
//            //添加字段的值
//            [body appendData:[[NSString stringWithFormat:@"%@\r\n",[sugestDic objectForKey:key]] dataUsingEncoding:NSUTF8StringEncoding]];
//        }
//    }
//    
//    //在这里添加图片
//    SendViewCell0 * cell0 = (SendViewCell0 *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//    NSArray * imageArray = cell0.imageArray;
//    NSLog(@">>>>>>%ld",(unsigned long)imageArray.count);
//    for (int i = 0; i < imageArray.count; i++) {
//        UIImage * image = imageArray[i];
//        if (image) {
//            //添加分界线，换行
//            [body appendData:[[NSString stringWithFormat:@"%@\r\n",MPboundary] dataUsingEncoding:NSUTF8StringEncoding]];
//            //声明pic字段，文件名为image.jpg
//            NSString * disposition = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image%d\"; filename=\"image%d.jpg\"\r\n",i + 1,i + 1];
//            NSLog(@"%@",disposition);
//            [body appendData:[disposition dataUsingEncoding:NSUTF8StringEncoding]];
//            //声明上传文件的格式
//            [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//            [body appendData:UIImageJPEGRepresentation(image,0.01f)];
//            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        }
//    }
//    //声明结束符
//    NSString *end = [[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
//    //拼接body
//    [myRequestData appendData:body];
//    //加入结束符
//    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
//    //设置HTTPHeader中Content-Type的值
//    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
//    //相关设置
//    [form addRequestHeader:@"Content-Type" value:content];
//    [form addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%ld", (unsigned long)[myRequestData length]]];
//    [form setRequestMethod:@"POST"];
//    [form appendPostData:myRequestData];
//    //发送上传请求
//    [form startAsynchronous];
//    //成功或者失败之后的回调方法
//    [form setDidFailSelector:@selector(requestBeFailed:)];
//    [form setDidFinishSelector:@selector(requestBeFinished:)];
//    
//}
//
//- (void)requestBeFailed:(ASIHTTPRequest *)request
//{
//    NSLog(@"失败...");
//    [self hideHUD];
//    //显示tabbar
//    MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
//    [tabBar showTabBar];
//}
//
//- (void)requestBeFinished:(ASIHTTPRequest *)request{
//    NSLog(@"完成...");
//    NSLog(@"%@",request);
//    [self hideHUD];
//    
//    if (_cvc) {
//        //显示tabbar
//        MainTabBarViewController * tabBar = (MainTabBarViewController *)self.tabBarController;
//        [tabBar showTabBar];
//        [_cvc reload];
//    }
//    if (_dvc) {
//        [_dvc reload];
//    }
//    
//    [self.navigationController popViewControllerAnimated:YES];
//}
//

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - 选择照片
- (void) photoPicker
{
    UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
    
    picker.delegate = self;
    picker.maximumNumberOfSelectionPhoto = 9;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)UzysAssetsPickerController:(UzysAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    NSLog(@"assets %@",assets);
    NSMutableArray * imageArr = [NSMutableArray array];
    for (ALAsset * sset in assets) {
        if([[sset valueForProperty:@"ALAssetPropertyType"] isEqualToString:@"ALAssetTypePhoto"]) {
            //Photo
            UIImage *img = [UIImage imageWithCGImage:sset.defaultRepresentation.fullResolutionImage
                                               scale:sset.defaultRepresentation.scale
                                         orientation:(UIImageOrientation)sset.defaultRepresentation.orientation];
            [imageArr addObject:img];
        }
    }

    SendViewCell0 * cell0 = (SendViewCell0 *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell0.imageArr = imageArr;
    [cell0 reloadData:^(NSString *nine) {
        cellHeight = 286;
        
    }];
}


@end
