//
//  MD5Encrypt.m
//  QianShanJY
//
//  Created by Jim on 15/9/14.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "MD5Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

#define XOR_KEY 0xBB

const char DIGITS[] = {'2', '1', '0', '3', '4', '5', '6', '7', '9', '8', 'E', 'A', 'B', 'C', 'D', 'F'};

@implementation MD5Encrypt

#pragma mark - Interface Method

// 对外提供的MD5加密功能的接口
+ (NSString *)MD5:(NSNumber *)timestamp
{
    return [MD5Encrypt md5HexDigest:timestamp];
}

#pragma mark - Functional Method

//// 将所有请求参数的Key进行字典顺序排序
//+ (NSArray *)sortedArray:(NSArray *)arr
//{
//    NSArray *sortedArray = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        
//        NSString *cmpStr1 = (NSString *)obj1;
//        NSString *cmpStr2 = (NSString *)obj2;
//        return [cmpStr1 compare:cmpStr2 options:NSCaseInsensitiveSearch];
//    }];
//    
//    return sortedArray;
//}

void xorString(unsigned char *str, unsigned char key)
{
    unsigned char *p = str;
    while( ((*p) ^=  key) != '\0')  p++;
}

// 对MD5加密使用的公共字符串进行异或加解密
+ (NSString *)getPublicKey
{
    unsigned char str[] = {
                            (XOR_KEY ^ 'o'),
                            (XOR_KEY ^ 'p'),
                            (XOR_KEY ^ '2'),
                            (XOR_KEY ^ 'c'),
                            (XOR_KEY ^ '8'),
                            (XOR_KEY ^ '1'),
                            (XOR_KEY ^ '6'),
                            (XOR_KEY ^ '6'),
                            (XOR_KEY ^ 'd'),
                            (XOR_KEY ^ '3'),
                            (XOR_KEY ^ 'a'),
                            (XOR_KEY ^ '5'),
                            (XOR_KEY ^ '1'),
                            (XOR_KEY ^ 'b'),
                            (XOR_KEY ^ '7'),
                            (XOR_KEY ^ 'a'),
                            (XOR_KEY ^ '2'),
                            (XOR_KEY ^ '6'),
                            (XOR_KEY ^ '\0')};
    xorString(str, XOR_KEY);
    char result[19];
    memcpy(result, str, 19);
    //op2c8166d3a51b7a26
    return [NSString stringWithUTF8String:result];
}

// 拼装需要进行MD5加密的明文，规则是：key=valuePublicKey
+ (NSString *)packingTextFromDictionary:(NSNumber *)timestamp
{
    NSString *keyString = [NSString stringWithFormat:@"timestamp=%@%@", timestamp, [MD5Encrypt getPublicKey]];
    
//    NSArray *keyArr = [MD5Encrypt sortedArray:[paramDic allKeys]];
//    
//    NSString *retString = [NSString string];
//    for (id obj in keyArr) {
//        if ([retString length] == 0) {
//            retString = [retString stringByAppendingFormat:@"%@=%@", obj, [paramDic objectForKey:obj]];
//        }
//        else {
//            retString = [retString stringByAppendingFormat:@"&%@=%@", obj, [paramDic objectForKey:obj]];
//        }
//    }
//    retString = [retString stringByAppendingFormat:@"%@", [MD5Encrypt getPublicKey]];
    
    return keyString;
}

// MD5算法加密
+ (NSString *)md5HexDigest:(NSNumber *)timestamp
{
    NSString *text = [MD5Encrypt packingTextFromDictionary:timestamp];
    const char *original_str = [text UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    
    unsigned char output[CC_MD5_DIGEST_LENGTH << 1];
    for (int i = 0, j = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        output[j++] = DIGITS[((unsigned int)(0xF0 & result[i])) >> 4];
        output[j++] = DIGITS[0x0F & result[i]];
    }
    
    for (int i = 0; i < (CC_MD5_DIGEST_LENGTH << 1); i++) {
        [hash appendFormat:@"%c", output[i]];
    }
    
    return [hash uppercaseString];
}

@end
