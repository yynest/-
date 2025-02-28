//
//  ShareListModel.m
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShareListModel.h"
#import "ShareListData.h"


NSString *const kShareListModelErrCode = @"errCode";
NSString *const kShareListModelErrMsg = @"errMsg";
NSString *const kShareListModelData = @"data";


@interface ShareListModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShareListModel

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
            self.errCode = [[self objectOrNilForKey:kShareListModelErrCode fromDictionary:dict] doubleValue];
            self.errMsg = [self objectOrNilForKey:kShareListModelErrMsg fromDictionary:dict];
            self.data = [ShareListData modelObjectWithDictionary:[dict objectForKey:kShareListModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errCode] forKey:kShareListModelErrCode];
    [mutableDict setValue:self.errMsg forKey:kShareListModelErrMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kShareListModelData];

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

    self.errCode = [aDecoder decodeDoubleForKey:kShareListModelErrCode];
    self.errMsg = [aDecoder decodeObjectForKey:kShareListModelErrMsg];
    self.data = [aDecoder decodeObjectForKey:kShareListModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_errCode forKey:kShareListModelErrCode];
    [aCoder encodeObject:_errMsg forKey:kShareListModelErrMsg];
    [aCoder encodeObject:_data forKey:kShareListModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ShareListModel *copy = [[ShareListModel alloc] init];
    
    if (copy) {

        copy.errCode = self.errCode;
        copy.errMsg = [self.errMsg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
