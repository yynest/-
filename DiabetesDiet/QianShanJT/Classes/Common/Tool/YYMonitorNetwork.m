//
//  YYMonitorNetwork.m
//  QianShanJY
//
//  Created by iosdev on 16/5/3.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import "YYMonitorNetwork.h"
#import "QSNetworkConfig.h"
#import "Reachability.h"
#import "SVProgressHUD.h"


@interface YYMonitorNetwork (){
    NSString *serverIP;
    Reachability *reachability;
    
}

@end

@implementation YYMonitorNetwork

+ (instancetype)sharedInstance {
    static YYMonitorNetwork *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        serverIP = [QSNetworkConfig sharedInstance].basePingURL;
    }
    return self;
}

- (void)setIsStatusConnect:(BOOL)isStatusConnect {
    if (_isStatusConnect != isStatusConnect) {
        _isStatusConnect = isStatusConnect;
        if (_isStatusConnect) {
            
        }
        else {
            [SVProgressHUD showInfoWithStatus:QSText(@"网络连接不可用，请检查网络设置")];
        }
        //发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"monitorNetworkStateChange" object:nil];
    }
}

- (BOOL)getStatusConnect {
    NetworkStatus status = [reachability currentReachabilityStatus];
    return (status != NotReachable);
}

- (void)monitorNetworkStateChange {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    NSString *remoteHostName = serverIP;
    reachability = [Reachability reachabilityWithHostName:remoteHostName];
    _networkStatus = [reachability currentReachabilityStatus];
    if (_networkStatus == NotReachable) {
        [SVProgressHUD showInfoWithStatus:QSText(@"网络连接不可用，请检查网络设置")];
        self.isStatusConnect = NO;
    }
    else if (_networkStatus == ReachableViaWiFi || _networkStatus == ReachableViaWWAN) {
        self.isStatusConnect = YES;
    }
    [reachability startNotifier];
}

- (void) reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    _networkStatus = [curReach currentReachabilityStatus];
    if (_networkStatus == NotReachable) {
        [SVProgressHUD showInfoWithStatus:QSText(@"网络连接不可用，请检查网络设置")];
        self.isStatusConnect = NO;
    }
    else if (_networkStatus == ReachableViaWiFi || _networkStatus == ReachableViaWWAN) {
        self.isStatusConnect = YES;
    }
}

@end
