//
//  QSNetworkConfig.m
//  QianShanJY
//
//  Created by Jim on 15/9/10.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "QSNetworkConfig.h"



@implementation QSNetworkConfig

+ (instancetype)sharedInstance
{
    static QSNetworkConfig *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)InitNetWork
{
    
#ifdef DEBUG
    // Debug模式下内网、预发布环境可自由切换，推送均为测试模式
    
    NSNumber *netType = [UserDefaultsHelper getNetworkType];
    if (netType == nil || [netType integerValue] == 0) {
        // 1.没有设置网络则设置为开发环境
        // 2.内网开发环境
        [[QSNetworkConfig sharedInstance] setNetworkEnvironment:QSNetwork_Development];
        [UserDefaultsHelper setNetworkType:[NSNumber numberWithInteger:0]];
    }
    else if([netType integerValue] == 1){
        // 预发布环境
        [[QSNetworkConfig sharedInstance] setNetworkEnvironment:QSNetwork_PreProducte];
    }
    else if([netType integerValue] == 3){
        // 正式环境
        [[QSNetworkConfig sharedInstance] setNetworkEnvironment:QSNetwork_Production];
    }
#else
    // Release模式下下网络环境为生产环境，正式发布环境，网络切换隐藏
    
    [[QSNetworkConfig sharedInstance] setNetworkEnvironment:QSNetwork_Production];
#endif
    
}

- (void)setNetworkEnvironment:(QSNetworkEnvironment)environment
{
    _networkEnvironment = environment;
    
    if (_networkEnvironment == QSNetwork_Development){
        
        self.basePingURL = DevelopmentBasePingUrl;
        self.baseURL = DevelopmentBaseUrl;
        self.basePictureURL = DevelopmentPictureBaseUrl;
        
    }else if(_networkEnvironment == QSNetwork_PreProducte){
        
        self.basePingURL = PreProducteBasePingUrl;
        self.baseURL = PreProducteBaseUrl;
        self.basePictureURL = PreProductePictureBaseUrl;
    }
    else {
        
        self.basePingURL = ProductionBasePingUrl;
        self.baseURL = ProductionBaseUrl;
        self.basePictureURL = ProductionPictureBaseUrl;
    }
}

- (NSString *)getPicBaseAddress
{
    return _basePictureURL;
}

- (NSString *)getBaseAddress{
    return _baseURL;
}

@end
