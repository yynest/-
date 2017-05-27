//
//  LoginUserInfoUser.m
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginUserInfoUser.h"
#import "LoginUserInfoPicture.h"


NSString *const kLoginUserInfoUserDevicetoken = @"devicetoken";
NSString *const kLoginUserInfoUserId = @"id";
NSString *const kLoginUserInfoUserOperation = @"operation";
NSString *const kLoginUserInfoUserLastLoginTime = @"lastLoginTime";
NSString *const kLoginUserInfoUserBsSikeage = @"bsSikeage";
NSString *const kLoginUserInfoUserAddress = @"address";
NSString *const kLoginUserInfoUserBsVersion = @"bsVersion";
NSString *const kLoginUserInfoUserVersion = @"version";
NSString *const kLoginUserInfoUserPicture = @"picture";
NSString *const kLoginUserInfoUserInited = @"inited";
NSString *const kLoginUserInfoUserHighpressure = @"highpressure";
NSString *const kLoginUserInfoUserRole = @"role";
NSString *const kLoginUserInfoUserSex = @"sex";
NSString *const kLoginUserInfoUserLowpressure = @"lowpressure";
NSString *const kLoginUserInfoUserHeadPictureId = @"headPictureId";
NSString *const kLoginUserInfoUserArea = @"area";
NSString *const kLoginUserInfoUserSource = @"source";
NSString *const kLoginUserInfoUserBirthday = @"birthday";
NSString *const kLoginUserInfoUserName = @"name";
NSString *const kLoginUserInfoUserBsType = @"bsType";
NSString *const kLoginUserInfoUserHeight = @"height";
NSString *const kLoginUserInfoUserSickage = @"sickage";
NSString *const kLoginUserInfoUserWechatOpenid = @"wechatOpenid";
NSString *const kLoginUserInfoUserStatus = @"status";
NSString *const kLoginUserInfoUserCity = @"city";
NSString *const kLoginUserInfoUserMobile = @"mobile";
NSString *const kLoginUserInfoUserProvince = @"province";
NSString *const kLoginUserInfoUserIconUrl = @"iconUrl";
NSString *const kLoginUserInfoUserCreateTime = @"createTime";
NSString *const kLoginUserInfoUserModifyTime = @"modifyTime";
NSString *const kLoginUserInfoUserUnionId = @"unionId";
NSString *const kLoginUserInfoUserBsInited = @"bsInited";
NSString *const kLoginUserInfoUserWeight = @"weight";


@interface LoginUserInfoUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginUserInfoUser

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
            self.devicetoken = [self objectOrNilForKey:kLoginUserInfoUserDevicetoken fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kLoginUserInfoUserId fromDictionary:dict] doubleValue];
            self.operation = [self objectOrNilForKey:kLoginUserInfoUserOperation fromDictionary:dict];
            self.lastLoginTime = [[self objectOrNilForKey:kLoginUserInfoUserLastLoginTime fromDictionary:dict] doubleValue];
            self.bsSikeage = [[self objectOrNilForKey:kLoginUserInfoUserBsSikeage fromDictionary:dict] doubleValue];
            self.address = [self objectOrNilForKey:kLoginUserInfoUserAddress fromDictionary:dict];
            self.bsVersion = [self objectOrNilForKey:kLoginUserInfoUserBsVersion fromDictionary:dict];
            self.version = [self objectOrNilForKey:kLoginUserInfoUserVersion fromDictionary:dict];
            self.picture = [LoginUserInfoPicture modelObjectWithDictionary:[dict objectForKey:kLoginUserInfoUserPicture]];
            self.inited = [[self objectOrNilForKey:kLoginUserInfoUserInited fromDictionary:dict] doubleValue];
            self.highpressure = [[self objectOrNilForKey:kLoginUserInfoUserHighpressure fromDictionary:dict] doubleValue];
            self.role = [[self objectOrNilForKey:kLoginUserInfoUserRole fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kLoginUserInfoUserSex fromDictionary:dict] doubleValue];
            self.lowpressure = [[self objectOrNilForKey:kLoginUserInfoUserLowpressure fromDictionary:dict] doubleValue];
            self.headPictureId = [[self objectOrNilForKey:kLoginUserInfoUserHeadPictureId fromDictionary:dict] doubleValue];
            self.area = [self objectOrNilForKey:kLoginUserInfoUserArea fromDictionary:dict];
            self.source = [self objectOrNilForKey:kLoginUserInfoUserSource fromDictionary:dict];
            self.birthday = [[self objectOrNilForKey:kLoginUserInfoUserBirthday fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kLoginUserInfoUserName fromDictionary:dict];
            self.bsType = [[self objectOrNilForKey:kLoginUserInfoUserBsType fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kLoginUserInfoUserHeight fromDictionary:dict] doubleValue];
            self.sickage = [[self objectOrNilForKey:kLoginUserInfoUserSickage fromDictionary:dict] doubleValue];
            self.wechatOpenid = [self objectOrNilForKey:kLoginUserInfoUserWechatOpenid fromDictionary:dict];
            self.status = [self objectOrNilForKey:kLoginUserInfoUserStatus fromDictionary:dict];
            self.city = [self objectOrNilForKey:kLoginUserInfoUserCity fromDictionary:dict];
            self.mobile = [self objectOrNilForKey:kLoginUserInfoUserMobile fromDictionary:dict];
            self.province = [self objectOrNilForKey:kLoginUserInfoUserProvince fromDictionary:dict];
            self.iconUrl = [self objectOrNilForKey:kLoginUserInfoUserIconUrl fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kLoginUserInfoUserCreateTime fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kLoginUserInfoUserModifyTime fromDictionary:dict] doubleValue];
            self.unionId = [self objectOrNilForKey:kLoginUserInfoUserUnionId fromDictionary:dict];
            self.bsInited = [[self objectOrNilForKey:kLoginUserInfoUserBsInited fromDictionary:dict] doubleValue];
            self.weight = [[self objectOrNilForKey:kLoginUserInfoUserWeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.devicetoken forKey:kLoginUserInfoUserDevicetoken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kLoginUserInfoUserId];
    [mutableDict setValue:self.operation forKey:kLoginUserInfoUserOperation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kLoginUserInfoUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsSikeage] forKey:kLoginUserInfoUserBsSikeage];
    [mutableDict setValue:self.address forKey:kLoginUserInfoUserAddress];
    [mutableDict setValue:self.bsVersion forKey:kLoginUserInfoUserBsVersion];
    [mutableDict setValue:self.version forKey:kLoginUserInfoUserVersion];
    [mutableDict setValue:[self.picture dictionaryRepresentation] forKey:kLoginUserInfoUserPicture];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inited] forKey:kLoginUserInfoUserInited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.highpressure] forKey:kLoginUserInfoUserHighpressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.role] forKey:kLoginUserInfoUserRole];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kLoginUserInfoUserSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lowpressure] forKey:kLoginUserInfoUserLowpressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.headPictureId] forKey:kLoginUserInfoUserHeadPictureId];
    [mutableDict setValue:self.area forKey:kLoginUserInfoUserArea];
    [mutableDict setValue:self.source forKey:kLoginUserInfoUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.birthday] forKey:kLoginUserInfoUserBirthday];
    [mutableDict setValue:self.name forKey:kLoginUserInfoUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsType] forKey:kLoginUserInfoUserBsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kLoginUserInfoUserHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sickage] forKey:kLoginUserInfoUserSickage];
    [mutableDict setValue:self.wechatOpenid forKey:kLoginUserInfoUserWechatOpenid];
    [mutableDict setValue:self.status forKey:kLoginUserInfoUserStatus];
    [mutableDict setValue:self.city forKey:kLoginUserInfoUserCity];
    [mutableDict setValue:self.mobile forKey:kLoginUserInfoUserMobile];
    [mutableDict setValue:self.province forKey:kLoginUserInfoUserProvince];
    [mutableDict setValue:self.iconUrl forKey:kLoginUserInfoUserIconUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kLoginUserInfoUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kLoginUserInfoUserModifyTime];
    [mutableDict setValue:self.unionId forKey:kLoginUserInfoUserUnionId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bsInited] forKey:kLoginUserInfoUserBsInited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kLoginUserInfoUserWeight];

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

    self.devicetoken = [aDecoder decodeObjectForKey:kLoginUserInfoUserDevicetoken];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kLoginUserInfoUserId];
    self.operation = [aDecoder decodeObjectForKey:kLoginUserInfoUserOperation];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kLoginUserInfoUserLastLoginTime];
    self.bsSikeage = [aDecoder decodeDoubleForKey:kLoginUserInfoUserBsSikeage];
    self.address = [aDecoder decodeObjectForKey:kLoginUserInfoUserAddress];
    self.bsVersion = [aDecoder decodeObjectForKey:kLoginUserInfoUserBsVersion];
    self.version = [aDecoder decodeObjectForKey:kLoginUserInfoUserVersion];
    self.picture = [aDecoder decodeObjectForKey:kLoginUserInfoUserPicture];
    self.inited = [aDecoder decodeDoubleForKey:kLoginUserInfoUserInited];
    self.highpressure = [aDecoder decodeDoubleForKey:kLoginUserInfoUserHighpressure];
    self.role = [aDecoder decodeDoubleForKey:kLoginUserInfoUserRole];
    self.sex = [aDecoder decodeDoubleForKey:kLoginUserInfoUserSex];
    self.lowpressure = [aDecoder decodeDoubleForKey:kLoginUserInfoUserLowpressure];
    self.headPictureId = [aDecoder decodeDoubleForKey:kLoginUserInfoUserHeadPictureId];
    self.area = [aDecoder decodeObjectForKey:kLoginUserInfoUserArea];
    self.source = [aDecoder decodeObjectForKey:kLoginUserInfoUserSource];
    self.birthday = [aDecoder decodeDoubleForKey:kLoginUserInfoUserBirthday];
    self.name = [aDecoder decodeObjectForKey:kLoginUserInfoUserName];
    self.bsType = [aDecoder decodeDoubleForKey:kLoginUserInfoUserBsType];
    self.height = [aDecoder decodeDoubleForKey:kLoginUserInfoUserHeight];
    self.sickage = [aDecoder decodeDoubleForKey:kLoginUserInfoUserSickage];
    self.wechatOpenid = [aDecoder decodeObjectForKey:kLoginUserInfoUserWechatOpenid];
    self.status = [aDecoder decodeObjectForKey:kLoginUserInfoUserStatus];
    self.city = [aDecoder decodeObjectForKey:kLoginUserInfoUserCity];
    self.mobile = [aDecoder decodeObjectForKey:kLoginUserInfoUserMobile];
    self.province = [aDecoder decodeObjectForKey:kLoginUserInfoUserProvince];
    self.iconUrl = [aDecoder decodeObjectForKey:kLoginUserInfoUserIconUrl];
    self.createTime = [aDecoder decodeDoubleForKey:kLoginUserInfoUserCreateTime];
    self.modifyTime = [aDecoder decodeDoubleForKey:kLoginUserInfoUserModifyTime];
    self.unionId = [aDecoder decodeObjectForKey:kLoginUserInfoUserUnionId];
    self.bsInited = [aDecoder decodeDoubleForKey:kLoginUserInfoUserBsInited];
    self.weight = [aDecoder decodeDoubleForKey:kLoginUserInfoUserWeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_devicetoken forKey:kLoginUserInfoUserDevicetoken];
    [aCoder encodeDouble:_userIdentifier forKey:kLoginUserInfoUserId];
    [aCoder encodeObject:_operation forKey:kLoginUserInfoUserOperation];
    [aCoder encodeDouble:_lastLoginTime forKey:kLoginUserInfoUserLastLoginTime];
    [aCoder encodeDouble:_bsSikeage forKey:kLoginUserInfoUserBsSikeage];
    [aCoder encodeObject:_address forKey:kLoginUserInfoUserAddress];
    [aCoder encodeObject:_bsVersion forKey:kLoginUserInfoUserBsVersion];
    [aCoder encodeObject:_version forKey:kLoginUserInfoUserVersion];
    [aCoder encodeObject:_picture forKey:kLoginUserInfoUserPicture];
    [aCoder encodeDouble:_inited forKey:kLoginUserInfoUserInited];
    [aCoder encodeDouble:_highpressure forKey:kLoginUserInfoUserHighpressure];
    [aCoder encodeDouble:_role forKey:kLoginUserInfoUserRole];
    [aCoder encodeDouble:_sex forKey:kLoginUserInfoUserSex];
    [aCoder encodeDouble:_lowpressure forKey:kLoginUserInfoUserLowpressure];
    [aCoder encodeDouble:_headPictureId forKey:kLoginUserInfoUserHeadPictureId];
    [aCoder encodeObject:_area forKey:kLoginUserInfoUserArea];
    [aCoder encodeObject:_source forKey:kLoginUserInfoUserSource];
    [aCoder encodeDouble:_birthday forKey:kLoginUserInfoUserBirthday];
    [aCoder encodeObject:_name forKey:kLoginUserInfoUserName];
    [aCoder encodeDouble:_bsType forKey:kLoginUserInfoUserBsType];
    [aCoder encodeDouble:_height forKey:kLoginUserInfoUserHeight];
    [aCoder encodeDouble:_sickage forKey:kLoginUserInfoUserSickage];
    [aCoder encodeObject:_wechatOpenid forKey:kLoginUserInfoUserWechatOpenid];
    [aCoder encodeObject:_status forKey:kLoginUserInfoUserStatus];
    [aCoder encodeObject:_city forKey:kLoginUserInfoUserCity];
    [aCoder encodeObject:_mobile forKey:kLoginUserInfoUserMobile];
    [aCoder encodeObject:_province forKey:kLoginUserInfoUserProvince];
    [aCoder encodeObject:_iconUrl forKey:kLoginUserInfoUserIconUrl];
    [aCoder encodeDouble:_createTime forKey:kLoginUserInfoUserCreateTime];
    [aCoder encodeDouble:_modifyTime forKey:kLoginUserInfoUserModifyTime];
    [aCoder encodeObject:_unionId forKey:kLoginUserInfoUserUnionId];
    [aCoder encodeDouble:_bsInited forKey:kLoginUserInfoUserBsInited];
    [aCoder encodeDouble:_weight forKey:kLoginUserInfoUserWeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginUserInfoUser *copy = [[LoginUserInfoUser alloc] init];
    
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
