//
//  HistoryTypeModel.m
//
//  Created by iosdev  on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryTypeModel.h"
#import "HistoryTypeData.h"


NSString *const kHistoryTypeModelErrCode = @"errCode";
NSString *const kHistoryTypeModelErrMsg = @"errMsg";
NSString *const kHistoryTypeModelData = @"data";


@interface HistoryTypeModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryTypeModel

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
            self.errCode = [[self objectOrNilForKey:kHistoryTypeModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kHistoryTypeModelErrMsg fromDictionary:dict];
            self.data = [HistoryTypeData modelObjectWithDictionary:[dict objectForKey:kHistoryTypeModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kHistoryTypeModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kHistoryTypeModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHistoryTypeModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kHistoryTypeModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kHistoryTypeModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kHistoryTypeModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kHistoryTypeModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kHistoryTypeModelErrMsg];
    [aCoder encodeObject:_data forKey:kHistoryTypeModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryTypeModel *copy = [[HistoryTypeModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
