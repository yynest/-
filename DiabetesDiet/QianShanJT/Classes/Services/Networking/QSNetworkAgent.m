//
//  QSNetworkAgent.m
//  QianShanJY
//
//  Created by Jim on 15/9/11.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "QSNetworkAgent.h"
#import "QSNetworkConfig.h"
#import "QSNetworkPrivate.h"
#import "MD5Encrypt.h"
#import "YYMonitorNetwork.h"

#import "UserInfoService.h"

@implementation QSNetworkAgent {
    AFHTTPSessionManager *_manager;
    QSNetworkConfig *_config;
    NSMutableDictionary *_requestsRecord;
}

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [QSNetworkConfig sharedInstance];
        _manager = [AFHTTPSessionManager manager];
        _requestsRecord = [NSMutableDictionary dictionary];
        _manager.operationQueue.maxConcurrentOperationCount = 4;
    }
    
    return self;
}

- (NSString *)buildRequestURL:(QSBaseRequest *)request
{
    NSString *detailURL = [request requestURL];
    if ([detailURL hasPrefix:@"http"]) {
        return detailURL;
    }
    
    NSString *baseURL;
    if ([request baseURL].length > 0) {
        baseURL = [request baseURL];
    }
    else {
        baseURL = [_config baseURL];
    }
    
    return [NSString stringWithFormat:@"%@%@", baseURL, detailURL];
}

- (void)addRequest:(QSBaseRequest *)request
{
    QSRequestMethod method = [request requestMethod];
    NSString *URL = [self buildRequestURL:request];
    
    // 组成请求参数
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithCapacity:2];
    //固定info
    NSNumber *timestamp = [self getTimestamp];
    NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithCapacity:5];
    NSNumber *userId = [NSNumber numberWithInteger:0];
    if ([UserInfoService sharedInstance].userId) {
        userId = [UserInfoService sharedInstance].userId;
    }
    [info sf_setObject:userId forKey:@"id"];
    [info sf_setObject:timestamp forKey:@"timestamp"];
    [info sf_setObject:[self getAppVersion] forKey:@"version"];
    [info sf_setObject:[self getOperationVersion] forKey:@"operation"];
    [info sf_setObject:[MD5Encrypt MD5:timestamp] forKey:@"sign"];
    [param sf_setObject:info forKey:@"info"];
    //传入参数
    [param sf_setObject:request.requestArgument forKey:@"data"];
    
    AFConstructingBlock constructingBlock = [request constructingBodyBlock];
    if (request.requestSerializerType == QSRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    else if (request.requestSerializerType == QSRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    //xiaomei
    NSString *token = [UserDefaultsHelper getAccessToken];
    if (token) {
        DLog(@"token:%@",token);
//        [_manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    }
    // If API needs server username and password
    NSArray *authorizationHeaderFieldArray = [request requestAuthorizationHeaderFieldArray];
    if (authorizationHeaderFieldArray != nil) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:(NSString *)authorizationHeaderFieldArray.firstObject
                                                                   password:(NSString *)authorizationHeaderFieldArray.lastObject];
    }
    
    // If API needs add custom value to HTTPHeaderField
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            }
            else {
                DLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    
    if (method == QSRequestMethodGet) {
        request.requestOperation = [_manager GET:URL
                                      parameters:param
                                        progress:nil
                                         success:^(NSURLSessionDataTask *operation, id responseObject) {
                                             [self handleRequestResult:operation responseJSON:responseObject responseError:nil];
                                         }
                                         failure:^(NSURLSessionDataTask *operation, NSError *error) {
                                             [self handleRequestResult:operation responseJSON:nil responseError:error];
        }];
    }
    else if (method == QSRequestMethodPost) {
        if (constructingBlock != nil) {
            NSString *jsonStr = [self DictionaryChangeToJSONString:param];

            
            NSString *specialURL = [NSString stringWithFormat:@"%@%@", URL, jsonStr];
            
            specialURL = [specialURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

            request.requestOperation = [_manager POST:specialURL
                                           parameters:param
                            constructingBodyWithBlock:constructingBlock
                                             progress:nil
                                              success:^(NSURLSessionDataTask *operation, id responseObject) {
                                                  [self handleRequestResult:operation responseJSON:responseObject responseError:nil];
                                              }
                                              failure:^(NSURLSessionDataTask *operation, NSError *error) {
                                                  [self handleRequestResult:operation responseJSON:nil responseError:error];
                                              }];
        }
        else {
            request.requestOperation = [_manager POST:URL
                                           parameters:param
                                              progress:nil
                                              success:^(NSURLSessionDataTask *operation, id responseObject) {
                                                  [self handleRequestResult:operation responseJSON:responseObject responseError:nil];
                                              }
                                              failure:^(NSURLSessionDataTask *operation, NSError *error) {
                                                  [self handleRequestResult:operation responseJSON:nil responseError:error];
                                              }];
        }
    }
    else {
        DLog(@"Error, unsupport method type");
        return;
    }
    
    DLog(@"Add request: %@", NSStringFromClass([request class]));
    [self addOperation:request];
}

//字典转json字符串
- (NSString *)DictionaryChangeToJSONString:(NSDictionary *)dic {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

- (void)cancelRequest:(QSBaseRequest *)request
{
    [request.requestOperation cancel];
    [self removeOperation:request.requestOperation];
    [request clearCompletionBlock];
}

- (void)cancelAllRequests
{
    NSDictionary *copyRecord = [_requestsRecord copy];
    for (NSString *key in copyRecord) {
        QSBaseRequest *request = copyRecord[key];
        [request stop];
    }
}


//xiangfeng,token过期,重新刷新
- (void)refreshJWTToken:(QSBaseRequest *) request{
    [[UserInfoService sharedInstance] requestRefreshTokenWithSuccessBlock:^{
        [self addRequest:request];
    } failureBlock:^{
        DLog(@"Request refreshJWTToken");
    }];
}



- (BOOL)checkResultRight:(id)responseObject
{
    BOOL result = [responseObject isKindOfClass:[NSDictionary class]];
    return result;
}

- (void)handleRequestResult:(NSURLSessionDataTask *)operation responseJSON:(id) responseObject responseError:(NSError *)error
{
    NSString *key = [self requestHashKey:operation];
    QSBaseRequest *request = _requestsRecord[key];
//    DLog(@"Finished Request: %@", NSStringFromClass([request class]));
    if (request) {
        BOOL succeed = [self checkResultRight:responseObject];
        request.responseJSONObject = responseObject;
        if (succeed) {
            //xiangfeng
            request.responseStatusCode = [[request.responseJSONObject objectForKey:@"errCode"] integerValue];
            request.responseStatusString = [request.responseJSONObject objectForKey:@"errMsg"];
            request.responseString = [self DictionaryChangeToJSONString:responseObject];
            NSInteger errCode = request.responseStatusCode;
            if (errCode == 101) {//过期重新刷新token
                [self refreshJWTToken:request];
            }
            else if (errCode == 100 ||errCode == 102||errCode == 103||errCode == 104 ){//被踢
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                NSString *str = [request.responseJSONObject objectForKey:@"errMsg"];
                if (str) {
                    [dic sf_setObject:[(NSDictionary *)request.responseJSONObject objectForKey:@"errMsg"] forKey:@"message"];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"logout"object:nil userInfo:dic];
            }
            else if (request.successCompletionBlock) {
                request.successCompletionBlock(request);
            }
        }
        else {
            if (request.failureCompletionBlock) {
                request.failureCompletionBlock(request);
            }
        }
        [YYMonitorNetwork sharedInstance].isStatusConnect = succeed;
    }
    [self removeOperation:operation];
    [request clearCompletionBlock];
}

- (NSString *)requestHashKey:(NSURLSessionDataTask *)operation
{
    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[operation hash]];
    return key;
}

- (BOOL)checkResult:(QSBaseRequest *)request
{
    BOOL result = [request statusCodeValidator];
    if (!result) {
        return result;
    }
    id validator = [request jsonValidator];
    if (validator != nil) {
        id json = [request responseJSONObject];
        result = [QSNetworkPrivate checkJSON:json withValidator:validator];
    }
    return result;
}

- (void)addOperation:(QSBaseRequest *)request
{
    if (request.requestOperation != nil) {
        NSString *key = [self requestHashKey:request.requestOperation];
        @synchronized(self) {
            _requestsRecord[key] = request;
        }
    }
}

- (void)removeOperation:(NSURLSessionDataTask *)operation
{
    NSString *key = [self requestHashKey:operation];
    @synchronized(self) {
        [_requestsRecord removeObjectForKey:key];
    }
    DLog(@"Request queue total = %lu", (unsigned long)[_requestsRecord count]);
}

#pragma mark - Tool Methods

- (NSString *)getAppVersion
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

- (NSString *)getOperationVersion
{
//    NSString *version = [[UIDevice currentDevice] systemVersion];
//    return version;
    return @"2";// 1-安卓，2-iOS
}

- (NSNumber *)getTimestamp
{
    unsigned long timeFrom1970 = time(NULL) / 1000;
    return [NSNumber numberWithUnsignedLong:timeFrom1970];
}

@end
