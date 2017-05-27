//
//  QrcodeModel.m
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "QrcodeModel.h"
#import "QrcodeData.h"


NSString *const kQrcodeModelErrCode = @"errCode";
NSString *const kQrcodeModelErrMsg = @"errMsg";
NSString *const kQrcodeModelData = @"data";


@interface QrcodeModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QrcodeModel

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
            self.errCode = [[self objectOrNilForKey:kQrcodeModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kQrcodeModelErrMsg fromDictionary:dict];
            self.data = [QrcodeData modelObjectWithDictionary:[dict objectForKey:kQrcodeModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kQrcodeModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kQrcodeModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kQrcodeModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kQrcodeModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kQrcodeModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kQrcodeModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kQrcodeModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kQrcodeModelErrMsg];
    [aCoder encodeObject:_data forKey:kQrcodeModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    QrcodeModel *copy = [[QrcodeModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
