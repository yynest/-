//
//  QSNetworkPrivate.m
//  QianShanJY
//
//  Created by Jim on 15/9/11.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "QSNetworkPrivate.h"

@implementation QSNetworkPrivate

+ (BOOL)checkJSON:(id)json withValidator:(id)validatorJSON
{
    if ([json isKindOfClass:[NSDictionary class]] &&
        [validatorJSON isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dict = json;
        NSDictionary * validator = validatorJSON;
        BOOL result = YES;
        NSEnumerator * enumerator = [validator keyEnumerator];
        NSString * key;
        while ((key = [enumerator nextObject]) != nil) {
            id value = dict[key];
            id format = validator[key];
            if ([value isKindOfClass:[NSDictionary class]]
                || [value isKindOfClass:[NSArray class]]) {
                result = [self checkJSON:value withValidator:format];
                if (!result) {
                    break;
                }
            }
            else {
                if ([value isKindOfClass:format] == NO &&
                    [value isKindOfClass:[NSNull class]] == NO) {
                    result = NO;
                    break;
                }
            }
        }
        
        return result;
    }
    else if ([json isKindOfClass:[NSArray class]] &&
               [validatorJSON isKindOfClass:[NSArray class]]) {
        NSArray * validatorArray = (NSArray *)validatorJSON;
        if (validatorArray.count > 0) {
            NSArray * array = json;
            NSDictionary * validator = validatorJSON[0];
            for (id item in array) {
                BOOL result = [self checkJSON:item withValidator:validator];
                if (!result) {
                    return NO;
                }
            }
        }
        
        return YES;
    }
    else if ([json isKindOfClass:validatorJSON]) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (NSString *)urlStringWithOriginURLString:(NSString *)originURLString appendParameters:(NSDictionary *)parameters
{
    NSString *filteredURL = originURLString;
    NSString *paraURLString = [self urlParametersStringFromParameters:parameters];
    if (paraURLString && paraURLString.length > 0) {
        if ([originURLString rangeOfString:@"?"].location != NSNotFound) {
            filteredURL = [filteredURL stringByAppendingString:paraURLString];
        }
        else {
            filteredURL = [filteredURL stringByAppendingFormat:@"?%@", [paraURLString substringFromIndex:1]];
        }
        
        return filteredURL;
    }
    else {
        return originURLString;
    }
}

+ (NSString *)urlParametersStringFromParameters:(NSDictionary *)parameters
{
    NSMutableString *urlParametersString = [[NSMutableString alloc] initWithString:@""];
    if (parameters && parameters.count > 0) {
        for (NSString *key in parameters) {
            NSString *value = parameters[key];
            value = [NSString stringWithFormat:@"%@",value];
            value = [self urlEncode:value];
            [urlParametersString appendFormat:@"&%@=%@", key, value];
        }
    }
    
    return urlParametersString;
}

+ (NSString*)urlEncode:(NSString*)str
{
    //different library use slightly different escaped and unescaped set.
    //below is copied from AFNetworking but still escaped [] as AF leave them for Rails array parameter which we don't use.
    //https://github.com/AFNetworking/AFNetworking/pull/555
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)str, CFSTR("."), CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8);
    return result;
}

@end
