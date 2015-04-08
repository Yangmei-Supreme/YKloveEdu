//
//  Header.h
//  YKloveEdu
//
//  Created by yangmei on 15/3/12.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

/**屏幕宽度*/
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/**屏幕高度*/
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0

#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "registerManager.h"
#import "MainTabBarViewController.h"
#import "NavViewController.h"


#define kBaseURL_test @"http://video.yunkan.tv/ykajy/"
//主机url
#define kBaseUrl @"http://192.168.1.104:8080/ykajy/"
//特卖
#define kSale @"Recommend.htm"
//学习
#define kStudy @"Study.htm"
//详情
//#define kStudyDital @"Coursebody.htm?courseid=1"
//分享
#define kShare @"share.htm"
//学习筛选
#define kStudySift @"Studyfiltrate.htm"
//附近学习
#define kNearStudy @"nearby.htm"//后面拼接经纬度 longitude=1&latitude=2

/**详情简介*/
#define kDetaile_Abstract @"abstract.htm?studyid="
/**
 studyid: 暂写死为1
 */

/**详情简介，相关课程*/
#define kDetaile_Course @"StudyTime.htm?studyid="
/**
 studyid: 暂写死为1
 */


/**详情简介,价格图片等*/
#define kDetaile_StudyTime @"StudyCourse.htm?studyid="
/**
 studyid: 暂写死为1
 */
//相关课程和特卖统一接口

//我的帖子
#define kUserName @"Usercourse.htm"

//收到的赞
#define kZan @"Userpraise.htm"


//收到回复
#define kAnswer @"Usercomment.htm"

//系统消息
#define kMessage @"Systemmessagelist.htm"

//我的购买
#define kMyBuy @"Mybuy.htm"

//课程详情页面 http://192.168.0.128:8080/ottthreepoint/Coursebody.htm?courseid=1我写死了 只有 等于1的时候才能返回值
//http://192.168.0.128:8080/ottthreepoint/share.htm  分享页面
//http://192.168.0.128:8080/ottthreepoint/nearby.htm?longitude=1&&latitude=2后面参数是经纬度  为空的话返回空,附近的人的学习列表
//http://192.168.0.128:8080/ottthreepoint/postmessage.htm?userid=1 发帖
//http://192.168.0.128:8080/ottthreepoint/postsbody.htm?userid=1&&topicid=1帖子详情信息 id写死了 只能传1
//http://118.212.132.186/ykajy/Studyfiltrate.htm学习赛选，age参数

/*
 http://192.168.0.128:8080/ykajy/Topicpraise.htm?userid=1&topicid=1&praisereduce=1
 帖子点赞或踩接口
 http://192.168.0.128:8080/ykajy/Commentpraise.htm?userid=1&commentid=1&praisereduce=1
 评论点赞或踩
 http://192.168.0.128:8080/ykajy/Registerone.htm?registerphone=13612345678
 注册1接口  账号写死了 换其他的可以注册
 192.168.0.128:8080/ykajy/Registertwo.htm?registerphone=13612345678&&authcode=1111
 注册2接口  也写死了
 http://192.168.0.128:8080/ykajy/Registerthree.htm?userimg=1&username=2&usersigna=3
 注册3接口
 http://192.168.0.128:8080/ykajy/Login.htm?useraccount=simida&userpwd=111111
 登录接口  用户名密码写死了
 
 
 http://192.168.1.102:8080/ykajy/Userset.htm?userid=1&&userimg=1修改头像
 http://192.168.1.102:8080/ykajy/Updateusername.htm?userid=1&&username=1修改昵称
 http://192.168.1.102:8080/ykajy/UpdateUsersex.htm?userid=1&&usersex=1修改性别
 http://192.168.1.102:8080/ykajy/UpdateUserbirthday.htm?userid=1&&userbirthday=1修改生日
 http://192.168.1.102:8080/ykajy/UpdateUsersigna.htm?userid=1&&usersigna=1修改签名
 http://192.168.1.102:8080/ykajy/UpdateUserpwd.htm?userid=1&&useroldpwd=111111&&usernewpwd=000000  修改密码  旧密码写死了
 http://192.168.1.102:8080/ykajy/BoundUserphone.htm?userid=1&&userphone=13612345678绑定手机  手机号写死了
 http://192.168.1.102:8080/ykajy/Checkpwd.htm?userphone=13612345678&&authcode=1111   找回密码   输入验证码        两个参数都写死了
 192.168.1.102:8080/ykajy/Setpwd.htm?userphone=13612345678&&newpwd=111 设置新密码  手机号是死的
 http://192.168.1.102:8080/ykajy/Usercourse.htm?userid=1 我的帖子
 http://192.168.1.102:8080/ykajy/Userpraise.htm?userid=1我收到的赞
 http://192.168.1.102:8080/ykajy/Usercomment.htm?userid=1 我收到的回复
 http://192.168.1.102:8080/ykajy/Systemmessagelist.htm?userid=1系统消息列表
 http://192.168.1.102:8080/ykajy/systemmessage.htm?userid=1&&messageid=1系统消息正文
 http://192.168.1.102:8080/ykajy/Mybuy.htm?userid=1 我的购买
 http://192.168.1.102:8080/ykajy/Sort.htm?userid=1 用户积分排行
 http://192.168.1.102:8080/ykajy/CourseSales.htm?userid=1 课程销量排行
 
 http://192.168.1.104:8080/ykajy/CourseSales.htm?userid=1   课程销量排行
 
 http://192.168.1.104:8080/ykajy/abstract.htm?studyid=1       学习界面里的简介
 http://192.168.1.104:8080/ykajy/StudyCourse.htm?studyid=1 学习里面的相关课程
 http://192.168.1.104:8080/ykajy/StudyTime.htm?studyid=1 学习里面的学习课时
 
 
 http://192.168.1.104:8080/ykajy/Sortscreen.htm?screencondition=1&&userid=1销量页面筛选功能
 http://192.168.1.104:8080/ykajy/History.htm?userid=1  观看记录
 http://192.168.1.104:8080/ykajy/Studyreport.htm?userid=1 学习报告
 
 */

//http://192.168.0.128:8080/ykajy/postsbody.htm?userid=1&&topicid=1帖子详情,Topic_sectitle//帖子副标题    分享新添的返回参数



