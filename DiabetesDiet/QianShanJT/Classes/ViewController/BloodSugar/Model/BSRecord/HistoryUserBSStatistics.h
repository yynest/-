//
//  HistoryUserBSStatistics.h
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HistoryUserBSStatistics : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, assign) double lowCount;
@property (nonatomic, assign) double normalCount;
@property (nonatomic, assign) double heightCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
