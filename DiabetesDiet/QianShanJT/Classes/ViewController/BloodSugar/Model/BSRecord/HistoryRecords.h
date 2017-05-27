//
//  HistoryRecords.h
//
//  Created by iosdev  on 2017/5/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HistoryRecords : NSObject <NSCoding, NSCopying>

/*
 bsResult (string, optional): 血糖结果 1 低血糖 2 血糖偏低 3 正常血糖 4 血糖偏高 ,
 bsResultRemark (string, optional): 结果描述 ,
 bsValue (number, optional): 血糖数据 ,
 createTime (string, optional),
 id (integer, optional): id ,
 lat (string, optional): 纬度 ,
 lng (string, optional): 经度 ,
 recordTime (string, optional): 记录时间 ,
 state (integer, optional),
 sumRecords (integer, optional),
 timeType (string, optional): 时间类型 1 凌晨前 2 早餐前 3 早餐后 4 午餐前 5 午餐后 6 晚餐前 7 晚餐后 8 睡前 ,
 userId (integer, optional): 用户编码
 */

@property (nonatomic, assign) double recordsIdentifier;
@property (nonatomic, strong) NSString *timeType;
@property (nonatomic, assign) double state;
@property (nonatomic, assign) double bsValue;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double sumRecords;
@property (nonatomic, strong) NSString *bsResult;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, assign) double recordTime;
@property (nonatomic, strong) NSString *bsResultRemark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
