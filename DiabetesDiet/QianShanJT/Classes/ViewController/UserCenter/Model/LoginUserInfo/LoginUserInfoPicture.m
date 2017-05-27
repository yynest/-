//
//  LoginUserInfoPicture.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginUserInfoPicture.h"


NSString *const kLoginUserInfoPictureSuffix = @"suffix";
NSString *const kLoginUserInfoPictureUploadTime = @"uploadTime";
NSString *const kLoginUserInfoPictureHeight = @"height";
NSString *const kLoginUserInfoPictureId = @"id";
NSString *const kLoginUserInfoPictureMd5 = @"md5";
NSString *const kLoginUserInfoPictureWidth = @"width";
NSString *const kLoginUserInfoPictureSize = @"size";
NSString *const kLoginUserInfoPictureUserId = @"userId";
NSString *const kLoginUserInfoPicturePath = @"path";
NSString *const kLoginUserInfoPictureName = @"name";


@interface LoginUserInfoPicture ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginUserInfoPicture

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
            self.suffix = [self objectOrNilForKey:kLoginUserInfoPictureSuffix fromDictionary:dict];
            self.uploadTime = [[self objectOrNilForKey:kLoginUserInfoPictureUploadTime fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kLoginUserInfoPictureHeight fromDictionary:dict] doubleValue];
            self.pictureIdentifier = [[self objectOrNilForKey:kLoginUserInfoPictureId fromDictionary:dict] doubleValue];
            self.md5 = [self objectOrNilForKey:kLoginUserInfoPictureMd5 fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kLoginUserInfoPictureWidth fromDictionary:dict] doubleValue];
            self.size = [[self objectOrNilForKey:kLoginUserInfoPictureSize fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kLoginUserInfoPictureUserId fromDictionary:dict] doubleValue];
            self.path = [self objectOrNilForKey:kLoginUserInfoPicturePath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kLoginUserInfoPictureName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.suffix forKey:kLoginUserInfoPictureSuffix];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uploadTime] forKey:kLoginUserInfoPictureUploadTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kLoginUserInfoPictureHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pictureIdentifier] forKey:kLoginUserInfoPictureId];
    [mutableDict setValue:self.md5 forKey:kLoginUserInfoPictureMd5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kLoginUserInfoPictureWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kLoginUserInfoPictureSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kLoginUserInfoPictureUserId];
    [mutableDict setValue:self.path forKey:kLoginUserInfoPicturePath];
    [mutableDict setValue:self.name forKey:kLoginUserInfoPictureName];

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

    self.suffix = [aDecoder decodeObjectForKey:kLoginUserInfoPictureSuffix];
    self.uploadTime = [aDecoder decodeDoubleForKey:kLoginUserInfoPictureUploadTime];
    self.height = [aDecoder decodeDoubleForKey:kLoginUserInfoPictureHeight];
    self.pictureIdentifier = [aDecoder decodeDoubleForKey:kLoginUserInfoPictureId];
    self.md5 = [aDecoder decodeObjectForKey:kLoginUserInfoPictureMd5];
    self.width = [aDecoder decodeDoubleForKey:kLoginUserInfoPictureWidth];
    self.size = [aDecoder decodeDoubleForKey:kLoginUserInfoPictureSize];
    self.userId = [aDecoder decodeDoubleForKey:kLoginUserInfoPictureUserId];
    self.path = [aDecoder decodeObjectForKey:kLoginUserInfoPicturePath];
    self.name = [aDecoder decodeObjectForKey:kLoginUserInfoPictureName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_suffix forKey:kLoginUserInfoPictureSuffix];
    [aCoder encodeDouble:_uploadTime forKey:kLoginUserInfoPictureUploadTime];
    [aCoder encodeDouble:_height forKey:kLoginUserInfoPictureHeight];
    [aCoder encodeDouble:_pictureIdentifier forKey:kLoginUserInfoPictureId];
    [aCoder encodeObject:_md5 forKey:kLoginUserInfoPictureMd5];
    [aCoder encodeDouble:_width forKey:kLoginUserInfoPictureWidth];
    [aCoder encodeDouble:_size forKey:kLoginUserInfoPictureSize];
    [aCoder encodeDouble:_userId forKey:kLoginUserInfoPictureUserId];
    [aCoder encodeObject:_path forKey:kLoginUserInfoPicturePath];
    [aCoder encodeObject:_name forKey:kLoginUserInfoPictureName];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginUserInfoPicture *copy = [[LoginUserInfoPicture alloc] init];
    
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
