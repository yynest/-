//
//  LoginUserInfoTokenMsg.h
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoginUserInfoTokenMsg : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *tokenType;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, assign) double expiresIn;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
