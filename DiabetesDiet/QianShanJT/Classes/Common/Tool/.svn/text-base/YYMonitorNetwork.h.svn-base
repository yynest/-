//
//  YYMonitorNetwork.h
//  QianShanJY
//
//  Created by iosdev on 16/5/3.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface YYMonitorNetwork : NSObject

@property(nonatomic,assign)BOOL isStatusConnect;//没有连接上：不通；连接上：可能不通。
@property(nonatomic,assign) NetworkStatus networkStatus;

+ (instancetype)sharedInstance;

- (void)monitorNetworkStateChange;

- (BOOL)getStatusConnect;

@end
