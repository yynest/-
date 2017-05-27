//
//  LoginUserInfoData.h
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginUserInfoUser, LoginUserInfoTokenMsg;

@interface LoginUserInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) LoginUserInfoUser *user;
@property (nonatomic, strong) LoginUserInfoTokenMsg *tokenMsg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
