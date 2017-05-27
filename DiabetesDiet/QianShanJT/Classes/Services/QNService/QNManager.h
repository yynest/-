//
//  QNManager.h
//  QianShanJY
//
//  Created by iosdev on 2017/3/24.
//  Copyright © 2017年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QiniuSDK.h"

@interface QNManager : NSObject

+ (instancetype _Nullable )sharedInstance;


/**
 *    直接上传数据
 *    @param type           上传类型 0 im聊天 1 头像 2 用户建议图片
 *    @param data           待上传的数据
 *    @param suffix         上传到云存储的suffix,后缀
 *    @param cHandler       上传完成后的回调函数
 */
- (void)putDataType:(NSString *_Nullable)type
               data:(NSData *_Nullable)data
             suffix:(NSString *_Nullable)suffix
           complete:(nullable void(^)(BOOL isSuccess,NSString * _Nullable path))cHandler;

- (void)putFileType:(NSString *_Nullable)type
               file:(NSString *_Nullable)file
             suffix:(NSString *_Nullable)suffix
           complete:(nullable void(^)(BOOL isSuccess,NSString *_Nullable path))cHandler;

@end
