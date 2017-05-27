//
//  UserDefaultsHelper.m
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "UserDefaultsHelper.h"

#define USER_DEFALTS [NSUserDefaults standardUserDefaults]

@implementation UserDefaultsHelper


//设置为默认值
+ (void)resetUserDefaults {
    [UserDefaultsHelper setVoiceRemindState:YES];
    [UserDefaultsHelper setIsInitInfo:2];
    [UserDefaultsHelper setRiskEmergencyShowState:NO];
}

+ (void)clearUserDefaults {
    [UserDefaultsHelper setLoginUserID:nil];
    [UserDefaultsHelper setIsInitInfo:2];
    [UserDefaultsHelper setInitInfoValues:nil];

    [UserDefaultsHelper setAccessToken:nil];
    [UserDefaultsHelper setRefreshToken:nil];
}

//用户id数据
+ (void)setLoginUserID:(NSNumber *)strID {
    [USER_DEFALTS setObject:strID forKey:@"LoginUserID"];
}
+ (NSNumber *)getLoginUserID {
    return [USER_DEFALTS objectForKey:@"LoginUserID"];
}
+ (void)setjobNumber:(NSNumber *)strID {
    [USER_DEFALTS setObject:strID forKey:@"jobNumber"];
}
+ (NSNumber *)getjobNumber{
    return [USER_DEFALTS objectForKey:@"jobNumber"];
}
+ (void)setLoginUserMobile:(NSString *)str {
    [USER_DEFALTS setObject:str forKey:@"LoginUserMobile"];
}
+ (NSString *)getLoginUserMobile {
    return [USER_DEFALTS objectForKey:@"LoginUserMobile"];
}

//是否已录入初始化信息
+ (void)setIsInitInfo:(NSInteger)isInit {
    [USER_DEFALTS setInteger:isInit forKey:@"IsInitInfo"];
}
+ (NSInteger)getIsInitInfo {
    return [USER_DEFALTS integerForKey:@"IsInitInfo"];
}

//录入初始化信息
+ (void)setInitInfoValues:(NSDictionary *)values {
    [USER_DEFALTS setObject:values forKey:@"InitInfoValues"];
}
+ (NSDictionary *)getInitInfoValues {
    return [USER_DEFALTS objectForKey:@"InitInfoValues"];
}

//高危保护的简介展示状态
+ (void)setRiskEmergencyShowState:(BOOL)isShow {
    [USER_DEFALTS setBool:isShow forKey:@"RiskEmergencyShowState"];
}
+ (BOOL)getRiskEmergencyShowState {
    return [USER_DEFALTS boolForKey:@"RiskEmergencyShowState"];
}

//tts设置
+ (void)setVoiceRemindState:(BOOL)isOpen {
    [USER_DEFALTS setBool:isOpen forKey:@"voiceSetting"];
}
+ (BOOL)getVoiceRemindState {
    return [USER_DEFALTS boolForKey:@"voiceSetting"];
}

//绑定设备
+ (void)setBindBloodPressureMeterID:(NSString *)bindID {
    [USER_DEFALTS setObject:bindID forKey:@"BindBloodPressureMeterID"];
}
+ (NSString *)getBindBloodPressureMeterID {
    return [USER_DEFALTS objectForKey:@"BindBloodPressureMeterID"];
}

//绑定智能手机
+ (void)setBindSmartWatchID:(NSString *)bindID {
    [USER_DEFALTS setObject:bindID forKey:@"BindSmartWatchID"];
}
+ (NSString *)getBindSmartWatchID {
    return [USER_DEFALTS objectForKey:@"BindSmartWatchID"];
}

//用药提醒的开关
+ (void)setMedicineRemindId:(NSNumber *)remindId open:(BOOL)isOpen {
    NSDictionary *dic = [USER_DEFALTS objectForKey:@"MedicineRemind"];
    NSMutableDictionary *dicTemp = [[NSMutableDictionary alloc] initWithDictionary:dic];
    NSString *key = [NSString stringWithFormat:@"%@",remindId];
    if (isOpen) {
        [dicTemp setObject:[NSNumber numberWithBool:isOpen] forKey:key];
    }
    else {
        [dicTemp removeObjectForKey:key];
    }
    [USER_DEFALTS setObject:dicTemp forKey:@"MedicineRemind"];
}
+ (BOOL)getMedicineRemindId:(NSNumber *) remindId{
    NSDictionary *dic = [USER_DEFALTS objectForKey:@"MedicineRemind"];
    NSObject *obj =  [dic objectForKey:[NSString stringWithFormat:@"%@",remindId]];
    if (obj) {
        return YES;
    }else{
        return NO;
    }
}

//用药提醒数据同步标识
+ (void)setMedicineRemindSynchronization:(BOOL)isSynchronization {
    [USER_DEFALTS setBool:isSynchronization forKey:@"MedicineRemindSynchronization"];
}
+ (BOOL)getMedicineRemindSynchronization {
    return [USER_DEFALTS boolForKey:@"MedicineRemindSynchronization"];
}

//本地数据删除的标识
+ (void)setLocalDeleteMedicineRemind:(NSNumber *)createTime {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[USER_DEFALTS objectForKey:@"LocalDeleteMedicineRemind"]];
    if (![array containsObject:createTime]) {
        [array addObject:createTime];
        [USER_DEFALTS setObject:array forKey:@"LocalDeleteMedicineRemind"];
    }
}
+ (BOOL)getLocalDeleteTypeMedicineRemind:(NSNumber *)createTime {
    NSArray *array = [USER_DEFALTS objectForKey:@"LocalDeleteMedicineRemind"];
    BOOL contain = [array containsObject:createTime];
    return contain;
}

//血压数据缓存
+ (void)addLocalCacheBloodData:(NSDictionary *)bloodData {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[USER_DEFALTS objectForKey:@"LocalCacheBloodData"]];
    if (![array containsObject:bloodData]) {
        [array addObject:bloodData];
        [USER_DEFALTS setObject:array forKey:@"LocalCacheBloodData"];
    }
}
+ (NSArray *)getAllLocalCacheBloodDatas {
    NSArray *array = [USER_DEFALTS objectForKey:@"LocalCacheBloodData"];
    return array;
}
+ (void)clearLocalCacheBloodData {
    [USER_DEFALTS setObject:nil forKey:@"LocalCacheBloodData"];
}
+ (NSInteger)getLocalCacheBloodDatasCount {
    NSArray *array = [USER_DEFALTS objectForKey:@"LocalCacheBloodData"];
    return array.count;
}

//内外标识：内网-0,外网-1 正式环境-2
+ (void)setNetworkType:(NSNumber *)type {
    [USER_DEFALTS setObject:type forKey:@"NetworkType"];
}
+ (NSNumber *)getNetworkType {
    return [USER_DEFALTS objectForKey:@"NetworkType"];
}

//token
+(void)setAccessToken:(NSString *)accessToken{
    [USER_DEFALTS setObject:accessToken forKey:@"accessToken"];
}
+(NSString *)getAccessToken{
    return [USER_DEFALTS objectForKey:@"accessToken"];
}

//refreshtoken
+(void)setRefreshToken:(NSString *)refreshtoken{
    [USER_DEFALTS setObject:refreshtoken forKey:@"refreshtoken"];
}
+(NSString *)getRefreshToken{
    return [USER_DEFALTS objectForKey:@"refreshtoken"];
}
@end
