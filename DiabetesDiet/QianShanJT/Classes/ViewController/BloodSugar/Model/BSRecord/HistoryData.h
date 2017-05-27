//
//  HistoryData.h
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HistoryUserBSStatistics;

@interface HistoryData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *bsDates;
@property (nonatomic, strong) HistoryUserBSStatistics *userBSStatistics;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
