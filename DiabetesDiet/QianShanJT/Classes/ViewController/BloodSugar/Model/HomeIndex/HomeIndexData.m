//
//  HomeIndexData.m
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeIndexData.h"
#import "HomeIndexBsRecord.h"
#import "HomeIndexUser.h"
#import "HomeIndexBsStatistics.h"


NSString *const kHomeIndexDataBsRecord = @"bsRecord";
NSString *const kHomeIndexDataUser = @"user";
NSString *const kHomeIndexDataBsStatistics = @"bsStatistics";


@interface HomeIndexData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeIndexData

@synthesize bsRecord = _bsRecord;
@synthesize user = _user;
@synthesize bsStatistics = _bsStatistics;


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
            self.bsRecord = [HomeIndexBsRecord modelObjectWithDictionary:[dict objectForKey:kHomeIndexDataBsRecord]];
            self.user = [HomeIndexUser modelObjectWithDictionary:[dict objectForKey:kHomeIndexDataUser]];
            self.bsStatistics = [HomeIndexBsStatistics modelObjectWithDictionary:[dict objectForKey:kHomeIndexDataBsStatistics]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.bsRecord dictionaryRepresentation] forKey:kHomeIndexDataBsRecord];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kHomeIndexDataUser];
    [mutableDict setValue:[self.bsStatistics dictionaryRepresentation] forKey:kHomeIndexDataBsStatistics];

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

    self.bsRecord = [aDecoder decodeObjectForKey:kHomeIndexDataBsRecord];
    self.user = [aDecoder decodeObjectForKey:kHomeIndexDataUser];
    self.bsStatistics = [aDecoder decodeObjectForKey:kHomeIndexDataBsStatistics];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bsRecord forKey:kHomeIndexDataBsRecord];
    [aCoder encodeObject:_user forKey:kHomeIndexDataUser];
    [aCoder encodeObject:_bsStatistics forKey:kHomeIndexDataBsStatistics];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeIndexData *copy = [[HomeIndexData alloc] init];
    
    if (copy) {

        copy.bsRecord = [self.bsRecord copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.bsStatistics = [self.bsStatistics copyWithZone:zone];
    }
    
    return copy;
}


@end
