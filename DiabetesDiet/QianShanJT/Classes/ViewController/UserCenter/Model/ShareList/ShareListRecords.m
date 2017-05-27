//
//  ShareListRecords.m
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShareListRecords.h"


NSString *const kShareListRecordsId = @"id";
NSString *const kShareListRecordsFriendUserId = @"friendUserId";
NSString *const kShareListRecordsFriendUserName = @"friendUserName";
NSString *const kShareListRecordsFriendUserPic = @"friendUserPic";


@interface ShareListRecords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShareListRecords

@synthesize recordsIdentifier = _recordsIdentifier;
@synthesize friendUserId = _friendUserId;
@synthesize friendUserName = _friendUserName;
@synthesize friendUserPic = _friendUserPic;


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
            self.recordsIdentifier = [[self objectOrNilForKey:kShareListRecordsId fromDictionary:dict] doubleValue];
            self.friendUserId = [[self objectOrNilForKey:kShareListRecordsFriendUserId fromDictionary:dict] doubleValue];
            self.friendUserName = [self objectOrNilForKey:kShareListRecordsFriendUserName fromDictionary:dict];
            self.friendUserPic = [self objectOrNilForKey:kShareListRecordsFriendUserPic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recordsIdentifier] forKey:kShareListRecordsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friendUserId] forKey:kShareListRecordsFriendUserId];
    [mutableDict setValue:self.friendUserName forKey:kShareListRecordsFriendUserName];
    [mutableDict setValue:self.friendUserPic forKey:kShareListRecordsFriendUserPic];

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

    self.recordsIdentifier = [aDecoder decodeDoubleForKey:kShareListRecordsId];
    self.friendUserId = [aDecoder decodeDoubleForKey:kShareListRecordsFriendUserId];
    self.friendUserName = [aDecoder decodeObjectForKey:kShareListRecordsFriendUserName];
    self.friendUserPic = [aDecoder decodeObjectForKey:kShareListRecordsFriendUserPic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_recordsIdentifier forKey:kShareListRecordsId];
    [aCoder encodeDouble:_friendUserId forKey:kShareListRecordsFriendUserId];
    [aCoder encodeObject:_friendUserName forKey:kShareListRecordsFriendUserName];
    [aCoder encodeObject:_friendUserPic forKey:kShareListRecordsFriendUserPic];
}

- (id)copyWithZone:(NSZone *)zone
{
    ShareListRecords *copy = [[ShareListRecords alloc] init];
    
    if (copy) {

        copy.recordsIdentifier = self.recordsIdentifier;
        copy.friendUserId = self.friendUserId;
        copy.friendUserName = [self.friendUserName copyWithZone:zone];
        copy.friendUserPic = [self.friendUserPic copyWithZone:zone];
    }
    
    return copy;
}


@end
