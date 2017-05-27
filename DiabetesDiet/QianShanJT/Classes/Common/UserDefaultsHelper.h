//
//  UserDefaultsHelper.h
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsHelper : NSObject

//设置为默认值
+ (void)resetUserDefaults;
+ (void)clearUserDefaults;

//用户id数据
+ (void)setLoginUserID:(NSNumber *)strID;
+ (NSNumber *)getLoginUserID;

+ (void)setjobNumber:(NSNumber *)strID;
+ (NSNumber *)getjobNumber;

+ (void)setLoginUserMobile:(NSString *)str;
+ (NSString *)getLoginUserMobile;

//是否已录入初始化信息，没有:0,已录入:1,默认:2
+ (void)setIsInitInfo:(NSInteger)isInit;
+ (NSInteger)getIsInitInfo;

//录入初始化信息
+ (void)setInitInfoValues:(NSDictionary *)values;
+ (NSDictionary *)getInitInfoValues;


//高危保护的简介展示状态
+ (void)setRiskEmergencyShowState:(BOOL)isShow;
+ (BOOL)getRiskEmergencyShowState;

//tts设置
+ (void)setVoiceRemindState:(BOOL)isOpen;
+ (BOOL)getVoiceRemindState;

//绑定设备
+ (void)setBindBloodPressureMeterID:(NSString *)bindID;
+ (NSString *)getBindBloodPressureMeterID;

//绑定智能手机
+ (void)setBindSmartWatchID:(NSString *)bindID;
+ (NSString *)getBindSmartWatchID;

//用药提醒的开关
+ (void)setMedicineRemindId:(NSNumber *)remindId open:(BOOL)isOpen;
+ (BOOL)getMedicineRemindId:(NSNumber *) remindId;

//用药提醒数据同步标识
+ (void)setMedicineRemindSynchronization:(BOOL)isSynchronization;
+ (BOOL)getMedicineRemindSynchronization;

//本地数据删除的标识
+ (void)setLocalDeleteMedicineRemind:(NSNumber *)createTime;
+ (BOOL)getLocalDeleteTypeMedicineRemind:(NSNumber *)createTime;

//数据缓存
+ (void)addLocalCacheBloodData:(NSDictionary *)bloodData;
+ (NSArray *)getAllLocalCacheBloodDatas;
+ (void)clearLocalCacheBloodData;
+ (NSInteger)getLocalCacheBloodDatasCount;

//内外标识：内网-NO,外网-YES,默认为NO;
+ (void)setNetworkType:(NSNumber *)type;
+ (NSNumber *)getNetworkType;

//token
+(void)setAccessToken:(NSString *)accessToken;
+(NSString *)getAccessToken;

//refreshtoken
+(void)setRefreshToken:(NSString *)refreshtoken;
+(NSString *)getRefreshToken;
@end
