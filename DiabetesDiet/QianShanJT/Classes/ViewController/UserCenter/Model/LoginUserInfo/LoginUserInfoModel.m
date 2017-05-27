//
//  LoginUserInfoModel.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginUserInfoModel.h"
#import "LoginUserInfoData.h"


NSString *const kLoginUserInfoModelErrCode = @"errCode";
NSString *const kLoginUserInfoModelErrMsg = @"errMsg";
NSString *const kLoginUserInfoModelData = @"data";


@interface LoginUserInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginUserInfoModel

@synthesize errCode = _errCode;
@synthesize errMsg = _errMsg;
@synthesize data = _data;


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
            self.errCode = [[self objectOrNilForKey:kLoginUserInfoModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kLoginUserInfoModelErrMsg fromDictionary:dict];
            self.data = [LoginUserInfoData modelObjectWithDictionary:[dict objectForKey:kLoginUserInfoModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kLoginUserInfoModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kLoginUserInfoModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kLoginUserInfoModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kLoginUserInfoModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kLoginUserInfoModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kLoginUserInfoModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kLoginUserInfoModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kLoginUserInfoModelErrMsg];
    [aCoder encodeObject:_data forKey:kLoginUserInfoModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginUserInfoModel *copy = [[LoginUserInfoModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
