//
//  HomeIndexUser.h
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeIndexPicture;

@interface HomeIndexUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *devicetoken;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *operation;
@property (nonatomic, assign) double lastLoginTime;
@property (nonatomic, assign) double bsSikeage;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *bsVersion;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) HomeIndexPicture *picture;
@property (nonatomic, assign) double inited;
@property (nonatomic, assign) double highpressure;
@property (nonatomic, assign) double role;
@property (nonatomic, assign) double sex;
@property (nonatomic, assign) double lowpressure;
@property (nonatomic, assign) double headPictureId;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double birthday;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double bsType;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double sickage;
@property (nonatomic, strong) NSString *wechatOpenid;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double modifyTime;
@property (nonatomic, strong) NSString *unionId;
@property (nonatomic, assign) double bsInited;
@property (nonatomic, assign) double weight;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
