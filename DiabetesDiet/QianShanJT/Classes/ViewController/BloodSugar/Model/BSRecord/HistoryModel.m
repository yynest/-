//
//  HistoryModel.m
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryModel.h"
#import "HistoryData.h"


NSString *const kHistoryModelErrCode = @"errCode";
NSString *const kHistoryModelErrMsg = @"errMsg";
NSString *const kHistoryModelData = @"data";


@interface HistoryModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryModel

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
            self.errCode = [[self objectOrNilForKey:kHistoryModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kHistoryModelErrMsg fromDictionary:dict];
            self.data = [HistoryData modelObjectWithDictionary:[dict objectForKey:kHistoryModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kHistoryModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kHistoryModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHistoryModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kHistoryModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kHistoryModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kHistoryModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kHistoryModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kHistoryModelErrMsg];
    [aCoder encodeObject:_data forKey:kHistoryModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryModel *copy = [[HistoryModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
