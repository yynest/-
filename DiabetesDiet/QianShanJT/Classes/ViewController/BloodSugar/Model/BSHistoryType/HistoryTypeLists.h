//
//  HistoryTypeLists.h
//
//  Created by iosdev  on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HistoryTypeLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listsIdentifier;
@property (nonatomic, strong) NSString *timeType;
@property (nonatomic, assign) double state;
@property (nonatomic, assign) double bsValue;
@property (nonatomic, assign) id recordType;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *bsResult;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, assign) double recordTime;
@property (nonatomic, strong) NSString *bsResultRemark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
