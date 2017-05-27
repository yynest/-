//
//  RegexVerifyTool.h
//  QianShanJY
//
//  Created by iosdev on 16/4/13.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegexVerifyTool : NSObject

//删除特殊的字符：空格等
+ (NSString *)deleteSomeCharacterWith:(NSString *)string;

//验证身份证
+ (BOOL)regexVerifyWithIDCard:(NSString *)value;

//验证真实姓名
+ (BOOL)regexVerifyWithRealName:(NSString *)value;

//验证手机号码
+ (BOOL)regexVerifyWithMobilePhone:(NSString *)value;

// 采用正则表达式验证短信验证码是否输入正确. 规则：4位数字
+ (BOOL)regexVerifySMSVerifyCode:(NSString *)smsCode;

//判断字符串是否为空
+ (BOOL)checkEmptyString:(NSString *)string;

@end
