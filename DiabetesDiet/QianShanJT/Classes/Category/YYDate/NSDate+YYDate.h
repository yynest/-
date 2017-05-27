//
//  NSDate+YYDate.h
//  YYDate
//
//  Created by iosdev on 2017/5/18.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YYDate)

//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)strFormat;
//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)strFormat;

//开始到结束的时间差
+ (int) dateTimeComponentsWithType:(int)type StartTime:(NSDate *)startTime endTime:(NSDate *)endTime;


//开始到结束的时间差
+ (int) dateTimeDifferenceWithType:(int)type StartTime:(NSDate *)startTime endTime:(NSDate *)endTime;

@end
