//
//  HomeIndexUser.m
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeIndexUser.h"
#import "HomeIndexPicture.h"


NSString *const kHomeIndexUserDevicetoken = @"devicetoken";
NSString *const kHomeIndexUserId = @"id";
NSString *const kHomeIndexUserOperation = @"operation";
NSString *const kHomeIndexUserLastLoginTime = @"lastLoginTime";
NSString *const kHomeIndexUserBsSikeage = @"bsSikeage";
NSString *const kHomeIndexUserAddress = @"address";
NSString *const kHomeIndexUserBsVersion = @"bsVersion";
NSString *const kHomeIndexUserVersion = @"version";
NSString *const kHomeIndexUserPicture = @"picture";
NSString *const kHomeIndexUserInited = @"inited";
NSString *const kHomeIndexUserHighpressure = @"highpressure";
NSString *const kHomeIndexUserRole = @"role";
NSString *const kHomeIndexUserSex = @"sex";
NSString *const kHomeIndexUserLowpressure = @"lowpressure";
NSString *const kHomeIndexUserHeadPictureId = @"headPictureId";
NSString *const kHomeIndexUserArea = @"area";
NSString *const kHomeIndexUserSource = @"source";
NSString *const kHomeIndexUserBirthday = @"birthday";
NSString *const kHomeIndexUserName = @"name";
NSString *const kHomeIndexUserBsType = @"bsType";
NSString *const kHomeIndexUserHeight = @"height";
NSString *const kHomeIndexUserSickage = @"sickage";
NSString *const kHomeIndexUserWechatOpenid = @"wechatOpenid";
NSString *const kHomeIndexUserStatus = @"status";
NSString *const kHomeIndexUserCity = @"city";
NSString *const kHomeIndexUserMobile = @"mobile";
NSString *const kHomeIndexUserProvince = @"province";
NSString *const kHomeIndexUserIconUrl = @"iconUrl";
NSString *const kHomeIndexUserCreateTime = @"createTime";
NSString *const kHomeIndexUserModifyTime = @"modifyTime";
NSString *const kHomeIndexUserUnionId = @"unionId";
NSString *const kHomeIndexUserBsInited = @"bsInited";
NSString *const kHomeIndexUserWeight = @"weight";


@interface HomeIndexUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeIndexUser

@synthesize devicetoken = _devicetoken;
@synthesize userIdentifier = _userIdentifier;
@synthesize operation = _operation;
@synthesize lastLoginTime = _lastLoginTime;
@synthesize bsSikeage = _bsSikeage;
@synthesize address = _address;
@synthesize bsVersion = _bsVersion;
@synthesize version = _version;
@synthesize picture = _picture;
@synthesize inited = _inited;
@synthesize highpressure = _highpressure;
@synthesize role = _role;
@synthesize sex = _sex;
@synthesize lowpressure = _lowpressure;
@synthesize headPictureId = _headPictureId;
@synthesize area = _area;
@synthesize source = _source;
@synthesize birthday = _birthday;
@synthesize name = _name;
@synthesize bsType = _bsType;
@synthesize height = _height;
@synthesize sickage = _sickage;
@synthesize wechatOpenid = _wechatOpenid;
@synthesize status = _status;
@synthesize city = _city;
@synthesize mobile = _mobile;
@synthesize province = _province;
@synthesize iconUrl = _iconUrl;
@synthesize createTime = _createTime;
@synthesize modifyTime = _modifyTime;
@synthesize unionId = _unionId;
@synthesize bsInited = _bsInited;
@synthesize weight = _weight;


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
            self.devicetoken = [self objectOrNilForKey:kHomeIndexUserDevicetoken fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kHomeIndexUserId fromDictionary:dict] doubleValue];
            self.operation = [self objectOrNilForKey:kHomeIndexUserOperation fromDictionary:dict];
            self.lastLoginTime = [[self objectOrNilForKey:kHomeIndexUserLastLoginTime fromDictionary:dict] doubleValue];
            self.bsSikeage = [[self objectOrNilForKey:kHomeIndexUserBsSikeage fromDictionary:dict] doubleValue];
            self.address = [self objectOrNilForKey:kHomeIndexUserAddress fromDictionary:dict];
            self.bsVersion = [self objectOrNilForKey:kHomeIndexUserBsVersion fromDictionary:dict];
            self.version = [self objectOrNilForKey:kHomeIndexUserVersion fromDictionary:dict];
            self.picture = [HomeIndexPicture modelObjectWithDictionary:[dict objectForKey:kHomeIndexUserPicture]];
            self.inited = [[self objectOrNilForKey:kHomeIndexUserInited fromDictionary:dict] doubleValue];
            self.highpressure = [[self objectOrNilForKey:kHomeIndexUserHighpressure fromDictionary:dict] doubleValue];
            self.role = [[self objectOrNilForKey:kHomeIndexUserRole fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kHomeIndexUserSex fromDictionary:dict] doubleValue];
            self.lowpressure = [[self objectOrNilForKey:kHomeIndexUserLowpressure fromDictionary:dict] doubleValue];
            self.headPictureId = [[self objectOrNilForKey:kHomeIndexUserHeadPictureId fromDictionary:dict] doubleValue];
            self.area = [self objectOrNilForKey:kHomeIndexUserArea fromDictionary:dict];
            self.source = [self objectOrNilForKey:kHomeIndexUserSource fromDictionary:dict];
            self.birthday = [[self objectOrNilForKey:kHomeIndexUserBirthday fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kHomeIndexUserName fromDictionary:dict];
            self.bsType = [[self objectOrNilForKey:kHomeIndexUserBsType fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kHomeIndexUserHeight fromDictionary:dict] doubleValue];
            self.sickage = [[self objectOrNilForKey:kHomeIndexUserSickage fromDictionary:dict] doubleValue];
            self.wechatOpenid = [self objectOrNilForKey:kHomeIndexUserWechatOpenid fromDictionary:dict];
            self.status = [self objectOrNilForKey:kHomeIndexUserStatus fromDictionary:dict];
            self.city = [self objectOrNilForKey:kHomeIndexUserCity fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kHomeIndexUserMobile fromDictionary:dict];
            self.province = [self objectOrNilForKey:kHomeIndexUserProvince fromDictionary:dict];
            self.iconUrl = [self objectOrNilForKey:kHomeIndexUserIconUrl fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kHomeIndexUserCreateTime fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kHomeIndexUserModifyTime fromDictionary:dict] doubleValue];
            self.unionId = [self objectOrNilForKey:kHomeIndexUserUnionId fromDictionary:dict];
            self.bsInited = [[self objectOrNilForKey:kHomeIndexUserBsInited fromDictionary:dict] doubleValue];
            self.weight = [[self objectOrNilForKey:kHomeIndexUserWeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.devicetoken forKey:kHomeIndexUserDevicetoken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kHomeIndexUserId];
    [mutableDict setValue:self.operation forKey:kHomeIndexUserOperation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kHomeIndexUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsSikeage] forKey:kHomeIndexUserBsSikeage];
    [mutableDict setValue:self.address forKey:kHomeIndexUserAddress];
    [mutableDict setValue:self.bsVersion forKey:kHomeIndexUserBsVersion];
    [mutableDict setValue:self.version forKey:kHomeIndexUserVersion];
    [mutableDict setValue:[self.picture dictionaryRepresentation] forKey:kHomeIndexUserPicture];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inited] forKey:kHomeIndexUserInited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.highpressure] forKey:kHomeIndexUserHighpressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.role] forKey:kHomeIndexUserRole];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kHomeIndexUserSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lowpressure] forKey:kHomeIndexUserLowpressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.headPictureId] forKey:kHomeIndexUserHeadPictureId];
    [mutableDict setValue:self.area forKey:kHomeIndexUserArea];
    [mutableDict setValue:self.source forKey:kHomeIndexUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.birthday] forKey:kHomeIndexUserBirthday];
    [mutableDict setValue:self.name forKey:kHomeIndexUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsType] forKey:kHomeIndexUserBsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kHomeIndexUserHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sickage] forKey:kHomeIndexUserSickage];
    [mutableDict setValue:self.wechatOpenid forKey:kHomeIndexUserWechatOpenid];
    [mutableDict setValue:self.status forKey:kHomeIndexUserStatus];
    [mutableDict setValue:self.city forKey:kHomeIndexUserCity];
    [mutableDict setValue:self.mobile forKey:kHomeIndexUserMobile];
    [mutableDict setValue:self.province forKey:kHomeIndexUserProvince];
    [mutableDict setValue:self.iconUrl forKey:kHomeIndexUserIconUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kHomeIndexUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kHomeIndexUserModifyTime];
    [mutableDict setValue:self.unionId forKey:kHomeIndexUserUnionId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsInited] forKey:kHomeIndexUserBsInited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kHomeIndexUserWeight];

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

    self.devicetoken = [aDecoder decodeObjectForKey:kHomeIndexUserDevicetoken];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kHomeIndexUserId];
    self.operation = [aDecoder decodeObjectForKey:kHomeIndexUserOperation];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kHomeIndexUserLastLoginTime];
    self.bsSikeage = [aDecoder decodeDoubleForKey:kHomeIndexUserBsSikeage];
    self.address = [aDecoder decodeObjectForKey:kHomeIndexUserAddress];
    self.bsVersion = [aDecoder decodeObjectForKey:kHomeIndexUserBsVersion];
    self.version = [aDecoder decodeObjectForKey:kHomeIndexUserVersion];
    self.picture = [aDecoder decodeObjectForKey:kHomeIndexUserPicture];
    self.inited = [aDecoder decodeDoubleForKey:kHomeIndexUserInited];
    self.highpressure = [aDecoder decodeDoubleForKey:kHomeIndexUserHighpressure];
    self.role = [aDecoder decodeDoubleForKey:kHomeIndexUserRole];
    self.sex = [aDecoder decodeDoubleForKey:kHomeIndexUserSex];
    self.lowpressure = [aDecoder decodeDoubleForKey:kHomeIndexUserLowpressure];
    self.headPictureId = [aDecoder decodeDoubleForKey:kHomeIndexUserHeadPictureId];
    self.area = [aDecoder decodeObjectForKey:kHomeIndexUserArea];
    self.source = [aDecoder decodeObjectForKey:kHomeIndexUserSource];
    self.birthday = [aDecoder decodeDoubleForKey:kHomeIndexUserBirthday];
    self.name = [aDecoder decodeObjectForKey:kHomeIndexUserName];
    self.bsType = [aDecoder decodeDoubleForKey:kHomeIndexUserBsType];
    self.height = [aDecoder decodeDoubleForKey:kHomeIndexUserHeight];
    self.sickage = [aDecoder decodeDoubleForKey:kHomeIndexUserSickage];
    self.wechatOpenid = [aDecoder decodeObjectForKey:kHomeIndexUserWechatOpenid];
    self.status = [aDecoder decodeObjectForKey:kHomeIndexUserStatus];
    self.city = [aDecoder decodeObjectForKey:kHomeIndexUserCity];
    self.mobile = [aDecoder decodeObjectForKey:kHomeIndexUserMobile];
    self.province = [aDecoder decodeObjectForKey:kHomeIndexUserProvince];
    self.iconUrl = [aDecoder decodeObjectForKey:kHomeIndexUserIconUrl];
    self.createTime = [aDecoder decodeDoubleForKey:kHomeIndexUserCreateTime];
    self.modifyTime = [aDecoder decodeDoubleForKey:kHomeIndexUserModifyTime];
    self.unionId = [aDecoder decodeObjectForKey:kHomeIndexUserUnionId];
    self.bsInited = [aDecoder decodeDoubleForKey:kHomeIndexUserBsInited];
    self.weight = [aDecoder decodeDoubleForKey:kHomeIndexUserWeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_devicetoken forKey:kHomeIndexUserDevicetoken];
    [aCoder encodeDouble:_userIdentifier forKey:kHomeIndexUserId];
    [aCoder encodeObject:_operation forKey:kHomeIndexUserOperation];
    [aCoder encodeDouble:_lastLoginTime forKey:kHomeIndexUserLastLoginTime];
    [aCoder encodeDouble:_bsSikeage forKey:kHomeIndexUserBsSikeage];
    [aCoder encodeObject:_address forKey:kHomeIndexUserAddress];
    [aCoder encodeObject:_bsVersion forKey:kHomeIndexUserBsVersion];
    [aCoder encodeObject:_version forKey:kHomeIndexUserVersion];
    [aCoder encodeObject:_picture forKey:kHomeIndexUserPicture];
    [aCoder encodeDouble:_inited forKey:kHomeIndexUserInited];
    [aCoder encodeDouble:_highpressure forKey:kHomeIndexUserHighpressure];
    [aCoder encodeDouble:_role forKey:kHomeIndexUserRole];
    [aCoder encodeDouble:_sex forKey:kHomeIndexUserSex];
    [aCoder encodeDouble:_lowpressure forKey:kHomeIndexUserLowpressure];
    [aCoder encodeDouble:_headPictureId forKey:kHomeIndexUserHeadPictureId];
    [aCoder encodeObject:_area forKey:kHomeIndexUserArea];
    [aCoder encodeObject:_source forKey:kHomeIndexUserSource];
    [aCoder encodeDouble:_birthday forKey:kHomeIndexUserBirthday];
    [aCoder encodeObject:_name forKey:kHomeIndexUserName];
    [aCoder encodeDouble:_bsType forKey:kHomeIndexUserBsType];
    [aCoder encodeDouble:_height forKey:kHomeIndexUserHeight];
    [aCoder encodeDouble:_sickage forKey:kHomeIndexUserSickage];
    [aCoder encodeObject:_wechatOpenid forKey:kHomeIndexUserWechatOpenid];
    [aCoder encodeObject:_status forKey:kHomeIndexUserStatus];
    [aCoder encodeObject:_city forKey:kHomeIndexUserCity];
    [aCoder encodeObject:_mobile forKey:kHomeIndexUserMobile];
    [aCoder encodeObject:_province forKey:kHomeIndexUserProvince];
    [aCoder encodeObject:_iconUrl forKey:kHomeIndexUserIconUrl];
    [aCoder encodeDouble:_createTime forKey:kHomeIndexUserCreateTime];
    [aCoder encodeDouble:_modifyTime forKey:kHomeIndexUserModifyTime];
    [aCoder encodeObject:_unionId forKey:kHomeIndexUserUnionId];
    [aCoder encodeDouble:_bsInited forKey:kHomeIndexUserBsInited];
    [aCoder encodeDouble:_weight forKey:kHomeIndexUserWeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeIndexUser *copy = [[HomeIndexUser alloc] init];
    
    if (copy) {

        copy.devicetoken = [self.devicetoken copyWithZone:zone];
        copy.userIdentifier = self.userIdentifier;
        copy.operation = [self.operation copyWithZone:zone];
        copy.lastLoginTime = self.lastLoginTime;
        copy.bsSikeage = self.bsSikeage;
        copy.address = [self.address copyWithZone:zone];
        copy.bsVersion = [self.bsVersion copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
        copy.picture = [self.picture copyWithZone:zone];
        copy.inited = self.inited;
        copy.highpressure = self.highpressure;
        copy.role = self.role;
        copy.sex = self.sex;
        copy.lowpressure = self.lowpressure;
        copy.headPictureId = self.headPictureId;
        copy.area = [self.area copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.birthday = self.birthday;
        copy.name = [self.name copyWithZone:zone];
        copy.bsType = self.bsType;
        copy.height = self.height;
        copy.sickage = self.sickage;
        copy.wechatOpenid = [self.wechatOpenid copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.createTime = self.createTime;
        copy.modifyTime = self.modifyTime;
        copy.unionId = [self.unionId copyWithZone:zone];
        copy.bsInited = self.bsInited;
        copy.weight = self.weight;
    }
    
    return copy;
}


@end
