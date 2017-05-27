//
//  ShareListData.m
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShareListData.h"
#import "ShareListRecords.h"


NSString *const kShareListDataRecords = @"records";


@interface ShareListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShareListData

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
    NSObject *receivedShareListRecords = [dict objectForKey:kShareListDataRecords];
    NSMutableArray *parsedShareListRecords = [NSMutableArray array];
    if ([receivedShareListRecords isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedShareListRecords) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedShareListRecords addObject:[ShareListRecords modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedShareListRecords isKindOfClass:[NSDictionary class]]) {
       [parsedShareListRecords addObject:[ShareListRecords modelObjectWithDictionary:(NSDictionary *)receivedShareListRecords]];
    }

    self.records = [NSArray arrayWithArray:parsedShareListRecords];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecords] forKey:kShareListDataRecords];

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

    self.records = [aDecoder decodeObjectForKey:kShareListDataRecords];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_records forKey:kShareListDataRecords];
}

- (id)copyWithZone:(NSZone *)zone
{
    ShareListData *copy = [[ShareListData alloc] init];
    
    if (copy) {

        copy.records = [self.records copyWithZone:zone];
    }
    
    return copy;
}


@end
