//
//  QNManager.m
//  QianShanJY
//
//  Created by iosdev on 2017/3/24.
//  Copyright © 2017年 chinasun. All rights reserved.
//

#import "QNManager.h"
#import "QSBaseRequest.h"

@interface QNManager () {
    NSString *token;
    NSString *filePath;
    NSString *fileName;
    NSString *imageDomain;
    
    QNUploadManager *uploadManager;
    QNUploadOption *uploadOption;
}

@end

@implementation QNManager

+ (instancetype)sharedInstance {
    static QNManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        uploadManager = [[QNUploadManager alloc] init];
        uploadOption = [[QNUploadOption alloc] initWithMime:nil progressHandler:^(NSString *key, float percent) {
            DLog(@"percent == %.2f", percent);
        }
                                                     params:nil
                                                   checkCrc:NO
                                         cancellationSignal:nil];
    }
    return self;
}

//从服务端SDK获取token
//uploadType (string, optional): 上传类型 0 im聊天 1 头像 2 用户建议图片
- (void)getQNCloudTokenWithUploadType:(NSString *)type complete:(nullable void(^)(BOOL isSuccess ))cHandler{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:type forKey:@"uploadType"];
    NSString *url = @"/user/qnconfig";
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSDictionary *dic = [request.responseJSONObject objectForKey:@"data"];
        NSUInteger error = [[dic objectForKey:@"errCode"] integerValue];
        if (error == 0) {
            token = [[NSString alloc] initWithString:[dic objectForKey:@"token"]];
            filePath = [[NSString alloc] initWithString:[dic objectForKey:@"filePath"]];
            fileName = [[NSString alloc] initWithString:[dic objectForKey:@"fileName"]];
            imageDomain = [[NSString alloc] initWithString:[dic objectForKey:@"imageDomain"]];
            if (token&&filePath&&fileName) {
                cHandler(YES);
            }
        }
        else{
            [SVProgressHUD showInfoWithStatus:[request.responseJSONObject objectForKey:@"errMsg"]];
            DLog(@"接口(%@)fail data",url);
        }
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
    }];
}

- (void)putDataType:(NSString *)type
               data:(NSData *_Nullable)data
             suffix:(NSString *_Nullable)suffix
           complete:(nullable void(^)(BOOL isSuccess,NSString * _Nullable path))cHandler {
    
    [self getQNCloudTokenWithUploadType:type complete:^(BOOL isSuccess){
        if (isSuccess) {

            NSString *name = [NSString stringWithFormat:@"%@%@%0.f.%@",filePath,fileName,[NSDate timeIntervalSinceReferenceDate],suffix];
            [uploadManager putData:data
                               key:name
                             token:token
                          complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                             
                              BOOL isSucc = YES;
                              if (!resp) {
                                  isSucc = NO;
                              }
                              NSString *URLPath = [NSString stringWithFormat:@"%@/%@",imageDomain,key];
                              cHandler(isSucc,URLPath);
                          }
                            option:uploadOption];}
    }];
}

- (void)putFileType:(NSString *_Nullable)type
               file:(NSString *_Nullable)file
             suffix:(NSString *_Nullable)suffix
           complete:(nullable void(^)(BOOL isSuccess,NSString *_Nullable path))cHandler {
    [self getQNCloudTokenWithUploadType:type complete:^(BOOL isSuccess){
        if (isSuccess) {
            [self performSelectorOnMainThread:@selector(showSVP) withObject:self waitUntilDone:NO];
            NSString *name = [NSString stringWithFormat:@"%@%@%0.f.%@",filePath,fileName,[NSDate timeIntervalSinceReferenceDate],suffix];
            [uploadManager putFile:file
                               key:name
                             token:token
                          complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                              BOOL isSucc = YES;
                              if (!resp) {
                                  isSucc = NO;
                              }
                              [SVProgressHUD dismiss];
                              NSString *URLPath = [NSString stringWithFormat:@"%@/%@",imageDomain,key];
                              cHandler(isSucc,URLPath);
                          }
                            option:uploadOption];}
    }];
}

- (void)showSVP {
    [SVProgressHUD showWithStatus:@"图片发送中"];
}

@end
