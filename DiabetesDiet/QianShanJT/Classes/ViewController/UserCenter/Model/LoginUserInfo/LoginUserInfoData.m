//
//  LoginUserInfoData.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginUserInfoData.h"
#import "LoginUserInfoUser.h"
#import "LoginUserInfoTokenMsg.h"


NSString *const kLoginUserInfoDataUser = @"user";
NSString *const kLoginUserInfoDataTokenMsg = @"tokenMsg";


@interface LoginUserInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginUserInfoData

@synthesize user = _user;
@synthesize tokenMsg = _tokenMsg;


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
            self.user = [LoginUserInfoUser modelObjectWithDictionary:[dict objectForKey:kLoginUserInfoDataUser]];
            self.tokenMsg = [LoginUserInfoTokenMsg modelObjectWithDictionary:[dict objectForKey:kLoginUserInfoDataTokenMsg]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kLoginUserInfoDataUser];
    [mutableDict setValue:[self.tokenMsg dictionaryRepresentation] forKey:kLoginUserInfoDataTokenMsg];

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

    self.user = [aDecoder decodeObjectForKey:kLoginUserInfoDataUser];
    self.tokenMsg = [aDecoder decodeObjectForKey:kLoginUserInfoDataTokenMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_user forKey:kLoginUserInfoDataUser];
    [aCoder encodeObject:_tokenMsg forKey:kLoginUserInfoDataTokenMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginUserInfoData *copy = [[LoginUserInfoData alloc] init];
    
    if (copy) {

        copy.user = [self.user copyWithZone:zone];
        copy.tokenMsg = [self.tokenMsg copyWithZone:zone];
    }
    
    return copy;
}


@end
