//
//  HistoryRecords.m
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HistoryRecords.h"


NSString *const kHistoryRecordsId = @"id";
NSString *const kHistoryRecordsTimeType = @"timeType";
NSString *const kHistoryRecordsState = @"state";
NSString *const kHistoryRecordsBsValue = @"bsValue";
NSString *const kHistoryRecordsUserId = @"userId";
NSString *const kHistoryRecordsCreateTime = @"createTime";
NSString *const kHistoryRecordsSumRecords = @"sumRecords";
NSString *const kHistoryRecordsBsResult = @"bsResult";
NSString *const kHistoryRecordsLat = @"lat";
NSString *const kHistoryRecordsLng = @"lng";
NSString *const kHistoryRecordsRecordTime = @"recordTime";
NSString *const kHistoryRecordsBsResultRemark = @"bsResultRemark";


@interface HistoryRecords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HistoryRecords

@synthesize recordsIdentifier = _recordsIdentifier;
@synthesize timeType = _timeType;
@synthesize state = _state;
@synthesize bsValue = _bsValue;
@synthesize userId = _userId;
@synthesize createTime = _createTime;
@synthesize sumRecords = _sumRecords;
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
            self.recordsIdentifier = [[self objectOrNilForKey:kHistoryRecordsId fromDictionary:dict] doubleValue];
            self.timeType = [self objectOrNilForKey:kHistoryRecordsTimeType fromDictionary:dict];
            self.state = [[self objectOrNilForKey:kHistoryRecordsState fromDictionary:dict] doubleValue];
            self.bsValue = [[self objectOrNilForKey:kHistoryRecordsBsValue fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kHistoryRecordsUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kHistoryRecordsCreateTime fromDictionary:dict] doubleValue];
            self.sumRecords = [[self objectOrNilForKey:kHistoryRecordsSumRecords fromDictionary:dict] doubleValue];
            self.bsResult = [self objectOrNilForKey:kHistoryRecordsBsResult fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kHistoryRecordsLat fromDictionary:dict];
            self.lng = [self objectOrNilForKey:kHistoryRecordsLng fromDictionary:dict];
            self.recordTime = [[self objectOrNilForKey:kHistoryRecordsRecordTime fromDictionary:dict] doubleValue];
            self.bsResultRemark = [self objectOrNilForKey:kHistoryRecordsBsResultRemark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recordsIdentifier] forKey:kHistoryRecordsId];
    [mutableDict setValue:self.timeType forKey:kHistoryRecordsTimeType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kHistoryRecordsState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsValue] forKey:kHistoryRecordsBsValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kHistoryRecordsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kHistoryRecordsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sumRecords] forKey:kHistoryRecordsSumRecords];
    [mutableDict setValue:self.bsResult forKey:kHistoryRecordsBsResult];
    [mutableDict setValue:self.lat forKey:kHistoryRecordsLat];
    [mutableDict setValue:self.lng forKey:kHistoryRecordsLng];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recordTime] forKey:kHistoryRecordsRecordTime];
    [mutableDict setValue:self.bsResultRemark forKey:kHistoryRecordsBsResultRemark];

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

    self.recordsIdentifier = [aDecoder decodeDoubleForKey:kHistoryRecordsId];
    self.timeType = [aDecoder decodeObjectForKey:kHistoryRecordsTimeType];
    self.state = [aDecoder decodeDoubleForKey:kHistoryRecordsState];
    self.bsValue = [aDecoder decodeDoubleForKey:kHistoryRecordsBsValue];
    self.userId = [aDecoder decodeDoubleForKey:kHistoryRecordsUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kHistoryRecordsCreateTime];
    self.sumRecords = [aDecoder decodeDoubleForKey:kHistoryRecordsSumRecords];
    self.bsResult = [aDecoder decodeObjectForKey:kHistoryRecordsBsResult];
    self.lat = [aDecoder decodeObjectForKey:kHistoryRecordsLat];
    self.lng = [aDecoder decodeObjectForKey:kHistoryRecordsLng];
    self.recordTime = [aDecoder decodeDoubleForKey:kHistoryRecordsRecordTime];
    self.bsResultRemark = [aDecoder decodeObjectForKey:kHistoryRecordsBsResultRemark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_recordsIdentifier forKey:kHistoryRecordsId];
    [aCoder encodeObject:_timeType forKey:kHistoryRecordsTimeType];
    [aCoder encodeDouble:_state forKey:kHistoryRecordsState];
    [aCoder encodeDouble:_bsValue forKey:kHistoryRecordsBsValue];
    [aCoder encodeDouble:_userId forKey:kHistoryRecordsUserId];
    [aCoder encodeDouble:_createTime forKey:kHistoryRecordsCreateTime];
    [aCoder encodeDouble:_sumRecords forKey:kHistoryRecordsSumRecords];
    [aCoder encodeObject:_bsResult forKey:kHistoryRecordsBsResult];
    [aCoder encodeObject:_lat forKey:kHistoryRecordsLat];
    [aCoder encodeObject:_lng forKey:kHistoryRecordsLng];
    [aCoder encodeDouble:_recordTime forKey:kHistoryRecordsRecordTime];
    [aCoder encodeObject:_bsResultRemark forKey:kHistoryRecordsBsResultRemark];
}

- (id)copyWithZone:(NSZone *)zone
{
    HistoryRecords *copy = [[HistoryRecords alloc] init];
    
    if (copy) {

        copy.recordsIdentifier = self.recordsIdentifier;
        copy.timeType = [self.timeType copyWithZone:zone];
        copy.state = self.state;
        copy.bsValue = self.bsValue;
        copy.userId = self.userId;
        copy.createTime = self.createTime;
        copy.sumRecords = self.sumRecords;
        copy.bsResult = [self.bsResult copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.lng = [self.lng copyWithZone:zone];
        copy.recordTime = self.recordTime;
        copy.bsResultRemark = [self.bsResultRemark copyWithZone:zone];
    }
    
    return copy;
}


@end
