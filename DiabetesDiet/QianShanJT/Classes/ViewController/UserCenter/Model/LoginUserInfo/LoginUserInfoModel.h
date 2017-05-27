//
//  LoginUserInfoModel.h
//
//  Created by iosdev  on 2017/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginUserInfoData;

@interface LoginUserInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double errCode;
@property (nonatomic, strong) NSString *errMsg;
@property (nonatomic, strong) LoginUserInfoData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
