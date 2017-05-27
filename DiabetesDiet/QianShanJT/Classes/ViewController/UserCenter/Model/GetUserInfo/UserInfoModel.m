//
//  UserInfoModel.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserInfoModel.h"
#import "UserInfoData.h"


NSString *const kUserInfoModelErrCode = @"errCode";
NSString *const kUserInfoModelErrMsg = @"errMsg";
NSString *const kUserInfoModelData = @"data";


@interface UserInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoModel

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
            self.errCode = [[self objectOrNilForKey:kUserInfoModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kUserInfoModelErrMsg fromDictionary:dict];
            self.data = [UserInfoData modelObjectWithDictionary:[dict objectForKey:kUserInfoModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kUserInfoModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kUserInfoModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kUserInfoModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kUserInfoModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kUserInfoModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kUserInfoModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kUserInfoModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kUserInfoModelErrMsg];
    [aCoder encodeObject:_data forKey:kUserInfoModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoModel *copy = [[UserInfoModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
