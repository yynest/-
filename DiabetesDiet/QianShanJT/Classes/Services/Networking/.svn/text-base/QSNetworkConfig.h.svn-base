//
//  QSNetworkConfig.h
//  QianShanJY
//
//  Created by Jim on 15/9/10.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>



//       千山降压医生端所有请求地址 定义

//                      ------  内网环境  -------

#define DevelopmentBasePingUrl              @"192.168.1.114"
//内网数据服务器地址
#define DevelopmentBaseUrl                  @"http://192.168.1.114:8023"
//内网图片服务器地址
#define DevelopmentPictureBaseUrl           @"http://192.168.1.114:8084"



//                 ------   预发布环境  -------

#define PreProducteBasePingUrl              @"114.67.57.183"
//预发布环境数据服务器地址
#define PreProducteBaseUrl                  @"http://192.168.1.114:8023"
//预发布环境图片服务器地址
#define PreProductePictureBaseUrl           @"http://114.67.57.183:8082"



//                     ------  正式发布环境  -------

#define ProductionBasePingUrl               @"api.chinasunhealth.com"
//正式发布环境数据服务器地址
#define ProductionBaseUrl                   @"http://192.168.1.114:8023"
//正式发布环境图片服务器地址
#define ProductionPictureBaseUrl            @"http://image.chinasunhealth.com"
//百度语音下载地址
#define Production_BD_SPEECH_BASE_URL       @"http://image1.chinasunhealth.com/file/"



typedef NS_ENUM(NSInteger, QSNetworkEnvironment) {
    QSNetwork_Development    = 0,   //内网环境
    QSNetwork_PreProducte    = 1,   //外网、预发布环境
    QSNetwork_Production     = 2,   //正式发布环境
    
};

@interface QSNetworkConfig : NSObject

@property (strong, nonatomic) NSString *basePingURL;
@property (strong, nonatomic) NSString *baseURL;
@property (strong, nonatomic) NSString *basePictureURL;

@property (assign, nonatomic) QSNetworkEnvironment networkEnvironment;

+ (instancetype)sharedInstance;

- (void)InitNetWork;

- (void)setNetworkEnvironment:(QSNetworkEnvironment)environment;

- (NSString *)getPicBaseAddress;

- (NSString *)getBaseAddress;

@end
