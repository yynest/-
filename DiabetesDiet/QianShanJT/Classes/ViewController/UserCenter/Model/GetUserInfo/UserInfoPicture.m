//
//  UserInfoPicture.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserInfoPicture.h"


NSString *const kUserInfoPictureSuffix = @"suffix";
NSString *const kUserInfoPictureUploadTime = @"uploadTime";
NSString *const kUserInfoPictureHeight = @"height";
NSString *const kUserInfoPictureId = @"id";
NSString *const kUserInfoPictureMd5 = @"md5";
NSString *const kUserInfoPictureWidth = @"width";
NSString *const kUserInfoPictureSize = @"size";
NSString *const kUserInfoPictureUserId = @"userId";
NSString *const kUserInfoPicturePath = @"path";
NSString *const kUserInfoPictureName = @"name";


@interface UserInfoPicture ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoPicture

@synthesize suffix = _suffix;
@synthesize uploadTime = _uploadTime;
@synthesize height = _height;
@synthesize pictureIdentifier = _pictureIdentifier;
@synthesize md5 = _md5;
@synthesize width = _width;
@synthesize size = _size;
@synthesize userId = _userId;
@synthesize path = _path;
@synthesize name = _name;


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
            self.suffix = [self objectOrNilForKey:kUserInfoPictureSuffix fromDictionary:dict];
            self.uploadTime = [[self objectOrNilForKey:kUserInfoPictureUploadTime fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kUserInfoPictureHeight fromDictionary:dict] doubleValue];
            self.pictureIdentifier = [[self objectOrNilForKey:kUserInfoPictureId fromDictionary:dict] doubleValue];
            self.md5 = [self objectOrNilForKey:kUserInfoPictureMd5 fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kUserInfoPictureWidth fromDictionary:dict] doubleValue];
            self.size = [[self objectOrNilForKey:kUserInfoPictureSize fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kUserInfoPictureUserId fromDictionary:dict] doubleValue];
            self.path = [self objectOrNilForKey:kUserInfoPicturePath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kUserInfoPictureName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.suffix forKey:kUserInfoPictureSuffix];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uploadTime] forKey:kUserInfoPictureUploadTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kUserInfoPictureHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pictureIdentifier] forKey:kUserInfoPictureId];
    [mutableDict setValue:self.md5 forKey:kUserInfoPictureMd5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kUserInfoPictureWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kUserInfoPictureSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kUserInfoPictureUserId];
    [mutableDict setValue:self.path forKey:kUserInfoPicturePath];
    [mutableDict setValue:self.name forKey:kUserInfoPictureName];

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

    self.suffix = [aDecoder decodeObjectForKey:kUserInfoPictureSuffix];
    self.uploadTime = [aDecoder decodeDoubleForKey:kUserInfoPictureUploadTime];
    self.height = [aDecoder decodeDoubleForKey:kUserInfoPictureHeight];
    self.pictureIdentifier = [aDecoder decodeDoubleForKey:kUserInfoPictureId];
    self.md5 = [aDecoder decodeObjectForKey:kUserInfoPictureMd5];
    self.width = [aDecoder decodeDoubleForKey:kUserInfoPictureWidth];
    self.size = [aDecoder decodeDoubleForKey:kUserInfoPictureSize];
    self.userId = [aDecoder decodeDoubleForKey:kUserInfoPictureUserId];
    self.path = [aDecoder decodeObjectForKey:kUserInfoPicturePath];
    self.name = [aDecoder decodeObjectForKey:kUserInfoPictureName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_suffix forKey:kUserInfoPictureSuffix];
    [aCoder encodeDouble:_uploadTime forKey:kUserInfoPictureUploadTime];
    [aCoder encodeDouble:_height forKey:kUserInfoPictureHeight];
    [aCoder encodeDouble:_pictureIdentifier forKey:kUserInfoPictureId];
    [aCoder encodeObject:_md5 forKey:kUserInfoPictureMd5];
    [aCoder encodeDouble:_width forKey:kUserInfoPictureWidth];
    [aCoder encodeDouble:_size forKey:kUserInfoPictureSize];
    [aCoder encodeDouble:_userId forKey:kUserInfoPictureUserId];
    [aCoder encodeObject:_path forKey:kUserInfoPicturePath];
    [aCoder encodeObject:_name forKey:kUserInfoPictureName];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoPicture *copy = [[UserInfoPicture alloc] init];
    
    if (copy) {

        copy.suffix = [self.suffix copyWithZone:zone];
        copy.uploadTime = self.uploadTime;
        copy.height = self.height;
        copy.pictureIdentifier = self.pictureIdentifier;
        copy.md5 = [self.md5 copyWithZone:zone];
        copy.width = self.width;
        copy.size = self.size;
        copy.userId = self.userId;
        copy.path = [self.path copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
