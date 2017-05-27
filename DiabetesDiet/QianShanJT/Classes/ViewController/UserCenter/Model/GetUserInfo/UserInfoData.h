//
//  UserInfoData.h
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoUser;

@interface UserInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) UserInfoUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
