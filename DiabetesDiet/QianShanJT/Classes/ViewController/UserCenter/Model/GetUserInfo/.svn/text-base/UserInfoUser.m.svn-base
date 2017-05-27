//
//  UserInfoUser.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserInfoUser.h"
#import "UserInfoPicture.h"


NSString *const kUserInfoUserDevicetoken = @"devicetoken";
NSString *const kUserInfoUserId = @"id";
NSString *const kUserInfoUserOperation = @"operation";
NSString *const kUserInfoUserLastLoginTime = @"lastLoginTime";
NSString *const kUserInfoUserBsSikeage = @"bsSikeage";
NSString *const kUserInfoUserAddress = @"address";
NSString *const kUserInfoUserBsVersion = @"bsVersion";
NSString *const kUserInfoUserVersion = @"version";
NSString *const kUserInfoUserPicture = @"picture";
NSString *const kUserInfoUserInited = @"inited";
NSString *const kUserInfoUserHighpressure = @"highpressure";
NSString *const kUserInfoUserRole = @"role";
NSString *const kUserInfoUserSex = @"sex";
NSString *const kUserInfoUserLowpressure = @"lowpressure";
NSString *const kUserInfoUserHeadPictureId = @"headPictureId";
NSString *const kUserInfoUserArea = @"area";
NSString *const kUserInfoUserSource = @"source";
NSString *const kUserInfoUserBirthday = @"birthday";
NSString *const kUserInfoUserName = @"name";
NSString *const kUserInfoUserBsType = @"bsType";
NSString *const kUserInfoUserHeight = @"height";
NSString *const kUserInfoUserSickage = @"sickage";
NSString *const kUserInfoUserWechatOpenid = @"wechatOpenid";
NSString *const kUserInfoUserStatus = @"status";
NSString *const kUserInfoUserCity = @"city";
NSString *const kUserInfoUserMobile = @"mobile";
NSString *const kUserInfoUserProvince = @"province";
NSString *const kUserInfoUserIconUrl = @"iconUrl";
NSString *const kUserInfoUserCreateTime = @"createTime";
NSString *const kUserInfoUserModifyTime = @"modifyTime";
NSString *const kUserInfoUserUnionId = @"unionId";
NSString *const kUserInfoUserBsInited = @"bsInited";
NSString *const kUserInfoUserWeight = @"weight";


@interface UserInfoUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoUser

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
            self.devicetoken = [self objectOrNilForKey:kUserInfoUserDevicetoken fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kUserInfoUserId fromDictionary:dict] doubleValue];
            self.operation = [self objectOrNilForKey:kUserInfoUserOperation fromDictionary:dict];
            self.lastLoginTime = [[self objectOrNilForKey:kUserInfoUserLastLoginTime fromDictionary:dict] doubleValue];
            self.bsSikeage = [[self objectOrNilForKey:kUserInfoUserBsSikeage fromDictionary:dict] doubleValue];
            self.address = [self objectOrNilForKey:kUserInfoUserAddress fromDictionary:dict];
            self.bsVersion = [self objectOrNilForKey:kUserInfoUserBsVersion fromDictionary:dict];
            self.version = [self objectOrNilForKey:kUserInfoUserVersion fromDictionary:dict];
            self.picture = [UserInfoPicture modelObjectWithDictionary:[dict objectForKey:kUserInfoUserPicture]];
            self.inited = [[self objectOrNilForKey:kUserInfoUserInited fromDictionary:dict] doubleValue];
            self.highpressure = [[self objectOrNilForKey:kUserInfoUserHighpressure fromDictionary:dict] doubleValue];
            self.role = [[self objectOrNilForKey:kUserInfoUserRole fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kUserInfoUserSex fromDictionary:dict] doubleValue];
            self.lowpressure = [[self objectOrNilForKey:kUserInfoUserLowpressure fromDictionary:dict] doubleValue];
            self.headPictureId = [[self objectOrNilForKey:kUserInfoUserHeadPictureId fromDictionary:dict] doubleValue];
            self.area = [self objectOrNilForKey:kUserInfoUserArea fromDictionary:dict];
            self.source = [self objectOrNilForKey:kUserInfoUserSource fromDictionary:dict];
            self.birthday = [[self objectOrNilForKey:kUserInfoUserBirthday fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kUserInfoUserName fromDictionary:dict];
            self.bsType = [[self objectOrNilForKey:kUserInfoUserBsType fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kUserInfoUserHeight fromDictionary:dict] doubleValue];
            self.sickage = [[self objectOrNilForKey:kUserInfoUserSickage fromDictionary:dict] doubleValue];
            self.wechatOpenid = [self objectOrNilForKey:kUserInfoUserWechatOpenid fromDictionary:dict];
            self.status = [self objectOrNilForKey:kUserInfoUserStatus fromDictionary:dict];
            self.city = [self objectOrNilForKey:kUserInfoUserCity fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kUserInfoUserMobile fromDictionary:dict];
            self.province = [self objectOrNilForKey:kUserInfoUserProvince fromDictionary:dict];
            self.iconUrl = [self objectOrNilForKey:kUserInfoUserIconUrl fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kUserInfoUserCreateTime fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kUserInfoUserModifyTime fromDictionary:dict] doubleValue];
            self.unionId = [self objectOrNilForKey:kUserInfoUserUnionId fromDictionary:dict];
            self.bsInited = [[self objectOrNilForKey:kUserInfoUserBsInited fromDictionary:dict] doubleValue];
            self.weight = [[self objectOrNilForKey:kUserInfoUserWeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.devicetoken forKey:kUserInfoUserDevicetoken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kUserInfoUserId];
    [mutableDict setValue:self.operation forKey:kUserInfoUserOperation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kUserInfoUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsSikeage] forKey:kUserInfoUserBsSikeage];
    [mutableDict setValue:self.address forKey:kUserInfoUserAddress];
    [mutableDict setValue:self.bsVersion forKey:kUserInfoUserBsVersion];
    [mutableDict setValue:self.version forKey:kUserInfoUserVersion];
    [mutableDict setValue:[self.picture dictionaryRepresentation] forKey:kUserInfoUserPicture];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inited] forKey:kUserInfoUserInited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.highpressure] forKey:kUserInfoUserHighpressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.role] forKey:kUserInfoUserRole];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kUserInfoUserSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lowpressure] forKey:kUserInfoUserLowpressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.headPictureId] forKey:kUserInfoUserHeadPictureId];
    [mutableDict setValue:self.area forKey:kUserInfoUserArea];
    [mutableDict setValue:self.source forKey:kUserInfoUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.birthday] forKey:kUserInfoUserBirthday];
    [mutableDict setValue:self.name forKey:kUserInfoUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsType] forKey:kUserInfoUserBsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kUserInfoUserHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sickage] forKey:kUserInfoUserSickage];
    [mutableDict setValue:self.wechatOpenid forKey:kUserInfoUserWechatOpenid];
    [mutableDict setValue:self.status forKey:kUserInfoUserStatus];
    [mutableDict setValue:self.city forKey:kUserInfoUserCity];
    [mutableDict setValue:self.mobile forKey:kUserInfoUserMobile];
    [mutableDict setValue:self.province forKey:kUserInfoUserProvince];
    [mutableDict setValue:self.iconUrl forKey:kUserInfoUserIconUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kUserInfoUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kUserInfoUserModifyTime];
    [mutableDict setValue:self.unionId forKey:kUserInfoUserUnionId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsInited] forKey:kUserInfoUserBsInited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kUserInfoUserWeight];

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

    self.devicetoken = [aDecoder decodeObjectForKey:kUserInfoUserDevicetoken];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kUserInfoUserId];
    self.operation = [aDecoder decodeObjectForKey:kUserInfoUserOperation];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kUserInfoUserLastLoginTime];
    self.bsSikeage = [aDecoder decodeDoubleForKey:kUserInfoUserBsSikeage];
    self.address = [aDecoder decodeObjectForKey:kUserInfoUserAddress];
    self.bsVersion = [aDecoder decodeObjectForKey:kUserInfoUserBsVersion];
    self.version = [aDecoder decodeObjectForKey:kUserInfoUserVersion];
    self.picture = [aDecoder decodeObjectForKey:kUserInfoUserPicture];
    self.inited = [aDecoder decodeDoubleForKey:kUserInfoUserInited];
    self.highpressure = [aDecoder decodeDoubleForKey:kUserInfoUserHighpressure];
    self.role = [aDecoder decodeDoubleForKey:kUserInfoUserRole];
    self.sex = [aDecoder decodeDoubleForKey:kUserInfoUserSex];
    self.lowpressure = [aDecoder decodeDoubleForKey:kUserInfoUserLowpressure];
    self.headPictureId = [aDecoder decodeDoubleForKey:kUserInfoUserHeadPictureId];
    self.area = [aDecoder decodeObjectForKey:kUserInfoUserArea];
    self.source = [aDecoder decodeObjectForKey:kUserInfoUserSource];
    self.birthday = [aDecoder decodeDoubleForKey:kUserInfoUserBirthday];
    self.name = [aDecoder decodeObjectForKey:kUserInfoUserName];
    self.bsType = [aDecoder decodeDoubleForKey:kUserInfoUserBsType];
    self.height = [aDecoder decodeDoubleForKey:kUserInfoUserHeight];
    self.sickage = [aDecoder decodeDoubleForKey:kUserInfoUserSickage];
    self.wechatOpenid = [aDecoder decodeObjectForKey:kUserInfoUserWechatOpenid];
    self.status = [aDecoder decodeObjectForKey:kUserInfoUserStatus];
    self.city = [aDecoder decodeObjectForKey:kUserInfoUserCity];
    self.mobile = [aDecoder decodeObjectForKey:kUserInfoUserMobile];
    self.province = [aDecoder decodeObjectForKey:kUserInfoUserProvince];
    self.iconUrl = [aDecoder decodeObjectForKey:kUserInfoUserIconUrl];
    self.createTime = [aDecoder decodeDoubleForKey:kUserInfoUserCreateTime];
    self.modifyTime = [aDecoder decodeDoubleForKey:kUserInfoUserModifyTime];
    self.unionId = [aDecoder decodeObjectForKey:kUserInfoUserUnionId];
    self.bsInited = [aDecoder decodeDoubleForKey:kUserInfoUserBsInited];
    self.weight = [aDecoder decodeDoubleForKey:kUserInfoUserWeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_devicetoken forKey:kUserInfoUserDevicetoken];
    [aCoder encodeDouble:_userIdentifier forKey:kUserInfoUserId];
    [aCoder encodeObject:_operation forKey:kUserInfoUserOperation];
    [aCoder encodeDouble:_lastLoginTime forKey:kUserInfoUserLastLoginTime];
    [aCoder encodeDouble:_bsSikeage forKey:kUserInfoUserBsSikeage];
    [aCoder encodeObject:_address forKey:kUserInfoUserAddress];
    [aCoder encodeObject:_bsVersion forKey:kUserInfoUserBsVersion];
    [aCoder encodeObject:_version forKey:kUserInfoUserVersion];
    [aCoder encodeObject:_picture forKey:kUserInfoUserPicture];
    [aCoder encodeDouble:_inited forKey:kUserInfoUserInited];
    [aCoder encodeDouble:_highpressure forKey:kUserInfoUserHighpressure];
    [aCoder encodeDouble:_role forKey:kUserInfoUserRole];
    [aCoder encodeDouble:_sex forKey:kUserInfoUserSex];
    [aCoder encodeDouble:_lowpressure forKey:kUserInfoUserLowpressure];
    [aCoder encodeDouble:_headPictureId forKey:kUserInfoUserHeadPictureId];
    [aCoder encodeObject:_area forKey:kUserInfoUserArea];
    [aCoder encodeObject:_source forKey:kUserInfoUserSource];
    [aCoder encodeDouble:_birthday forKey:kUserInfoUserBirthday];
    [aCoder encodeObject:_name forKey:kUserInfoUserName];
    [aCoder encodeDouble:_bsType forKey:kUserInfoUserBsType];
    [aCoder encodeDouble:_height forKey:kUserInfoUserHeight];
    [aCoder encodeDouble:_sickage forKey:kUserInfoUserSickage];
    [aCoder encodeObject:_wechatOpenid forKey:kUserInfoUserWechatOpenid];
    [aCoder encodeObject:_status forKey:kUserInfoUserStatus];
    [aCoder encodeObject:_city forKey:kUserInfoUserCity];
    [aCoder encodeObject:_mobile forKey:kUserInfoUserMobile];
    [aCoder encodeObject:_province forKey:kUserInfoUserProvince];
    [aCoder encodeObject:_iconUrl forKey:kUserInfoUserIconUrl];
    [aCoder encodeDouble:_createTime forKey:kUserInfoUserCreateTime];
    [aCoder encodeDouble:_modifyTime forKey:kUserInfoUserModifyTime];
    [aCoder encodeObject:_unionId forKey:kUserInfoUserUnionId];
    [aCoder encodeDouble:_bsInited forKey:kUserInfoUserBsInited];
    [aCoder encodeDouble:_weight forKey:kUserInfoUserWeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoUser *copy = [[UserInfoUser alloc] init];
    
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
