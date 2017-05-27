//
//  BaseNetworkResponseModel.m
//  QianShanJY
//
//  Created by Jim on 15/10/15.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import "BaseNetworkResponseModel.h"

@implementation BaseNetworkResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"errCode":@"errCode",
             @"errMsg":@"errMsg",
             };
}


@end
