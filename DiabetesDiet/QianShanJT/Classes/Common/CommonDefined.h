//
//  Common.h
//  QianShan
//
//  Created by iosdev on 2016/10/19.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#ifndef CommonDefined_h
#define CommonDefined_h


typedef NS_ENUM(NSUInteger, CommunityType) {
    CommunityType_Topic = 1,             // 话题
    CommunityType_Question,              // 问答
    CommunityType_Lecture,               // 讲座
};

//医生端模板类型
//模板类型：0 主诉，1 现病史，2 诊断说明，3 营养建议，4 运动建议，5 温馨提示，6 快速回复，7 知识库                                                                                                                                                                                                                                                                                                                                                                                                              
typedef NS_ENUM(NSUInteger, templeType) {
    
    TempleType_main = 1,              // 主诉
    TempleType_history,               // 现病史
    TempleType_introduce,             // 诊断说明
    TempleType_advice,                // 营养建议
    TempleType_sport,                 // 运动建议
    TempleType_tips,                  // 温馨提示
    TempleType_quick,                 // 快速回复
    TempleType_know,                  // 知识库
};



typedef  NS_ENUM(NSInteger,ChartViewDisplayPlace){
    ChartView_MainPage,         // 图表显示在主页
    ChartView_BloodPressure,    // 图表为血压值图表
    ChartView_HeartRate,        // 图表显示在详情页，且为心率值图表
    ChattView_Trend,            // 血压趋势
};


typedef NS_ENUM(NSInteger, BPDetail_DisplayType) {
    DisplayByLastest = 0,
    DisplayByDay,
    DisplayByWeek,
    DisplayByMonth,
    DisplayByCustom,
    DisplayByDy24Dynamic,
};

//十六进制颜色数值转换为UIColor
#define RGBACOLOR_HEX(rgbValue, alphaValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]


#define DEFAULT_IMAGE [UIImage imageNamed:@"default_image"]

// ----------相关通知宏定义------------

//通知：修改用户信息
#define Notifi_User_Info_Change @"Notifi_User_Info_Change"
//通知:第三方登录回调
#define Notifi_Third_Login      @"Notifi_Third_Login"
//通知:wechat第三方登录回调
#define Notifi_Wechat_Login     @"userWechatLoginSuccessNoti"

//-----------相关通用宏定义-------------

//app 内网外网环境宏定义
#define Common_NetSetting @"Common_NetSetting"


//服务电话

#define SERVER_PHONE  @"tel://0731-81876707"

//图文问诊 高血压问题为 1
#define HIGH_QUESTIONS  @"1"

//获取屏幕  宽度  高度   frame
#define MAIN_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define MAIN_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define MAIN_SCREEN_FRAME  ([[UIScreen mainScreen].bounds])


//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)





#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_MAX_LENGTH (MAX(MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5S (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)




// ----------相关通知宏定义------------

//通知：修改用户信息
#define Notifi_User_Info_Change @"Notifi_User_Info_Change"
//通知:第三方登录回调
#define Notifi_Third_Login      @"Notifi_Third_Login"

//-----------相关通用宏定义-------------

//app 内网外网环境宏定义
#define Common_NetSetting @"Common_NetSetting"


//服务电话

#define SERVER_PHONE  @"tel://0731-81876707"

//图文问诊 高血压问题为 1
#define HIGH_QUESTIONS  @"1"

//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define CELL_CONTENT_FONT_SIZE [UIFont systemFontOfSize:16.f]


//xiangfeng,常用的宏定义
//默认图片，头像
#define IMAGE_DEFAULT       [UIImage imageNamed:@"default_image"]
#define IMAGE_HEAD_DEFAULT  [UIImage imageNamed:@"default_imageHead"]

#define NAV_ITEM_WIDTH  30
//边距
#define VIEW_SPACE_EDGE 19
#define VIEW_BOTTON_HEIGHT 50

//判断NSString 对象是否为空
#define _noNull(str) (str == nil || [str isEqualToString:@"(null)"]? @"":str)


#define SERVER_ERROR_TIP  @"服务器开了会小差"

#endif /* CommonDefined_h */


