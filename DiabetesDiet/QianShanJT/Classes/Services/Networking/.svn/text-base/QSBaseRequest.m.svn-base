//
//  QSBaseRequest.m
//  QianShanJY
//
//  Created by Jim on 15/9/11.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "QSBaseRequest.h"
#import "QSNetworkAgent.h"
#import "UserInfoService.h"

@implementation QSBaseRequest {
    NSNumber *_userId;
    NSString *_url;
}

//xiangfeng，统一的接口,不需要传入uesId
- (instancetype)initWithRequestURL:(NSString *)URL {
    if (self = [super init]) {
        protURL = URL;
        inputValues = [[NSMutableDictionary alloc] init];
        [inputValues sf_setObject:[UserInfoService sharedInstance].userId forKey:@"id"];
    }
    return self;
}

- (instancetype)initWithRequestURL:(NSString *)URL parameter:(NSDictionary *)dic {
    if (self = [super init]) {
        protURL = URL;
        inputValues = [[NSMutableDictionary alloc] init];
        [inputValues addEntriesFromDictionary:dic];
    }
    return self;
}

- (instancetype)initWithNOIdRequestURL:(NSString *)URL parameter:(NSDictionary *)dic {
    if (self = [super init]) {
        protURL = URL;
        inputValues = [[NSMutableDictionary alloc] init];
        [inputValues addEntriesFromDictionary:dic];
    }
    return self;
}


- (instancetype)init {
    if (self = [super init]) {
        inputValues = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSString *)requestURL
{
    return protURL;
}

- (NSString *)baseURL
{
    return @"";
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 30;
}

- (id)requestArgument
{
    return inputValues;
}

- (QSRequestMethod)requestMethod
{
    return QSRequestMethodPost;
}

- (QSRequestSerializerType)requestSerializerType
{
    return QSRequestSerializerTypeJSON;
}

- (NSArray *)requestAuthorizationHeaderFieldArray
{
    return nil;
}

- (NSDictionary *)requestHeaderFieldValueDictionary
{
    return nil;
}

- (id)jsonValidator
{
    return nil;
}

- (BOOL)statusCodeValidator
{
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    }
    else {
        return NO;
    }
}

- (AFConstructingBlock)constructingBodyBlock
{
    return nil;
}

// Append self to request queue
- (void)start
{
    [[QSNetworkAgent sharedInstance] addRequest:self];
}

// Remove self from request queue
- (void)stop
{
    [[QSNetworkAgent sharedInstance] cancelRequest:self];
}

- (BOOL)isExecuting
{
    return self.requestOperation.state;
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(QSBaseRequest *request))success
                                    failure:(void (^)(QSBaseRequest *request))failure
{
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)setCompletionBlockWithSuccess:(void (^)(QSBaseRequest *request))success
                              failure:(void (^)(QSBaseRequest *request))failure
{
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

- (void)clearCompletionBlock
{
    // nil out to break the retain cycle.
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

//- (id)responseJSONObject
//{
//    return self.requestOperation.responseObject;
//}
//
//- (NSString *)responseString
//{
//    return self.requestOperation.responseString;
//}
//
//- (NSInteger)responseStatusCode
//{
//    return self.requestOperation.response.statusCode;
//}
//
//- (NSDictionary *)responseHeaders
//{
//    return self.requestOperation.response.allHeaderFields;
//}

//xiangfeng 通用接口
- (instancetype)initWithUserId:(NSNumber *) userId {
    self = [super init];
    if (self){
//        _userId = userId;
        inputValues = [[NSMutableDictionary alloc] init];
        [inputValues sf_setObject:[UserInfoService sharedInstance].userId forKey:@"id"];
    }
    return self;
}

- (instancetype)initWithUserId:(NSNumber *) userId requestURL:(NSString *)url {
    self = [super init];
    if (self){
//        _userId = userId;
        inputValues = [[NSMutableDictionary alloc] init];
        [inputValues sf_setObject:[UserInfoService sharedInstance].userId forKey:@"id"];
        protURL = url;
    }
    return self;
}

//- (id)requestArgument {
//    return @{
//             @"id":_userId
//             };
//}


@end
