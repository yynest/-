//
//  HomeIndexModel.m
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeIndexModel.h"
#import "HomeIndexData.h"


NSString *const kHomeIndexModelErrCode = @"errCode";
NSString *const kHomeIndexModelErrMsg = @"errMsg";
NSString *const kHomeIndexModelData = @"data";


@interface HomeIndexModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeIndexModel

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
            self.errCode = [[self objectOrNilForKey:kHomeIndexModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kHomeIndexModelErrMsg fromDictionary:dict];
            self.data = [HomeIndexData modelObjectWithDictionary:[dict objectForKey:kHomeIndexModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kHomeIndexModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kHomeIndexModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHomeIndexModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kHomeIndexModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kHomeIndexModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kHomeIndexModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kHomeIndexModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kHomeIndexModelErrMsg];
    [aCoder encodeObject:_data forKey:kHomeIndexModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeIndexModel *copy = [[HomeIndexModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
