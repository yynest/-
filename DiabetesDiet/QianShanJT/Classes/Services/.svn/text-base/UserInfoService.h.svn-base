//
//  UserInfoService.h
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoUser;
@class HomeIndexData;
@class HistoryUserBSStatistics;
@interface UserInfoService : NSObject

//user id
@property (nonatomic, strong) NSNumber *userId;
//基本资料
@property (nonatomic, strong) UserInfoUser *userInfo;
//首页数据
@property (nonatomic, strong) HomeIndexData *homeIndexData;

@property (nonatomic, strong) UIImage *headerImage;
//用户头像
@property (nonatomic, strong) NSString *headerUrl;
//血糖历史记录数据
@property (nonatomic, strong) HistoryUserBSStatistics *historyStatistics;
@property (nonatomic, strong) NSMutableArray *historyAllData;


+ (instancetype)sharedInstance;

// 注销后清空所有数据
- (void)clearAllData;

//刷新token
-(void)requestRefreshTokenWithSuccessBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock;

//查询个人资料
- (void)requestUserInfoWithSuccessBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock;

//查询首页数据
- (void)requestHomeIndexWithSuccessBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock;

//查询血糖历史记录数据信息
- (void)requestHistoryWithPageNum:(int)pageNum successBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock;



@end
