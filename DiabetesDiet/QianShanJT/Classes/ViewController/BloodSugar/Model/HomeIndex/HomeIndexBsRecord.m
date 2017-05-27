//
//  HomeIndexBsRecord.m
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeIndexBsRecord.h"


NSString *const kHomeIndexBsRecordId = @"id";
NSString *const kHomeIndexBsRecordTimeType = @"timeType";
NSString *const kHomeIndexBsRecordState = @"state";
NSString *const kHomeIndexBsRecordBsValue = @"bsValue";
NSString *const kHomeIndexBsRecordRecordType = @"recordType";
NSString *const kHomeIndexBsRecordUserId = @"userId";
NSString *const kHomeIndexBsRecordCreateTime = @"createTime";
NSString *const kHomeIndexBsRecordBsResult = @"bsResult";
NSString *const kHomeIndexBsRecordLat = @"lat";
NSString *const kHomeIndexBsRecordLng = @"lng";
NSString *const kHomeIndexBsRecordRecordTime = @"recordTime";
NSString *const kHomeIndexBsRecordBsResultRemark = @"bsResultRemark";


@interface HomeIndexBsRecord ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeIndexBsRecord

@synthesize bsRecordIdentifier = _bsRecordIdentifier;
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
            self.bsRecordIdentifier = [[self objectOrNilForKey:kHomeIndexBsRecordId fromDictionary:dict] doubleValue];
            self.timeType = [self objectOrNilForKey:kHomeIndexBsRecordTimeType fromDictionary:dict];
            self.state = [[self objectOrNilForKey:kHomeIndexBsRecordState fromDictionary:dict] doubleValue];
            self.bsValue = [[self objectOrNilForKey:kHomeIndexBsRecordBsValue fromDictionary:dict] doubleValue];
            self.recordType = [[self objectOrNilForKey:kHomeIndexBsRecordRecordType fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kHomeIndexBsRecordUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kHomeIndexBsRecordCreateTime fromDictionary:dict] doubleValue];
            self.bsResult = [self objectOrNilForKey:kHomeIndexBsRecordBsResult fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kHomeIndexBsRecordLat fromDictionary:dict];
            self.lng = [self objectOrNilForKey:kHomeIndexBsRecordLng fromDictionary:dict];
            self.recordTime = [[self objectOrNilForKey:kHomeIndexBsRecordRecordTime fromDictionary:dict] doubleValue];
            self.bsResultRemark = [self objectOrNilForKey:kHomeIndexBsRecordBsResultRemark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsRecordIdentifier] forKey:kHomeIndexBsRecordId];
    [mutableDict setValue:self.timeType forKey:kHomeIndexBsRecordTimeType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kHomeIndexBsRecordState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsValue] forKey:kHomeIndexBsRecordBsValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recordType] forKey:kHomeIndexBsRecordRecordType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kHomeIndexBsRecordUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kHomeIndexBsRecordCreateTime];
    [mutableDict setValue:self.bsResult forKey:kHomeIndexBsRecordBsResult];
    [mutableDict setValue:self.lat forKey:kHomeIndexBsRecordLat];
    [mutableDict setValue:self.lng forKey:kHomeIndexBsRecordLng];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recordTime] forKey:kHomeIndexBsRecordRecordTime];
    [mutableDict setValue:self.bsResultRemark forKey:kHomeIndexBsRecordBsResultRemark];

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

    self.bsRecordIdentifier = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordId];
    self.timeType = [aDecoder decodeObjectForKey:kHomeIndexBsRecordTimeType];
    self.state = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordState];
    self.bsValue = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordBsValue];
    self.recordType = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordRecordType];
    self.userId = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordCreateTime];
    self.bsResult = [aDecoder decodeObjectForKey:kHomeIndexBsRecordBsResult];
    self.lat = [aDecoder decodeObjectForKey:kHomeIndexBsRecordLat];
    self.lng = [aDecoder decodeObjectForKey:kHomeIndexBsRecordLng];
    self.recordTime = [aDecoder decodeDoubleForKey:kHomeIndexBsRecordRecordTime];
    self.bsResultRemark = [aDecoder decodeObjectForKey:kHomeIndexBsRecordBsResultRemark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_bsRecordIdentifier forKey:kHomeIndexBsRecordId];
    [aCoder encodeObject:_timeType forKey:kHomeIndexBsRecordTimeType];
    [aCoder encodeDouble:_state forKey:kHomeIndexBsRecordState];
    [aCoder encodeDouble:_bsValue forKey:kHomeIndexBsRecordBsValue];
    [aCoder encodeDouble:_recordType forKey:kHomeIndexBsRecordRecordType];
    [aCoder encodeDouble:_userId forKey:kHomeIndexBsRecordUserId];
    [aCoder encodeDouble:_createTime forKey:kHomeIndexBsRecordCreateTime];
    [aCoder encodeObject:_bsResult forKey:kHomeIndexBsRecordBsResult];
    [aCoder encodeObject:_lat forKey:kHomeIndexBsRecordLat];
    [aCoder encodeObject:_lng forKey:kHomeIndexBsRecordLng];
    [aCoder encodeDouble:_recordTime forKey:kHomeIndexBsRecordRecordTime];
    [aCoder encodeObject:_bsResultRemark forKey:kHomeIndexBsRecordBsResultRemark];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeIndexBsRecord *copy = [[HomeIndexBsRecord alloc] init];
    
    if (copy) {

        copy.bsRecordIdentifier = self.bsRecordIdentifier;
        copy.timeType = [self.timeType copyWithZone:zone];
        copy.state = self.state;
        copy.bsValue = self.bsValue;
        copy.recordType = self.recordType;
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
