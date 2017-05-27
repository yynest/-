//
//  HistoryUserBSStatistics.m
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryUserBSStatistics.h"


NSString *const kHistoryUserBSStatisticsStartTime = @"startTime";
NSString *const kHistoryUserBSStatisticsEndTime = @"endTime";
NSString *const kHistoryUserBSStatisticsLowCount = @"lowCount";
NSString *const kHistoryUserBSStatisticsNormalCount = @"normalCount";
NSString *const kHistoryUserBSStatisticsHeightCount = @"heightCount";


@interface HistoryUserBSStatistics ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryUserBSStatistics

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
            self.startTime = [self objectOrNilForKey:kHistoryUserBSStatisticsStartTime fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kHistoryUserBSStatisticsEndTime fromDictionary:dict];
            self.lowCount = [[self objectOrNilForKey:kHistoryUserBSStatisticsLowCount fromDictionary:dict] doubleValue];
            self.normalCount = [[self objectOrNilForKey:kHistoryUserBSStatisticsNormalCount fromDictionary:dict] doubleValue];
            self.heightCount = [[self objectOrNilForKey:kHistoryUserBSStatisticsHeightCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.startTime forKey:kHistoryUserBSStatisticsStartTime];
    [mutableDict setValue:self.endTime forKey:kHistoryUserBSStatisticsEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lowCount] forKey:kHistoryUserBSStatisticsLowCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.normalCount] forKey:kHistoryUserBSStatisticsNormalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heightCount] forKey:kHistoryUserBSStatisticsHeightCount];

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

    self.startTime = [aDecoder decodeObjectForKey:kHistoryUserBSStatisticsStartTime];
    self.endTime = [aDecoder decodeObjectForKey:kHistoryUserBSStatisticsEndTime];
    self.lowCount = [aDecoder decodeDoubleForKey:kHistoryUserBSStatisticsLowCount];
    self.normalCount = [aDecoder decodeDoubleForKey:kHistoryUserBSStatisticsNormalCount];
    self.heightCount = [aDecoder decodeDoubleForKey:kHistoryUserBSStatisticsHeightCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_startTime forKey:kHistoryUserBSStatisticsStartTime];
    [aCoder encodeObject:_endTime forKey:kHistoryUserBSStatisticsEndTime];
    [aCoder encodeDouble:_lowCount forKey:kHistoryUserBSStatisticsLowCount];
    [aCoder encodeDouble:_normalCount forKey:kHistoryUserBSStatisticsNormalCount];
    [aCoder encodeDouble:_heightCount forKey:kHistoryUserBSStatisticsHeightCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryUserBSStatistics *copy = [[HistoryUserBSStatistics alloc] init];
    
    if (copy) {

        copy.startTime = [self.startTime copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.lowCount = self.lowCount;
        copy.normalCount = self.normalCount;
        copy.heightCount = self.heightCount;
    }
    
    return copy;
}


@end
