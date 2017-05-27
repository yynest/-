//
//  QrcodeData.m
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "QrcodeData.h"


NSString *const kQrcodeDataTicket = @"ticket";
NSString *const kQrcodeDataUrl = @"url";
NSString *const kQrcodeDataExpireSeconds = @"expire_seconds";


@interface QrcodeData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QrcodeData

@synthesize ticket = _ticket;
@synthesize url = _url;
@synthesize expireSeconds = _expireSeconds;


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
            self.ticket = [self objectOrNilForKey:kQrcodeDataTicket fromDictionary:dict];
            self.url = [self objectOrNilForKey:kQrcodeDataUrl fromDictionary:dict];
            self.expireSeconds = [[self objectOrNilForKey:kQrcodeDataExpireSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ticket forKey:kQrcodeDataTicket];
    [mutableDict setValue:self.url forKey:kQrcodeDataUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expireSeconds] forKey:kQrcodeDataExpireSeconds];

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

    self.ticket = [aDecoder decodeObjectForKey:kQrcodeDataTicket];
    self.url = [aDecoder decodeObjectForKey:kQrcodeDataUrl];
    self.expireSeconds = [aDecoder decodeDoubleForKey:kQrcodeDataExpireSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ticket forKey:kQrcodeDataTicket];
    [aCoder encodeObject:_url forKey:kQrcodeDataUrl];
    [aCoder encodeDouble:_expireSeconds forKey:kQrcodeDataExpireSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    QrcodeData *copy = [[QrcodeData alloc] init];
    
    if (copy) {

        copy.ticket = [self.ticket copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.expireSeconds = self.expireSeconds;
    }
    
    return copy;
}


@end
