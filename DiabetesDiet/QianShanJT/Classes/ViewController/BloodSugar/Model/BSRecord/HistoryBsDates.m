//
//  HistoryBsDates.m
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryBsDates.h"
#import "HistoryRecords.h"


NSString *const kHistoryBsDatesDateTime = @"dateTime";
NSString *const kHistoryBsDatesRecords = @"records";


@interface HistoryBsDates ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryBsDates

@synthesize dateTime = _dateTime;
@synthesize records = _records;


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
            self.dateTime = [self objectOrNilForKey:kHistoryBsDatesDateTime fromDictionary:dict];
    NSObject *receivedHistoryRecords = [dict objectForKey:kHistoryBsDatesRecords];
    NSMutableArray *parsedHistoryRecords = [NSMutableArray array];
    if ([receivedHistoryRecords isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHistoryRecords) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHistoryRecords addObject:[HistoryRecords modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHistoryRecords isKindOfClass:[NSDictionary class]]) {
       [parsedHistoryRecords addObject:[HistoryRecords modelObjectWithDictionary:(NSDictionary *)receivedHistoryRecords]];
    }

    self.records = [NSArray arrayWithArray:parsedHistoryRecords];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dateTime forKey:kHistoryBsDatesDateTime];
    NSMutableArray *tempArrayForRecords = [NSMutableArray array];
    for (NSObject *subArrayObject in self.records) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecords addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecords addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecords] forKey:kHistoryBsDatesRecords];

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

    self.dateTime = [aDecoder decodeObjectForKey:kHistoryBsDatesDateTime];
    self.records = [aDecoder decodeObjectForKey:kHistoryBsDatesRecords];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dateTime forKey:kHistoryBsDatesDateTime];
    [aCoder encodeObject:_records forKey:kHistoryBsDatesRecords];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryBsDates *copy = [[HistoryBsDates alloc] init];
    
    if (copy) {

        copy.dateTime = [self.dateTime copyWithZone:zone];
        copy.records = [self.records copyWithZone:zone];
    }
    
    return copy;
}


@end
