//
//  HomeIndexModel.h
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeIndexData;

@interface HomeIndexModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double errCode;
@property (nonatomic, strong) NSString *errMsg;
@property (nonatomic, strong) HomeIndexData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
