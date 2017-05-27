//
//  LoginUserInfoPicture.h
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoginUserInfoPicture : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, assign) double uploadTime;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double pictureIdentifier;
@property (nonatomic, strong) NSString *md5;
@property (nonatomic, assign) double width;
@property (nonatomic, assign) double size;
@property (nonatomic, assign) double userId;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
