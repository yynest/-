//
//  QSBaseRequest.h
//  QianShanJY
//
//  Created by Jim on 15/9/11.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, QSRequestMethod) {
    QSRequestMethodGet = 0,
    QSRequestMethodPost,
};

typedef NS_ENUM(NSInteger, QSRequestSerializerType) {
    QSRequestSerializerTypeHTTP = 0,
    QSRequestSerializerTypeJSON,
};

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);

@interface QSBaseRequest : NSObject {
    //xiangfeng
    NSString *protURL;
    NSMutableDictionary *inputValues;
}

@property (nonatomic) NSInteger tag;

// User info
@property (nonatomic, strong) NSDictionary *userInfo;

@property (nonatomic, strong) NSURLSessionDataTask *requestOperation;

@property (nonatomic, strong, readonly) NSDictionary *responseHeaders;

@property (nonatomic, strong) NSString *responseString;

@property (nonatomic, strong) id responseJSONObject;

@property (nonatomic) NSInteger responseStatusCode;
@property (nonatomic, strong) NSString *responseStatusString;

@property (nonatomic, copy) void (^successCompletionBlock)(QSBaseRequest *);

@property (nonatomic, copy) void (^failureCompletionBlock)(QSBaseRequest *);

//xiangfeng，统一的接口,不需要传入uesId
- (instancetype)initWithRequestURL:(NSString *)URL;
- (instancetype)initWithRequestURL:(NSString *)URL parameter:(NSDictionary *)dic;
- (instancetype)initWithNOIdRequestURL:(NSString *)URL parameter:(NSDictionary *)dic;


// Append self to request queue
- (void)start;

// Remove self from request queue
- (void)stop;

- (BOOL)isExecuting;

// Block回调
- (void)startWithCompletionBlockWithSuccess:(void (^)(QSBaseRequest *request))success
                                    failure:(void (^)(QSBaseRequest *request))failure;

- (void)setCompletionBlockWithSuccess:(void (^)(QSBaseRequest *request))success
                              failure:(void (^)(QSBaseRequest *request))failure;

// 把Block置nil来打破循环引用
- (void)clearCompletionBlock;

/* 以下方法由子类继承来覆盖默认值 */

// 请求的URL
- (NSString *)requestURL;

// 请求的BaseURL
- (NSString *)baseURL;

// 请求的连接超时时间，默认为60秒
- (NSTimeInterval)requestTimeoutInterval;

// 请求的参数列表
- (id)requestArgument;

// HTTP请求的方法
- (QSRequestMethod)requestMethod;

// 请求的SerializerType
- (QSRequestSerializerType)requestSerializerType;

// 请求的Server用户名和密码
- (NSArray *)requestAuthorizationHeaderFieldArray;

// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary;

// 用于检查JSON是否合法的对象
- (id)jsonValidator;

// 用于检查Status Code是否正常的方法
- (BOOL)statusCodeValidator;

// 当POST的内容带有文件等富文本时使用
- (AFConstructingBlock)constructingBodyBlock;

//xiangfeng 通用接口：userId ，requestURL
- (instancetype)initWithUserId:(NSNumber *) userId;
- (instancetype)initWithUserId:(NSNumber *) userId requestURL:(NSString *)url;


@end
