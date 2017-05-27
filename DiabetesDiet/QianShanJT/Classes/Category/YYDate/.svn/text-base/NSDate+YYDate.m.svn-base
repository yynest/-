//
//  NSDate+YYDate.m
//  YYDate
//
//  Created by iosdev on 2017/5/18.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "NSDate+YYDate.h"

@implementation NSDate (YYDate)

//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)strFormat{
    if (!date) {
        //获取系统当前时间
        date = [NSDate date];
    }
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:strFormat];//@"yyyy-MM-dd HH:mm:ss zzz"
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    NSLog(@"%@",currentDateString);
    return currentDateString;
}

//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)strFormat {
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:strFormat];//@"yyyy-MM-dd HH:mm:ss"
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:string];
    return date;
}

//开始到结束的时间差
//type:年差额 = dateCom.year, 月差额 = dateCom.month, 日差额 = dateCom.day, 小时差额 = dateCom.hour, 分钟差额 = dateCom.minute, 秒差额 = dateCom.second
+ (int) dateTimeComponentsWithType:(int)type StartTime:(NSDate *)startTime endTime:(NSDate *)endTime {
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:startTime toDate:endTime options:0];
    int year = (int)dateCom.year;
    int result = (int)dateCom.day;
    //取绝对值
    return abs(year);
}

//开始到结束的时间差
+ (int) dateTimeDifferenceWithType:(int)type StartTime:(NSDate *)startTime endTime:(NSDate *)endTime {
    NSTimeInterval start = [startTime timeIntervalSince1970]*1;
    NSTimeInterval end = [endTime timeIntervalSince1970]*1;
    NSTimeInterval value = ABS(end - start);
//    int second = (int)value %60;//秒
//    int minute = (int)value /60%60;
//    int house = (int)value / (24 * 3600)%3600;
    int day = (int)value / (24 * 3600);
    return day;
//    NSString *str;
//    if (day != 0) {
//        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
//    }else if (day==0 && house != 0) {
//        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
//    }else if (day== 0 && house== 0 && minute!=0) {
//        str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
//    }else{
//        str = [NSString stringWithFormat:@"耗时%d秒",second];
//    }
//    return str;
}

@end
