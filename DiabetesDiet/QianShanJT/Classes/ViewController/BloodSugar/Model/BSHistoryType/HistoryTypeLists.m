//
//  HistoryTypeLists.m
//
//  Created by iosdev  on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryTypeLists.h"


NSString *const kHistoryTypeListsId = @"id";
NSString *const kHistoryTypeListsTimeType = @"timeType";
NSString *const kHistoryTypeListsState = @"state";
NSString *const kHistoryTypeListsBsValue = @"bsValue";
NSString *const kHistoryTypeListsRecordType = @"recordType";
NSString *const kHistoryTypeListsUserId = @"userId";
NSString *const kHistoryTypeListsCreateTime = @"createTime";
NSString *const kHistoryTypeListsBsResult = @"bsResult";
NSString *const kHistoryTypeListsLat = @"lat";
NSString *const kHistoryTypeListsLng = @"lng";
NSString *const kHistoryTypeListsRecordTime = @"recordTime";
NSString *const kHistoryTypeListsBsResultRemark = @"bsResultRemark";


@interface HistoryTypeLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryTypeLists

@synthesize listsIdentifier = _listsIdentifier;
@synthesize timeType = _timeType;
@synthesize state = _state;
@synthesize bsValue = _bsValue;
@synthesize recordType = _recordType;
@synthesize userId = _userId;
@synthesize createTime = _createTime;
@synthesize bsResult = _bsResult;
@synthesize lat = _lat;
@synthesize lng = _lng;
@synthesize recordTime = _recordTime;
@synthesize bsResultRemark = _bsResultRemark;


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
            self.listsIdentifier = [[self objectOrNilForKey:kHistoryTypeListsId fromDictionary:dict] doubleValue];
            self.timeType = [self objectOrNilForKey:kHistoryTypeListsTimeType fromDictionary:dict];
            self.state = [[self objectOrNilForKey:kHistoryTypeListsState fromDictionary:dict] doubleValue];
            self.bsValue = [[self objectOrNilForKey:kHistoryTypeListsBsValue fromDictionary:dict] doubleValue];
            self.recordType = [self objectOrNilForKey:kHistoryTypeListsRecordType fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kHistoryTypeListsUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kHistoryTypeListsCreateTime fromDictionary:dict] doubleValue];
            self.bsResult = [self objectOrNilForKey:kHistoryTypeListsBsResult fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kHistoryTypeListsLat fromDictionary:dict];
            self.lng = [self objectOrNilForKey:kHistoryTypeListsLng fromDictionary:dict];
            self.recordTime = [[self objectOrNilForKey:kHistoryTypeListsRecordTime fromDictionary:dict] doubleValue];
            self.bsResultRemark = [self objectOrNilForKey:kHistoryTypeListsBsResultRemark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listsIdentifier] forKey:kHistoryTypeListsId];
    [mutableDict setValue:self.timeType forKey:kHistoryTypeListsTimeType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kHistoryTypeListsState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsValue] forKey:kHistoryTypeListsBsValue];
    [mutableDict setValue:self.recordType forKey:kHistoryTypeListsRecordType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kHistoryTypeListsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kHistoryTypeListsCreateTime];
    [mutableDict setValue:self.bsResult forKey:kHistoryTypeListsBsResult];
    [mutableDict setValue:self.lat forKey:kHistoryTypeListsLat];
    [mutableDict setValue:self.lng forKey:kHistoryTypeListsLng];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recordTime] forKey:kHistoryTypeListsRecordTime];
    [mutableDict setValue:self.bsResultRemark forKey:kHistoryTypeListsBsResultRemark];

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

    self.listsIdentifier = [aDecoder decodeDoubleForKey:kHistoryTypeListsId];
    self.timeType = [aDecoder decodeObjectForKey:kHistoryTypeListsTimeType];
    self.state = [aDecoder decodeDoubleForKey:kHistoryTypeListsState];
    self.bsValue = [aDecoder decodeDoubleForKey:kHistoryTypeListsBsValue];
    self.recordType = [aDecoder decodeObjectForKey:kHistoryTypeListsRecordType];
    self.userId = [aDecoder decodeDoubleForKey:kHistoryTypeListsUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kHistoryTypeListsCreateTime];
    self.bsResult = [aDecoder decodeObjectForKey:kHistoryTypeListsBsResult];
    self.lat = [aDecoder decodeObjectForKey:kHistoryTypeListsLat];
    self.lng = [aDecoder decodeObjectForKey:kHistoryTypeListsLng];
    self.recordTime = [aDecoder decodeDoubleForKey:kHistoryTypeListsRecordTime];
    self.bsResultRemark = [aDecoder decodeObjectForKey:kHistoryTypeListsBsResultRemark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listsIdentifier forKey:kHistoryTypeListsId];
    [aCoder encodeObject:_timeType forKey:kHistoryTypeListsTimeType];
    [aCoder encodeDouble:_state forKey:kHistoryTypeListsState];
    [aCoder encodeDouble:_bsValue forKey:kHistoryTypeListsBsValue];
    [aCoder encodeObject:_recordType forKey:kHistoryTypeListsRecordType];
    [aCoder encodeDouble:_userId forKey:kHistoryTypeListsUserId];
    [aCoder encodeDouble:_createTime forKey:kHistoryTypeListsCreateTime];
    [aCoder encodeObject:_bsResult forKey:kHistoryTypeListsBsResult];
    [aCoder encodeObject:_lat forKey:kHistoryTypeListsLat];
    [aCoder encodeObject:_lng forKey:kHistoryTypeListsLng];
    [aCoder encodeDouble:_recordTime forKey:kHistoryTypeListsRecordTime];
    [aCoder encodeObject:_bsResultRemark forKey:kHistoryTypeListsBsResultRemark];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryTypeLists *copy = [[HistoryTypeLists alloc] init];
    
    if (copy) {

        copy.listsIdentifier = self.listsIdentifier;
        copy.timeType = [self.timeType copyWithZone:zone];
        copy.state = self.state;
        copy.bsValue = self.bsValue;
        copy.recordType = [self.recordType copyWithZone:zone];
        copy.userId = self.userId;
        copy.createTime = self.createTime;
        copy.bsResult = [self.bsResult copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.lng = [self.lng copyWithZone:zone];
        copy.recordTime = self.recordTime;
        copy.bsResultRemark = [self.bsResultRemark copyWithZone:zone];
    }
    
    return copy;
}


@end
