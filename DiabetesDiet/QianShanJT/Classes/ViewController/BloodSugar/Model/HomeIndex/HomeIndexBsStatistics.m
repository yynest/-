//
//  HomeIndexBsStatistics.m
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeIndexBsStatistics.h"


NSString *const kHomeIndexBsStatisticsStartTime = @"startTime";
NSString *const kHomeIndexBsStatisticsEndTime = @"endTime";
NSString *const kHomeIndexBsStatisticsLowCount = @"lowCount";
NSString *const kHomeIndexBsStatisticsNormalCount = @"normalCount";
NSString *const kHomeIndexBsStatisticsHeightCount = @"heightCount";


@interface HomeIndexBsStatistics ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeIndexBsStatistics

@synthesize startTime = _startTime;
@synthesize endTime = _endTime;
@synthesize lowCount = _lowCount;
@synthesize normalCount = _normalCount;
@synthesize heightCount = _heightCount;


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
            self.startTime = [[self objectOrNilForKey:kHomeIndexBsStatisticsStartTime fromDictionary:dict] doubleValue];
            self.endTime = [[self objectOrNilForKey:kHomeIndexBsStatisticsEndTime fromDictionary:dict] doubleValue];
            self.lowCount = [[self objectOrNilForKey:kHomeIndexBsStatisticsLowCount fromDictionary:dict] doubleValue];
            self.normalCount = [[self objectOrNilForKey:kHomeIndexBsStatisticsNormalCount fromDictionary:dict] doubleValue];
            self.heightCount = [[self objectOrNilForKey:kHomeIndexBsStatisticsHeightCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kHomeIndexBsStatisticsStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kHomeIndexBsStatisticsEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lowCount] forKey:kHomeIndexBsStatisticsLowCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalCount] forKey:kHomeIndexBsStatisticsNormalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heightCount] forKey:kHomeIndexBsStatisticsHeightCount];

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

    self.startTime = [aDecoder decodeDoubleForKey:kHomeIndexBsStatisticsStartTime];
    self.endTime = [aDecoder decodeDoubleForKey:kHomeIndexBsStatisticsEndTime];
    self.lowCount = [aDecoder decodeDoubleForKey:kHomeIndexBsStatisticsLowCount];
    self.normalCount = [aDecoder decodeDoubleForKey:kHomeIndexBsStatisticsNormalCount];
    self.heightCount = [aDecoder decodeDoubleForKey:kHomeIndexBsStatisticsHeightCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_startTime forKey:kHomeIndexBsStatisticsStartTime];
    [aCoder encodeDouble:_endTime forKey:kHomeIndexBsStatisticsEndTime];
    [aCoder encodeDouble:_lowCount forKey:kHomeIndexBsStatisticsLowCount];
    [aCoder encodeDouble:_normalCount forKey:kHomeIndexBsStatisticsNormalCount];
    [aCoder encodeDouble:_heightCount forKey:kHomeIndexBsStatisticsHeightCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeIndexBsStatistics *copy = [[HomeIndexBsStatistics alloc] init];
    
    if (copy) {

        copy.startTime = self.startTime;
        copy.endTime = self.endTime;
        copy.lowCount = self.lowCount;
        copy.normalCount = self.normalCount;
        copy.heightCount = self.heightCount;
    }
    
    return copy;
}


@end
