//
//  UserInfoService.m
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "UserInfoService.h"
#import "UserDefaultsHelper.h"
#import "QSBaseRequest.h"
#import "LoginViewController.h"
#import "CustomNavigationController.h"
#import "ArchiverDataService.h"
#import "YYMonitorNetwork.h"

#import "UserInfoModel.h"
#import "UserInfoData.h"
#import "UserInfoUser.h"
#import "UserInfoPicture.h"
#import "HomeIndexData.h"
#import "HomeIndexModel.h"

#import "HistoryModel.h"
#import "HistoryData.h"
#import "HistoryBsDates.h"
#import "HistoryUserBSStatistics.h"

#define ARCHICER_USERINFO @"archicer_userInfo"
#define ARCHICER_HOMEINDEX @"archicer_homeIndex"
#define ARCHICER_HISTORY @"archicer_historyData"

@interface UserInfoService (){
    NSMutableArray *historyAllDataTemp;
}

@end


@implementation UserInfoService

+ (instancetype)sharedInstance {
    static UserInfoService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _userId = [UserDefaultsHelper getLoginUserID];
        [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(logOut:) name:@"logout" object:nil];
        
    }
    return self;
}


-(UIImage *)headerImage{

    if (!_headerImage) {
        NSString *urlString = [NSString stringWithFormat:@"%@%@%@",self.userInfo.picture.path,self.userInfo.picture.name,self.userInfo.picture.suffix ];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:urlString]];
        UIImage *image = [UIImage imageWithData:data]; // 取得图片
        _headerImage = image;
    }
    return _headerImage;
}

- (NSNumber *)userId {
    if (!_userId) {
        _userId = [UserDefaultsHelper getLoginUserID];
    }
    return _userId;
}

- (NSString *)headerUrl {
    if (!_headerUrl) {
        _headerUrl = [NSString stringWithFormat:@"%@%@%@",self.userInfo.picture.path,self.userInfo.picture.name,self.userInfo.picture.suffix];
    }
    return _headerUrl;
}

// 注销后清空用户所有数据
- (void)clearAllData {
    self.userId = nil;
    self.userInfo = nil;
    self.headerImage = nil;
    [UserDefaultsHelper clearUserDefaults];
    [ArchiverDataService clearArchiverData];
}

//保存数据
- (void)saveNetworkData:(id)modelData fileName:(NSString*)fileName {
    [ArchiverDataService saveNetworkData:modelData fileName:fileName];
    
//    id modelData1 = [self loadNetworkDataFileName:fileName];
//    [ArchiverDataService clearArchiverData];
//    id modelData2 = [self loadNetworkDataFileName:fileName];
}

//得到缓存数据
- (id)loadNetworkDataFileName:(NSString*)fileName {
    return [ArchiverDataService loadNetworkDataFileName:fileName];
}

//刷新token
-(void)requestRefreshTokenWithSuccessBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:[UserDefaultsHelper getRefreshToken] forKey:@"refreshToken"];
    QSBaseRequest* api = [[QSBaseRequest alloc] initWithNOIdRequestURL:@"/user/refresh/token" parameter:dic];
    __weak __typeof(self)weakSelf = self;
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        // __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSDictionary *dic = (NSDictionary *)request.responseJSONObject;
        NSInteger errCode = request.responseStatusCode;
        if(errCode == 0) {
            //保存token
            NSDictionary *tokenMsg = [[dic objectForKey:@"data"] objectForKey:@"tokenMsg"];
            [UserDefaultsHelper setAccessToken:[NSString stringWithFormat:@"%@ %@", [tokenMsg objectForKey:@"token_type"], [tokenMsg objectForKey:@"access_token"]]];
            [UserDefaultsHelper setRefreshToken:[tokenMsg objectForKey:@"refresh_token"]];
            successBlock();
        }
        else {
            [weakSelf showAlert:request.responseStatusString];
            failureBlock();
        }
    } failure:^(QSBaseRequest *request) {
        [weakSelf showAlert:request.responseStatusString];
        failureBlock();
    }];
}

-(void)showAlert:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *bt_ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
                                                      [self clickedOKEvent];
                                                  }];
    [alertController addAction:bt_ok];
    alertController.view.tintColor = [UIColor colorMainGreen];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

-(void)clickedOKEvent{
    [[UserInfoService sharedInstance] clearAllData];
    CustomNavigationController *navi = [[CustomNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    navi.navigationBarHidden = YES;
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:navi];
}

-(void)logOut:(NSNotification *)noti{
    NSMutableDictionary *dic = (NSMutableDictionary *)noti.userInfo;
    [self showAlert:[dic objectForKey:@"message"]];
}


//查询个人资料
- (void)requestUserInfoWithSuccessBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock{
    if (!self.userInfo) {
        id modelData = [self loadNetworkDataFileName:ARCHICER_USERINFO];
        if ([modelData isKindOfClass:[UserInfoUser class]]) {
            self.userInfo = (UserInfoUser *)modelData;
        }
    }
    //有缓存，先展示，再请求接口，成功后刷新数据和界面
    if (self.userInfo) {
        successBlock();
    }
    
    __weak __typeof(self)weakSelf = self;
    //请求
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *url = @"/user/info/get";
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            UserInfoModel *model = [UserInfoModel modelObjectWithDictionary:request.responseJSONObject];
            DLog(@"接口数据:%@",model);
            strongSelf.userInfo = model.data.user;
            //本地保存
            [strongSelf saveNetworkData:strongSelf.userInfo fileName:ARCHICER_USERINFO];
            successBlock();
        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
            failureBlock();
        }
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
        failureBlock();
    }];
}

//查询首页数据
- (void)requestHomeIndexWithSuccessBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock{
    if (!self.homeIndexData) {
        id modelData = [self loadNetworkDataFileName:ARCHICER_HOMEINDEX];
        if ([modelData isKindOfClass:[HomeIndexData class]]) {
            self.homeIndexData = (HomeIndexData *)modelData;
        }
    }
    //有缓存，先展示，再请求接口，成功后刷新数据和界面
    if (self.homeIndexData) {
        successBlock();
    }
    
    __weak __typeof(self)weakSelf = self;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    NSString *url = @"/home/index";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSUInteger error = request.responseStatusCode;
        DLog(@"%@",request.responseJSONObject);
        if (error == 0) {
            //处理数据
            HomeIndexModel *model =  [HomeIndexModel modelObjectWithDictionary:request.responseJSONObject];
            DLog(@"接口数据:%@",model);
            strongSelf.homeIndexData = model.data;
            //本地保存
            [strongSelf saveNetworkData:strongSelf.homeIndexData fileName:ARCHICER_HOMEINDEX];
            successBlock();

        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
              failureBlock();
        }
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
          failureBlock();
    }];
}


//查询血糖历史记录数据信息
- (void)requestHistoryWithPageNum:(int)pageNum successBlock:(void (^)())successBlock failureBlock:(void (^)())failureBlock {
    if (!historyAllDataTemp) {
        self.historyAllData = [[NSMutableArray alloc] init];
        historyAllDataTemp = [[NSMutableArray alloc] init];
    }
    //只缓存第一页数据
    if (pageNum == 0) {
        id modelData = [self loadNetworkDataFileName:ARCHICER_HISTORY];
        if ([modelData isKindOfClass:[HistoryData class]]) {
            HistoryData *data = (HistoryData *)modelData;
            [self.historyAllData removeAllObjects];
            [self.historyAllData addObjectsFromArray:[self dealHistoryData:data.bsDates]];
            self.historyStatistics = data.userBSStatistics;
        }
    }
    //有缓存，先展示，再请求接口，成功后刷新数据和界面
    if (self.historyAllData.count > 0) {
        successBlock();
    }
    
    __weak __typeof(self)weakSelf = self;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:[NSNumber numberWithInt:pageNum] forKey:@"pageNum"];
    [dic sf_setObject:[NSNumber numberWithInt:20] forKey:@"pageSize"];
    NSString *url = @"/bsrecord/queryview";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSUInteger error = request.responseStatusCode;
        DLog(@"%@",request.responseJSONObject);
        if (error == 0) {
            //处理数据
            HistoryModel *model = [HistoryModel modelObjectWithDictionary:request.responseJSONObject];
            DLog(@"接口数据:%@",model);
            if (pageNum == 0) {
                [strongSelf.historyAllData removeAllObjects];
                [historyAllDataTemp removeAllObjects];
            }
    
            [strongSelf.historyAllData addObjectsFromArray:[self dealHistoryData:model.data.bsDates]];
            self.historyStatistics = model.data.userBSStatistics;
            //本地保存:只缓存第一页数据
            if (pageNum == 0) {
                [strongSelf saveNetworkData:model.data fileName:ARCHICER_HISTORY];
            }
            successBlock();
        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
            failureBlock();
        }
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
        failureBlock();
    }];
}
//处理数据
- (NSArray *)dealHistoryData:(NSArray *)modelData {
    [historyAllDataTemp addObject:modelData];
    NSMutableArray *tempAll = [[NSMutableArray alloc] init];
    NSMutableArray *tempMonth = [[NSMutableArray alloc] init];
    
    NSString *lastTime;
    NSString *curMonth;
    for (HistoryBsDates *historyDate in modelData) {
        if (!lastTime || !curMonth) {
            lastTime = historyDate.dateTime;
            curMonth = [historyDate.dateTime substringToIndex:7];
        }
        
        //添加时间间隔
        NSDate *lastDate = [NSDate dateFromString:lastTime format:@"yyyy-MM-dd"];
        NSDate *curDate = [NSDate dateFromString:historyDate.dateTime format:@"yyyy-MM-dd"];
        int day = [NSDate dateTimeDifferenceWithType:2 StartTime:lastDate endTime:curDate]-1;
        if (day>0) {
            NSString *tip = [NSString stringWithFormat:@"%d天未测",day];
            [tempMonth addObject:tip];
        }
        //血糖数据
        if ([curMonth isEqualToString:[historyDate.dateTime substringToIndex:7]]) {
            [tempMonth addObject:historyDate];
        }
        else {
            //另一月了，添加上一个月的
            [tempAll addObject:[tempMonth copy]];
            [tempMonth removeAllObjects];
            //这个月的
            curMonth = [historyDate.dateTime substringToIndex:7];
            [tempMonth addObject:historyDate];
        }
        
        lastTime = historyDate.dateTime;
    }
    [tempAll addObject:tempMonth];
    
    return tempAll;
}



@end
