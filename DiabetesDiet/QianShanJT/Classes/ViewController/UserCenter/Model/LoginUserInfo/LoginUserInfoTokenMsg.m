//
//  LoginUserInfoTokenMsg.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginUserInfoTokenMsg.h"


NSString *const kLoginUserInfoTokenMsgRefreshToken = @"refresh_token";
NSString *const kLoginUserInfoTokenMsgTokenType = @"token_type";
NSString *const kLoginUserInfoTokenMsgAccessToken = @"access_token";
NSString *const kLoginUserInfoTokenMsgExpiresIn = @"expires_in";


@interface LoginUserInfoTokenMsg ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginUserInfoTokenMsg

@synthesize refreshToken = _refreshToken;
@synthesize tokenType = _tokenType;
@synthesize accessToken = _accessToken;
@synthesize expiresIn = _expiresIn;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.refreshToken = [self objectOrNilForKey:kLoginUserInfoTokenMsgRefreshToken fromDictionary:dict];
            self.tokenType = [self objectOrNilForKey:kLoginUserInfoTokenMsgTokenType fromDictionary:dict];
            self.accessToken = [self objectOrNilForKey:kLoginUserInfoTokenMsgAccessToken fromDictionary:dict];
            self.expiresIn = [[self objectOrNilForKey:kLoginUserInfoTokenMsgExpiresIn fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.refreshToken forKey:kLoginUserInfoTokenMsgRefreshToken];
    [mutableDict setValue:self.tokenType forKey:kLoginUserInfoTokenMsgTokenType];
    [mutableDict setValue:self.accessToken forKey:kLoginUserInfoTokenMsgAccessToken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expiresIn] forKey:kLoginUserInfoTokenMsgExpiresIn];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.refreshToken = [aDecoder decodeObjectForKey:kLoginUserInfoTokenMsgRefreshToken];
    self.tokenType = [aDecoder decodeObjectForKey:kLoginUserInfoTokenMsgTokenType];
    self.accessToken = [aDecoder decodeObjectForKey:kLoginUserInfoTokenMsgAccessToken];
    self.expiresIn = [aDecoder decodeDoubleForKey:kLoginUserInfoTokenMsgExpiresIn];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_refreshToken forKey:kLoginUserInfoTokenMsgRefreshToken];
    [aCoder encodeObject:_tokenType forKey:kLoginUserInfoTokenMsgTokenType];
    [aCoder encodeObject:_accessToken forKey:kLoginUserInfoTokenMsgAccessToken];
    [aCoder encodeDouble:_expiresIn forKey:kLoginUserInfoTokenMsgExpiresIn];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginUserInfoTokenMsg *copy = [[LoginUserInfoTokenMsg alloc] init];
    
    if (copy) {

        copy.refreshToken = [self.refreshToken copyWithZone:zone];
        copy.tokenType = [self.tokenType copyWithZone:zone];
        copy.accessToken = [self.accessToken copyWithZone:zone];
        copy.expiresIn = self.expiresIn;
    }
    
    return copy;
}


@end
