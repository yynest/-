//
//  QSNetworkAgent.h
//  QianShanJY
//
//  Created by Jim on 15/9/11.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSBaseRequest.h"

@interface QSNetworkAgent : NSObject

+ (instancetype)sharedInstance;

- (void)addRequest:(QSBaseRequest *)request;

- (void)cancelRequest:(QSBaseRequest *)request;

- (void)cancelAllRequests;

// 根据Request和NetworkConfig构建URL
- (NSString *)buildRequestURL:(QSBaseRequest *)request;

@end
