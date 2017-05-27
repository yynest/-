//
//  HistoryTypeData.m
//
//  Created by iosdev  on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryTypeData.h"
#import "HistoryTypeLists.h"


NSString *const kHistoryTypeDataLists = @"lists";


@interface HistoryTypeData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryTypeData

@synthesize lists = _lists;


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
    NSObject *receivedHistoryTypeLists = [dict objectForKey:kHistoryTypeDataLists];
    NSMutableArray *parsedHistoryTypeLists = [NSMutableArray array];
    if ([receivedHistoryTypeLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHistoryTypeLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHistoryTypeLists addObject:[HistoryTypeLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHistoryTypeLists isKindOfClass:[NSDictionary class]]) {
       [parsedHistoryTypeLists addObject:[HistoryTypeLists modelObjectWithDictionary:(NSDictionary *)receivedHistoryTypeLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedHistoryTypeLists];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLists = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lists) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLists addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLists addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kHistoryTypeDataLists];

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

    self.lists = [aDecoder decodeObjectForKey:kHistoryTypeDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kHistoryTypeDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryTypeData *copy = [[HistoryTypeData alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end
