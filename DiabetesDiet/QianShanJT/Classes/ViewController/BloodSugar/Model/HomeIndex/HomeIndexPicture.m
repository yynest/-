//
//  HomeIndexPicture.m
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeIndexPicture.h"


NSString *const kHomeIndexPictureSuffix = @"suffix";
NSString *const kHomeIndexPictureUploadTime = @"uploadTime";
NSString *const kHomeIndexPictureHeight = @"height";
NSString *const kHomeIndexPictureId = @"id";
NSString *const kHomeIndexPictureMd5 = @"md5";
NSString *const kHomeIndexPictureWidth = @"width";
NSString *const kHomeIndexPictureSize = @"size";
NSString *const kHomeIndexPictureUserId = @"userId";
NSString *const kHomeIndexPicturePath = @"path";
NSString *const kHomeIndexPictureName = @"name";


@interface HomeIndexPicture ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeIndexPicture

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
            self.suffix = [self objectOrNilForKey:kHomeIndexPictureSuffix fromDictionary:dict];
            self.uploadTime = [[self objectOrNilForKey:kHomeIndexPictureUploadTime fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kHomeIndexPictureHeight fromDictionary:dict] doubleValue];
            self.pictureIdentifier = [[self objectOrNilForKey:kHomeIndexPictureId fromDictionary:dict] doubleValue];
            self.md5 = [self objectOrNilForKey:kHomeIndexPictureMd5 fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kHomeIndexPictureWidth fromDictionary:dict] doubleValue];
            self.size = [[self objectOrNilForKey:kHomeIndexPictureSize fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kHomeIndexPictureUserId fromDictionary:dict] doubleValue];
            self.path = [self objectOrNilForKey:kHomeIndexPicturePath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHomeIndexPictureName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.suffix forKey:kHomeIndexPictureSuffix];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uploadTime] forKey:kHomeIndexPictureUploadTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kHomeIndexPictureHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pictureIdentifier] forKey:kHomeIndexPictureId];
    [mutableDict setValue:self.md5 forKey:kHomeIndexPictureMd5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kHomeIndexPictureWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kHomeIndexPictureSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kHomeIndexPictureUserId];
    [mutableDict setValue:self.path forKey:kHomeIndexPicturePath];
    [mutableDict setValue:self.name forKey:kHomeIndexPictureName];

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

    self.suffix = [aDecoder decodeObjectForKey:kHomeIndexPictureSuffix];
    self.uploadTime = [aDecoder decodeDoubleForKey:kHomeIndexPictureUploadTime];
    self.height = [aDecoder decodeDoubleForKey:kHomeIndexPictureHeight];
    self.pictureIdentifier = [aDecoder decodeDoubleForKey:kHomeIndexPictureId];
    self.md5 = [aDecoder decodeObjectForKey:kHomeIndexPictureMd5];
    self.width = [aDecoder decodeDoubleForKey:kHomeIndexPictureWidth];
    self.size = [aDecoder decodeDoubleForKey:kHomeIndexPictureSize];
    self.userId = [aDecoder decodeDoubleForKey:kHomeIndexPictureUserId];
    self.path = [aDecoder decodeObjectForKey:kHomeIndexPicturePath];
    self.name = [aDecoder decodeObjectForKey:kHomeIndexPictureName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_suffix forKey:kHomeIndexPictureSuffix];
    [aCoder encodeDouble:_uploadTime forKey:kHomeIndexPictureUploadTime];
    [aCoder encodeDouble:_height forKey:kHomeIndexPictureHeight];
    [aCoder encodeDouble:_pictureIdentifier forKey:kHomeIndexPictureId];
    [aCoder encodeObject:_md5 forKey:kHomeIndexPictureMd5];
    [aCoder encodeDouble:_width forKey:kHomeIndexPictureWidth];
    [aCoder encodeDouble:_size forKey:kHomeIndexPictureSize];
    [aCoder encodeDouble:_userId forKey:kHomeIndexPictureUserId];
    [aCoder encodeObject:_path forKey:kHomeIndexPicturePath];
    [aCoder encodeObject:_name forKey:kHomeIndexPictureName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeIndexPicture *copy = [[HomeIndexPicture alloc] init];
    
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
