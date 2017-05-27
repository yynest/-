//
//  HistoryData.m
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryData.h"
#import "HistoryBsDates.h"
#import "HistoryUserBSStatistics.h"


NSString *const kHistoryDataBsDates = @"bsDates";
NSString *const kHistoryDataUserBSStatistics = @"userBSStatistics";


@interface HistoryData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryData

@synthesize bsDates = _bsDates;
@synthesize userBSStatistics = _userBSStatistics;


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
    NSObject *receivedHistoryBsDates = [dict objectForKey:kHistoryDataBsDates];
    NSMutableArray *parsedHistoryBsDates = [NSMutableArray array];
    if ([receivedHistoryBsDates isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHistoryBsDates) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHistoryBsDates addObject:[HistoryBsDates modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHistoryBsDates isKindOfClass:[NSDictionary class]]) {
       [parsedHistoryBsDates addObject:[HistoryBsDates modelObjectWithDictionary:(NSDictionary *)receivedHistoryBsDates]];
    }

    self.bsDates = [NSArray arrayWithArray:parsedHistoryBsDates];
            self.userBSStatistics = [HistoryUserBSStatistics modelObjectWithDictionary:[dict objectForKey:kHistoryDataUserBSStatistics]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBsDates = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bsDates) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBsDates addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBsDates addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBsDates] forKey:kHistoryDataBsDates];
    [mutableDict setValue:[self.userBSStatistics dictionaryRepresentation] forKey:kHistoryDataUserBSStatistics];

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

    self.bsDates = [aDecoder decodeObjectForKey:kHistoryDataBsDates];
    self.userBSStatistics = [aDecoder decodeObjectForKey:kHistoryDataUserBSStatistics];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bsDates forKey:kHistoryDataBsDates];
    [aCoder encodeObject:_userBSStatistics forKey:kHistoryDataUserBSStatistics];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryData *copy = [[HistoryData alloc] init];
    
    if (copy) {

        copy.bsDates = [self.bsDates copyWithZone:zone];
        copy.userBSStatistics = [self.userBSStatistics copyWithZone:zone];
    }
    
    return copy;
}


@end
