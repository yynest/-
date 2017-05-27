//
//  HomeIndexData.h
//
//  Created by iosdev  on 2017/5/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeIndexBsRecord, HomeIndexUser, HomeIndexBsStatistics;

@interface HomeIndexData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HomeIndexBsRecord *bsRecord;
@property (nonatomic, strong) HomeIndexUser *user;
@property (nonatomic, strong) HomeIndexBsStatistics *bsStatistics;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
