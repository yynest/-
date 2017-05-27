//
//  QSNetworkPrivate.h
//  QianShanJY
//
//  Created by Jim on 15/9/11.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSBaseRequest.h"

@interface QSNetworkPrivate : NSObject

+ (BOOL)checkJSON:(id)json withValidator:(id)validatorJSON;

+ (NSString *)urlStringWithOriginURLString:(NSString *)originURLString
                          appendParameters:(NSDictionary *)parameters;


@end
