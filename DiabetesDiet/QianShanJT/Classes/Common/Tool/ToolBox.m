//
//  ToolBox.m
//  QianShanJY
//
//  Created by lxl on 15/10/9.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import "ToolBox.h"
#import "MD5Encrypt.h"
#import "QSNetworkConfig.h"
#import "UserInfoService.h"
#import <AVFoundation/AVFoundation.h>
#import "UIColor+Custom.h"
#import "SocialService.h"

@implementation ToolBox

//获取当前时间
+ (NSString *)getCurrentTime {
//    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
//    [inputFormatter setLocale:[NSLocale currentLocale]];
//    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    NSDate* inputDate = [inputFormatter dateFromString:[inputFormatter stringFromDate:[NSDate date]]];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];//@"yyyy/MM/dd HH:mm"
    
    NSString *str= [outputFormatter stringFromDate:[NSDate date]];
    return str;
}

+ (NSTimeInterval)getCurrentTimeInterval {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[NSLocale currentLocale]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate* inputDate = [inputFormatter dateFromString:[inputFormatter stringFromDate:[NSDate date]]];
    NSTimeInterval measureTime = inputDate.timeIntervalSince1970 * 1000;
    return measureTime;
}

+ (NSTimeInterval)getCurrentTimeIntervalWithDay:(int)day {
    NSDate *dateDay = [self getDateByAddingDays:day fromDate:[NSDate date]];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[NSLocale currentLocale]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate* inputDate = [inputFormatter dateFromString:[inputFormatter stringFromDate:dateDay]];
    NSTimeInterval measureTime = inputDate.timeIntervalSince1970 * 1000;
    return measureTime;
}

+ (NSDate *)StrToNsDate:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //str 格式 ：@"2010-08-04 16:01:03"
    NSDate *date = [dateFormatter dateFromString:str];
    NSLog(@"%@", date);
    return date;
}


+ (NSString *)mSecondToDateString:(long long)second
{
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:second/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)mSecondToDateTimeString:(long long)second
{
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:second/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd HH:mm";
    return [dateFormatter stringFromDate:date];
}

+ (long long)mStringToDateSecond:(NSString *)string
{
    return 0;
}

+ (NSNumber *)getTimestampFromDate:(NSDate *)date
{
    return [NSNumber numberWithDouble:((signed long long)(date.timeIntervalSince1970 * 1000))];
}

+ (NSDate *)getDateFromTimestamp:(NSNumber *)timestamp
{
    NSDate *comefromTimesp = [NSDate dateWithTimeIntervalSince1970:([timestamp doubleValue] / 1000)];
    return comefromTimesp;
}

+ (NSString *)getHoursAndMinutesFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"HH:mm"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    
    return retStr;
}


+ (NSString *)getHoursAndMinutesFromTimestampAndPMAM:(NSNumber *)timestamp
{
    
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    BOOL hasAMPM = containsA.location != NSNotFound;
    if(hasAMPM == YES){
        //12小时制
        
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setLocale:[NSLocale currentLocale]];
        [outputFormatter setDateFormat:@"aaa hh:mm"];//HH 表示24小时 hh表示12小时
        [outputFormatter setAMSymbol:@"上午"];
        [outputFormatter setPMSymbol:@"下午"];
        NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
        return retStr;
        
    }else{
        //24小时制
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setLocale:[NSLocale currentLocale]];
        [outputFormatter setDateFormat:@"HH:mm"];
        NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
        return retStr;
    }
}

+ (NSString *)getMonthsAndDayFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"MM/dd"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    
    return retStr;
}

+ (NSString *)getWeekdayStringFromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
    long nowWeek = [comps weekday];
    NSString *weekStr = [[NSString alloc] init];
    switch (nowWeek) {
        case 1:
            weekStr = @"周日";
            break;
        case 2:
            weekStr = @"周一";
            break;
        case 3:
            weekStr = @"周二";
            break;
        case 4:
            weekStr = @"周三";
            break;
        case 5:
            weekStr = @"周四";
            break;
        case 6:
            weekStr = @"周五";
            break;
        case 7:
            weekStr = @"周六";
            break;
        default:
            break;
    }
    return weekStr;
}

+ (NSString *)getYearsAndMonthsFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy年MM月"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    
    return retStr;
}

+ (NSString *)getYearsAndMonthsAndDaysFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy/MM/dd"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    return retStr;
}

+ (NSString *)getYearsAndMonthsAndDaysAndHMFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    return retStr;
}

+ (NSString *)getYearsAndMonthsAndDaysWithDescriptionFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    
    return retStr;
}

+ (NSString *)getYearsAndMonthsAndDaysWithDescriptionFromTimestamponathe:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    return retStr;
}
//xiangfeng
+ (NSString *)getYearsAndMonthsAndDaysHMSFromTimestamponathe:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    return retStr;
}

// 从时间戳获取年月日,小时和分钟
+ (NSString *)getYearsAndMonthsAndDaysAndHoursAndMinutesFromTimestamp:(NSNumber *)timestamp{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    
    return retStr;
}

+ (NSString *)getMonthsAndDaysFromTimestamp:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"MM.dd"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];

    return retStr;
}

+ (NSString *)getMonthsAndDaysFromTimestampForMainPageView:(NSNumber *)timestamp
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"MM月dd日"];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    
    return retStr;
}

// 获取指定日期所在周的周一的日期
+ (NSDate *)getTheFirstDayDateOfAWeek:(NSDate *)date
{
    double interval = 0;
    NSDate *beginDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];       // 设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&beginDate interval:&interval forDate:date];
    if (ok) {
        return beginDate;
    }else {
        return nil;
    }
}

// 获取指定日期所在周的周日的日期
+ (NSDate *)getTheLastDayDateOfAWeek:(NSDate *)date
{
    double interval = 0;
    NSDate *beginDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&beginDate interval:&interval forDate:date];
    if (ok) {
        return [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return nil;
    }
}

// 获取指定日期所在月的第一天的日期
+ (NSDate *)getTheFirstDayDateOfAMonth:(NSDate *)date
{
    double interval = 0;
    NSDate *beginDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    if (ok) {
        return beginDate;
    }else {
        return nil;
    }
}

// 获取指定日期所在月的最后一天的日期
+ (NSDate *)getTheLastDayDateOfAMonth:(NSDate *)date
{
    double interval = 0;
    NSDate *beginDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    if (ok) {
        return [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return nil;
    }
}

// 转化时间为今天，昨天，前天
+ (NSString *)getCustomFormWithDateString:(double)dateString
{
    
    NSString *dateContent;
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today=[[NSDate alloc] init];
    NSDate *yearsterDay =  [[NSDate alloc] initWithTimeIntervalSinceNow:-secondsPerDay];
    NSDate *qianToday =  [[NSDate alloc] initWithTimeIntervalSinceNow:-2*secondsPerDay];
    //假设这是你要比较的date：NSDate *yourDate = ……
    
     NSDate* date = [NSDate dateWithTimeIntervalSince1970:dateString/ 1000.0];
    //日历
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:yearsterDay];
    NSDateComponents* comp3 = [calendar components:unitFlags fromDate:qianToday];
    NSDateComponents* comp4 = [calendar components:unitFlags fromDate:today];
    if ( comp1.year == comp2.year && comp1.month == comp2.month && comp1.day == comp2.day) {
        dateContent = @"昨天";
    }
    else if (comp1.year == comp3.year && comp1.month == comp3.month && comp1.day == comp3.day)
    {
        dateContent = @"前天";
    }
    else if (comp1.year == comp4.year && comp1.month == comp4.month && comp1.day == comp4.day)
    {
        dateContent = @"今天";
    }
    else
    {
        //返回0说明该日期不是今天、昨天、前天
        dateContent = @"最近一次";
    }
    return dateContent;
}

+ (NSString *)getCustomYearsMonthsDaysForBPDetailRecordListWithDateString:(NSString *)dateString
{
    NSString *str = dateString;
    NSDate *tDate = [NSDate date];
    NSDate *yDate = [ToolBox getDateByAddingDays:-1 fromDate:tDate];
    NSDate *bDate = [ToolBox getDateByAddingDays:-2 fromDate:tDate];
    if ([str isEqualToString:[ToolBox getYearsAndMonthsAndDaysWithDescriptionFromTimestamp:[ToolBox getTimestampFromDate:tDate]]]) {
        str = @"今天";
    }
    else if ([str isEqualToString:[ToolBox getYearsAndMonthsAndDaysWithDescriptionFromTimestamp:[ToolBox getTimestampFromDate:yDate]]]) {
        str = @"昨天";
    }
    else if ([str isEqualToString:[ToolBox getYearsAndMonthsAndDaysWithDescriptionFromTimestamp:[ToolBox getTimestampFromDate:bDate]]]) {
        str = @"前天";
    }
    
    return str;
}

//时间统一规则
+ (NSString *)getCommonDateAndTime:(NSNumber *)dateNumber
{
    NSString *str = nil;
    NSDate *aDate = [ToolBox getDateFromTimestamp:dateNumber];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //今天
    if ([calendar isDateInToday:aDate]) {
        return [self getHoursAndMinutesFromTimestamp:dateNumber];
    }
    
    //昨天
    if ([calendar isDateInYesterday:aDate]){
        return @"昨天";
    }
    
    //前天
    NSDateComponents *comps;
    NSDate *tDate = [NSDate date];
    comps = [calendar components:NSCalendarUnitDay fromDate:aDate toDate:tDate options:0];
    if (comps.day == 2) {
        return [NSString stringWithFormat:@"前天"];
    }
    
    comps = [calendar components:NSCalendarUnitYear fromDate:aDate];
    NSDateComponents *todayComps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    if (todayComps.year  - comps.year == 0) {
        //同一年
        return [ToolBox getMonthsAndDayFromTimestamp:dateNumber];
    }else{
        //往年
        return [ToolBox getYearsAndMonthsAndDaysFromTimestamp:dateNumber];
    }

    return str;
}


//时间统一规则,图文问诊
+ (NSString *)getCommonDateAndTimeForChat:(NSNumber *)dateNumber
{
    NSString *str = nil;
    NSDate *aDate = [ToolBox getDateFromTimestamp:dateNumber];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //今天
    if ([calendar isDateInToday:aDate]) {
        return [NSString stringWithFormat:@"今天 %@", [self getHoursAndMinutesFromTimestamp:dateNumber]];
    }
    //昨天
    if ([calendar isDateInYesterday:aDate]){
        return [NSString stringWithFormat:@"昨天 %@", [self getHoursAndMinutesFromTimestamp:dateNumber]];
    }
    
    //前天
    NSDateComponents *comps;
    NSDate *tDate = [NSDate date];
    comps = [calendar components:NSCalendarUnitDay fromDate:aDate toDate:tDate options:0];
    if (comps.day == 2) {
        return [NSString stringWithFormat:@"前天 %@", [self getHoursAndMinutesFromTimestamp:dateNumber]];
    }
    
    comps = [calendar components:NSCalendarUnitYear fromDate:aDate];
    NSDateComponents *todayComps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    if (todayComps.year  - comps.year == 0) {
        //同一年
        return [ToolBox getMonthsAndDayFromTimestamp:dateNumber];
    }else{
        //往年
        return [ToolBox getYearsAndMonthsAndDaysFromTimestamp:dateNumber];
    }
    
    return str;
}




+ (NSDate *)getDateByAddingYears:(int)years fromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[[NSDate alloc] init]];
    
    [comps setYear:years];    // +24表示获取下一天的Date，-24表示获取前一天的Date；
    [comps setMonth:0];
    [comps setDay:0];
    return [calendar dateByAddingComponents:comps toDate:date options:0];
}


+ (NSDate *)getDateByAddingDays:(int)days fromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:[[NSDate alloc] init]];
    
    [comps setHour:(days) * 24];    // +24表示获取下一天的Date，-24表示获取前一天的Date；
    [comps setMinute:0];
    [comps setSecond:0];
    return [calendar dateByAddingComponents:comps toDate:date options:0];
}

//get 相隔年数的date

+(NSNumber *)getAgoTimeStampsForYears:(int)years
{
    NSDate *tDate = [NSDate date];
    //获得哪一年
    NSDateComponents *tComp = [ToolBox getCalendarFromDate:tDate];
    //获得这一年1月1号
    NSDate *tStartDate = [ToolBox getDateFromCalendar:(int)tComp.year month:1 day:1];
    
    NSDate *yDate = [ToolBox getDateByAddingYears: - years fromDate:tStartDate];
    return [ToolBox getTimestampFromDate:yDate];
    
}

//根据日历返回NSDate
+ (NSDate *)getDateFromCalendar:(int)year month:(int)month day:(int)day
{
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    
    [compt setYear:year];
    [compt setMonth:month];
    [compt setDay:day];
    [compt setHour:0];
    [compt setMinute:0];
    [compt setSecond:0];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateFromComponents:compt];
    //得到本地时间，避免时区问题
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    
    NSLog(@"%@",localeDate);
    return localeDate;
    
}

// 解析date的日历情况
+ (NSDateComponents *)getCalendarFromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    //NSDateComponents *compt = [calendar components:NSDayCalendarUnit fromDate:date];
    NSDateComponents *compt = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    
//    NSLog(@"%d,%@",[compt year],date);
//    NSLog(@"%d,%@",[compt month],date);
//    NSLog(@"%d,%@",[compt day],date);
    return compt;
}
// 计算两个date相差天数
+(NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    [gregorian setFirstWeekday:2];
    
    //去掉时分秒信息
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:serverDate];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:endDate];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    
    return dayComponents.day;
}


//xiangfeng:@"yyyy年MM月dd日 HH:mm:ss",@"yyyy-MM-dd HH:mm:ss",@"yyyy/MM/dd HH:mm"
+ (NSString *)getDateWithTimestamp:(NSNumber *)timestamp withDateFormat:(NSString *)format
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:[ToolBox getDateFromTimestamp:timestamp]];
    return retStr;
}


//当前年 则返回月，往年，返回年月
+ (NSString *)getCurrentYearMonthWithTimestamp:(NSNumber *)dataNumber
{
    NSString *str;
    NSDate *aDate = [ToolBox getDateFromTimestamp:dataNumber];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *comps;
    
    comps = [calendar components:NSCalendarUnitYear fromDate:aDate];
    NSDateComponents *todayComps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    if (todayComps.year  - comps.year == 0) {
        //同一年
        str = [ToolBox getDateWithTimestamp:dataNumber withDateFormat:@"MM月"];
    }else{
        //往年
        str = [ToolBox getDateWithTimestamp:dataNumber withDateFormat:@"yyyy年MM月"];
    }
    
    return str;
}


// 下载文件到Documents中并返回路径
+ (NSString *)saveFileToDocuments:(NSString *)url
{
    NSString *resultFilePath = @"";
    if (url) {
        
        //缓存文件夹
        NSString *destFolderPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"pictures"];
        //NSString *destFolderPath = [destFilePath stringByDeletingLastPathComponent];
        
        //缓存文件名
        NSString *fileName = [url lastPathComponent];
        //缓存文件本地路径
        NSString *filePath = [destFolderPath stringByAppendingPathComponent:fileName];

        // 判断路径文件夹是否存在不存在则创建
        if (! [[NSFileManager defaultManager] fileExistsAtPath:destFolderPath]) {
            
            [[NSFileManager defaultManager] createDirectoryAtPath:destFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        // 判断该文件是否已经下载过
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            resultFilePath = filePath;
        } else {
            
            //要求异步下载
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            if ([imageData writeToFile:filePath atomically:YES]) {
                resultFilePath = filePath;
            }
        }
    }
    return resultFilePath;
}

//图片压缩 xiangfeng
/*
 压缩算法：最小边为720，另一边按照比例算出大小，
             宽高      质量比     实际大小     效果
 iPhone5s: 720 *960     0.5       110      有点模糊
 iPhone5s: 720 *960      1        150       正常
 
 iPhone6p: 720 *960      1        140       正常
 */
+ (UIImage*)imageScaleHandle:(UIImage*)originImage
{
    NSData *data=UIImageJPEGRepresentation(originImage, 1.0);
    int size = (int)data.length/1024;//k
    DLog(@"size1 K:%d",size);
    CGFloat width = originImage.size.width;
    CGFloat height = originImage.size.height;
    CGSize imagesize;
    if (width<height) {
        imagesize.height = height*(720/width);
        imagesize.width = 720;
    }
    else {
        imagesize.width = width*(720/height);
        imagesize.height = 720;
    }
    UIImage *imageNew = [self imageWithImage:originImage scaledToSize:imagesize];
    NSData *imageData = UIImageJPEGRepresentation(imageNew,1.0);
    int size2 = (int)imageData.length/1024;//k
    DLog(@"size2 K:%d",size2);
    return [UIImage imageWithData:imageData];
}

+ (UIImage*)imageScaleHandle:(UIImage*)originImage scale:(CGFloat)math quality:(CGFloat)quality
{
    CGSize imagesize = originImage.size;
    imagesize.height = imagesize.height/math;
    imagesize.width = imagesize.width/math;
    UIImage *imageNew = [self imageWithImage:originImage scaledToSize:imagesize];
    NSData *imageData = UIImageJPEGRepresentation(imageNew,quality);
    UIImage *img = [UIImage imageWithData:imageData];
    return img;
}

//任意图片压缩到100k内
+ (UIImage *)imageScaleHandeToOneSize:(UIImage *)originImage
{
    NSData *data=UIImageJPEGRepresentation(originImage, 1.0);
    int size = (int)data.length/1024;//k
    DLog(@"size1 K:%d",size);
    if (size>100) {
        if (size>1024) {//1M以及以上
            data=UIImageJPEGRepresentation(originImage, 0.1);
        }else if (size>512) {//0.5M-1M
            data=UIImageJPEGRepresentation(originImage, 0.5);
        }else if (size>200) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(originImage, 0.9);
        }
    }
    int size2 = (int)data.length/1024;//k
    DLog(@"size2 K:%d",size2);
    UIImage *img = [UIImage imageWithData:data];
    return img;

}

+ (NSData*)imageScaleHandleToData:(UIImage*)originImage scale:(CGFloat)math quality:(CGFloat)quality
{
    CGSize imagesize = originImage.size;
    imagesize.height = imagesize.height/math;
    imagesize.width = imagesize.width/math;
    UIImage *imageNew = [self imageWithImage:originImage scaledToSize:imagesize];
    NSData *imageData = UIImageJPEGRepresentation(imageNew,quality);
    
    return imageData;
}
//对图片尺寸进行压缩--
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}
//计算文件大小
+ (long long) fileSizeAtPath:(NSString*) filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//遍历文件夹获得文件夹大小，返回多少M，用于清理缓存
+ (float ) folderSizeAtPath:(NSString*) folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

//得到网络请求的头
+ (NSURL *)getHttpRequestURLWithData:(NSDictionary *)dic api:(NSString *)api{
    // 组成请求参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    unsigned long timeFrom1970 = time(NULL) / 1000;
    NSNumber *timestamp = [NSNumber numberWithUnsignedLong:timeFrom1970];
    NSNumber *userId = [UserInfoService sharedInstance].userId;
    [param sf_setObject:timestamp forKey:@"timestamp"];
    [param sf_setObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"version"];
    [param sf_setObject:[[UIDevice currentDevice] systemVersion] forKey:@"operation"];
    [param sf_setObject:[MD5Encrypt MD5:timestamp] forKey:@"sign"];
    [param sf_setObject:userId forKey:@"id"];
    [param addEntriesFromDictionary:dic];
    
    NSString *strApi = [NSString stringWithFormat:@"%@%@",[[QSNetworkConfig sharedInstance] getBaseAddress],api];
    NSString *strValue = [NSString stringWithFormat:@"?data={sign:%@,timestamp:%@,version:%@,operation:%@,id:%@,medicalId:%@}", [param objectForKey:@"sign"], [param objectForKey:@"timestamp"], [param objectForKey:@"version"], [param objectForKey:@"operation"], [param objectForKey:@"id"], [param objectForKey:@"medicalId"]];
    
    NSString *specialURL = [NSString stringWithFormat:@"%@%@",strApi,strValue];
    specialURL = [specialURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:specialURL];

    return url;
}

+ (BloodPressureLevel)getBloodPressureLevelWithSBP:(NSInteger)highValue andDBP:(NSInteger)lowValue
{
    BloodPressureLevel retValue;
    if (highValue >= 180 || lowValue >= 110) {                                                      // 三级高血压
        retValue = BloodPressureLevel_Severe;
    }
    else if ((highValue >= 160 && highValue < 180) || (lowValue >= 100 && lowValue < 110)) {        // 二级高血压
        retValue = BloodPressureLevel_Moderate;
    }
    else if ((highValue >= 140 && highValue < 160) || (lowValue >= 90 && lowValue < 100)) {         // 一级高血压
        retValue = BloodPressureLevel_Mild;
    }
    else if ((highValue > 120 && highValue < 140) || (lowValue > 80 && lowValue < 90)) {          // 正常高值
        retValue = BloodPressureLevel_HighNormal;
    }
    else if ((highValue >= 90 && highValue <= 120) && (lowValue >= 60 && lowValue <= 80)) {           // 正常血压
        retValue = BloodPressureLevel_Normal;
    }
    else if (highValue < 90 || lowValue < 60) {                                                     // 血压偏低
        retValue = BloodPressureLevel_Low;
    }
    
    return retValue;
}


//根据屏幕大小返回数值
+ (CGFloat)getValueScreenWithArray:(NSArray *)array {
    CGFloat value;
    int height = [UIScreen mainScreen].bounds.size.height;
    NSArray *heightList = @[@"480",@"568",@"667",@"736"];
    NSInteger index = [heightList indexOfObject:[NSString stringWithFormat:@"%d",height]];
    if (array.count>index) {
        value = [array[index] floatValue];
    }
    return value;
}

+ (BOOL)canVideo
{
    if([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending){
        
        AVAuthorizationStatus authstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if((authstatus != AVAuthorizationStatusAuthorized) && (authstatus != AVAuthorizationStatusNotDetermined))
        {
            UIAlertView * alt = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"setting.cameraNoAuthority", @"No camera permissions") message:NSLocalizedString(@"setting.cameraAuthority", @"Please open in \"Setting\"-\"Privacy\"-\"Camera\".") delegate:self cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"ok", @"OK"), nil];
            [alt show];
            return NO;
        }
    }
    return YES;
}

//数字转成易读
+ (NSString *)numberChangeShorthand:(NSNumber *)number {
    int num = [number intValue];
    NSString *str;
    if (num < 10000) {
        str = [NSString stringWithFormat:@"%d",num];
    }
    else if (num >= 10000 && num < 100000) {
        float temp = num/10000.0;
        str = [NSString stringWithFormat:@"%1f万",temp];

    }
    else if(num >= 100000 && num < 100000000) {
        float temp = num/10000;
        str = [NSString stringWithFormat:@"%f万",temp];
        
    }
    else {
        float temp = num/100000000;
        str = [NSString stringWithFormat:@"%f亿",temp];
    }
    return str;
}

//生成一个红点
+ (UILabel *)redCircleView:(CGRect)frame
{
    UILabel *mark = [[UILabel alloc] initWithFrame:frame];
    mark.layer.cornerRadius = 3.5;
    mark.layer.masksToBounds = YES;
    mark.backgroundColor = [UIColor colorHighlightRed];
    mark.hidden = YES;
    return mark;
}

//得到字符的字节数
+ (float)getSizeLengthWithString:(NSString*)str {
    float strlength = 0;
    char* p = (char*)[str cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength/2.0;
}

//UITextView相关，动态计算text内容高度，以及textView的高度
+ (CGFloat)calcUITextViewForText:(NSString *)content lineSpace:(CGFloat)space textFont:(CGFloat)font textViewWidth:(CGFloat)width
{
    if ([content length] < 1) {
        return 0;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:font],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, CGFLOAT_MAX)];//CGFLOAT_MAX是必要的，按最大的y方向范围，不然计算的高度不会超过这个值
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    textView.attributedText = attrStr;
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];   // 获取该段attributedString的属性字典
    // 计算文本的大小
    CGSize textSize = [textView.text boundingRectWithSize:textView.bounds.size // 用于计算文本绘制时占据的矩形块
                                                  options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin // 文本绘制时的附加选项
                                               attributes:dic        // 文字的属性
                                                  context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
//    NSLog(@"w = %f", textSize.width);
//    NSLog(@"h = %f", textSize.height);
    return  textSize.height;
}

//为UILabel 和 UITextView 提供属性字符串，修改行高，字体颜色，字体大小
+ (NSAttributedString *)ChangeStrToAttributeStr:(NSString *)oriStr space:(NSInteger) fontSpace size:(NSInteger)fontSize color:(UIColor*)fontColor
{
    if (!oriStr || [oriStr length] == 0) {
        return nil;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = fontSpace;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName:fontColor,
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:oriStr attributes:attributes];
    return attrStr;
}


//为UILabel 和 UITextView 提供属性字符串，修改行高，字体颜色，字体大小
+ (NSAttributedString *)ChangeStrToAttributeStrNoTail:(NSString *)oriStr space:(NSInteger) fontSpace size:(NSInteger)fontSize color:(UIColor*)fontColor
{
    if (!oriStr || [oriStr length] == 0) {
        return nil;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = fontSpace;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName:fontColor,
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:oriStr attributes:attributes];
    return attrStr;
}


//字符串转 NSAttributedString，调整行距
+ (NSAttributedString *)attributedString:(NSString *)string lineSpace:(CGFloat)space {
    if (!string || [string length] == 0) {
        return nil;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    return attrStr;
}
/*
 数组：values:
 dic:
 NSString:字符串
 dicProperty:属性
 行数：numberOfLines:1
 间距：lineSpacing:
 */
+ (NSMutableAttributedString *)attributedStringValues:(NSArray *)values numOfLines:(NSInteger)line lineSpace:(CGFloat)space {
    NSMutableString *string = [[NSMutableString alloc] init];
    for (NSDictionary *dic in values) {
        NSString *temp = [dic objectForKey:@"stingKey"];
        [string appendString:temp];
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSDictionary *dic in values) {
        NSDictionary *dicPro = [dic objectForKey:@"propertyKey"];
        //
        NSInteger loc = str.length;
        if (loc < 0) {
            loc = 0;
        }
        NSString *temp = [dic objectForKey:@"stingKey"];
        NSInteger length = temp.length;
        [str appendString:temp];
        NSRange range = NSMakeRange(loc, length);
        
        //
        [attributeString setAttributes:dicPro range:range];
    }
//    [attributeString setAttributes:@{NSForegroundColorAttributeName : RGBACOLOR_HEX(0xFD9207, 1.0),	NSFontAttributeName : [UIFont systemFontOfSize:10]} range:NSMakeRange(attributeString.length - 2, 2)];
    return attributeString;
}

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

// 字符串中的逗号 转 空格，返回字符串
- (NSString *)strSymbolToBlankStr:(NSString *)orginStr
{
    return [orginStr stringByReplacingOccurrencesOfString:@"," withString:@" "];
}


//获取字符串的宽度
+ (float) widthForString:(NSString *)value fontSize:(UIFont *)font {
    CGSize contentSize;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font};
        
        contentSize = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }
    else{
        contentSize = [value sizeWithFont:CELL_CONTENT_FONT_SIZE constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    }
    return contentSize.width;
}
//获得字符串的高度
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize {
    CGSize contentSize;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:CELL_CONTENT_FONT_SIZE};
        
        contentSize = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }
    else{
        contentSize = [value sizeWithFont:CELL_CONTENT_FONT_SIZE constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    }
    return contentSize.height;
}

+ (NSAttributedString *)updateTotlePrice:(NSString *) strPrice {
    if (!strPrice) {
        return nil;
    }
    NSAttributedString *attributedString;
    NSString *price = [NSString stringWithFormat:@"￥%@",strPrice];
    NSArray *priceList = [price componentsSeparatedByString:@"."];
    
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 sf_setObject:priceList[0] forKey:@"stingKey"];
    [dic1 sf_setObject:@{NSForegroundColorAttributeName:[UIColor colorHighlightYellow], NSFontAttributeName:[UIFont systemFontOfSize:18]} forKey:@"propertyKey"];
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 sf_setObject:[NSString stringWithFormat:@".%@",priceList[1]] forKey:@"stingKey"];
    [dic2 sf_setObject:@{NSForegroundColorAttributeName:[UIColor colorHighlightYellow], NSFontAttributeName:[UIFont systemFontOfSize:13]} forKey:@"propertyKey"];
    attributedString = [ToolBox attributedStringValues:@[dic1,dic2] numOfLines:1 lineSpace:0];
    return attributedString;
}

/*判断是否安装某个app
 1.微信：wechat
 2.QQ： mqq
 3.微博：weibo
 4.阿里：alipay
 4.
 */
+ (BOOL)isInstalledWithAppIdentifier:(NSString *) appIdentifier {
    NSString *strURL = [NSString stringWithFormat:@"%@://",appIdentifier];
    BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:strURL]];
    return isInstalled;
}


//只判断收缩压 或者 舒张压
+ (BloodPressureLevel)getBloodPressureLevelColorWithSBP:(NSInteger)highValue andDBP:(NSInteger)lowValue
{
    BloodPressureLevel retValue;
    if (highValue >= 180 || lowValue >= 110) {                                                      // 三级高血压
        retValue = BloodPressureLevel_Severe;
    }
    else if ((highValue >= 160 && highValue < 180) || (lowValue >= 100 && lowValue < 110)) {        // 二级高血压
        retValue = BloodPressureLevel_Moderate;
    }
    else if ((highValue >= 140 && highValue < 160) || (lowValue >= 90 && lowValue < 100)) {         // 一级高血压
        retValue = BloodPressureLevel_Mild;
    }
    else if ((highValue > 120 && highValue < 140) || (lowValue > 80 && lowValue < 90)) {          // 正常高值
        retValue = BloodPressureLevel_HighNormal;
    }
    else if ((highValue >= 90 && highValue <= 120) || (lowValue >= 60 && lowValue <= 80)) {           // 正常血压
        retValue = BloodPressureLevel_Normal;
    }
    else if (highValue < 90 || lowValue < 60) {                                                     // 血压偏低
        retValue = BloodPressureLevel_Low;
    }
    
    return retValue;
}

//xiaomei
+(NSArray *)getTimeArray{
    return @[@"凌晨",@"早餐前",@"早餐后",@"午餐前",@"午餐后",@"晚餐前",@"晚餐后",@"睡前"];
}

//根据字符串返回时间类型    凌晨  ---  返回1
+(NSString *)getTimeTypeWithString:(NSString *)string{

    NSString *type;
    for (int i = 0 ; i < 8 ; i++) {
        if ([string isEqualToString:[self getTimeArray][i]] ) {
            type = [NSString stringWithFormat:@"%d",i+1];
        }
    }
    return type;
}

//根据类型返回字符串  1 --- 凌晨
+(NSString *)getTimeStringWithType:(NSString *)type{

    return [self getTimeArray][[type intValue]-1];
}

//根据血糖值和时间类型 返回 偏低1  正常3 偏高4
+(NSString *)getStateFromBSValue:(NSString *)value type:(NSString *)type{
    

    CGFloat num1 = floor([value floatValue] * 10) / 10;
  

    BOOL isEmptyStomach;//空腹
    if ([type isEqualToString:@"1"] || [type isEqualToString:@"2"]|| [type isEqualToString:@"4"]|| [type isEqualToString:@"6"]) {
        isEmptyStomach = YES;
    }else{
        isEmptyStomach = NO;
    }
    
    NSString *str;

    if (isEmptyStomach) {
        if (num1 >=0.0 && num1 <= 2.7) {
            return @"1";
        }
        else if (num1 >=2.8 && num1 <= 4.3) {
            return @"2";
        }else if (num1 >=4.4 && num1 <= 7.0){
            
            return @"3";
        }else if (num1>= 7.1 && num1 <= 33.3){
            
            return @"4";
        }
    }else{
        if (num1 >=0.0 && num1 <= 2.7) {
            return @"1";
        }
        else if (num1 >=2.8 && num1 <= 4.3) {
            return @"2";
        }else if (num1 >=4.4 && num1 <= 10.0){
            
            return @"3";
        }else if (num1>= 10.1 && num1 <= 33.3){
            
            return @"4";
        }
    }
    return str;
}

//根据状态 返回对应的解读文字
+(NSString *)getStringWithState:(NSString *)state{
    NSString *str;
    if ([state isEqualToString:@"1"]) {
        return @"您目前处于低血糖,建议马上口服糖水、含糖饮料、或进食糖果、饼干、面包等,并立即医院就诊。";
    }else if ([state isEqualToString:@"2"]){
        
        return @"您目前血糖偏低,如有出汗、饥饿、感觉异常、流涎、颤抖、心悸、紧张、焦虑、软弱无力、面色苍白、心跳加快、四肢冰凉等,建议马上口服糖水、含糖饮料、或进食糖果、饼干、面包等,如有不适到医院就诊。";
    }else if ([state isEqualToString:@"3"]){
        
        return @"您目前血糖正常,建议您继续保持。";
    }else if ([state isEqualToString:@"4"]){
        
        return @"您目前血糖偏高,建议您到医院就诊。";
    }
    return str;
}

//根据level返回颜色值  level  低血糖1 偏低2  正常3 偏高4
+ (UIColor *)getColorFromLevel:(NSString *)level
{
    if (!level || (![level isEqualToString:@"1"] && ![level isEqualToString:@"2"]&&![level isEqualToString:@"3"]&&![level isEqualToString:@"4"])) {
        return nil;
    }
    
    NSArray *array = @[[UIColor colorHighlightYellow],[UIColor colorHighlightYellow],[UIColor colorMainGreen],[UIColor colorHighlightRed]];
    
    NSInteger index = [level integerValue];
    
    return array[index - 1];
}
//根据1到8来返回时间段的文字
+(NSString *)getTextFromTime:(NSString *)time
{
    NSArray *array = @[@"凌晨",@"早餐前",@"早餐后",@"午餐前",@"午餐后",@"晚餐前",@"晚餐后",@"睡前"];
    
    NSInteger index = [time integerValue];
    
    if (index > 0 && index < 9 ) {
        return array[index - 1];
    }
    return nil;
}

+(NSString *)getTimeParagraphFromHour:(NSDate *)nowDate {
    NSString *timeStr;
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"HH"];
    NSString* hour = [inputFormatter stringFromDate:nowDate];
    
    
    NSDateFormatter *inputFormatter2 = [[NSDateFormatter alloc] init];
    [inputFormatter2 setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter2 setDateFormat:@"mm"];
    NSString* min = [inputFormatter stringFromDate:nowDate];
    
    NSInteger nowTime = [self getDateFromCalendarhour:[hour intValue] min:[min intValue]];
    if (nowTime >= [self getDateFromCalendarhour:0 min:1] && nowTime <= [self getDateFromCalendarhour:6 min:0]) {
        return @"凌晨";
    }else if (nowTime >= [self getDateFromCalendarhour:6 min:1] && nowTime <= [self getDateFromCalendarhour:8 min:0]){
        return @"早餐前";
    }else if (nowTime >= [self getDateFromCalendarhour:8 min:1] && nowTime <= [self getDateFromCalendarhour:10 min:0]){
        return @"早餐后";
    }else if (nowTime >= [self getDateFromCalendarhour:10 min:1] && nowTime <= [self getDateFromCalendarhour:12 min:0]){
        return @"午餐前";
    }else if (nowTime >= [self getDateFromCalendarhour:12 min:1] && nowTime <= [self getDateFromCalendarhour:16 min:0]){
        return @"午餐后";
    }else if (nowTime >= [self getDateFromCalendarhour:16 min:1] && nowTime <= [self getDateFromCalendarhour:18 min:0]){
        return @"晚餐前";
    }else if (nowTime >= [self getDateFromCalendarhour:18 min:1] && nowTime <= [self getDateFromCalendarhour:21 min:0]){
        return @"晚餐后";
    }else if (nowTime >= [self getDateFromCalendarhour:21 min:1] && nowTime <= [self getDateFromCalendarhour:24 min:0]){
        return @"睡前";
    }
    return timeStr;
}

+ (NSInteger  )getDateFromCalendarhour:(int)hour min:(int)min
{
    //    // 最后返回时间戳
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    [compt setYear:1970];
    [compt setMonth:1];
    [compt setDay:1];
    [compt setHour:hour];
    [compt setMinute:min];
    [compt setSecond:0];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateFromComponents:compt];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]*1000];
    return [timeSp integerValue];
}

//生成二维码图片，url:链接地址 image:中心小图片 size:二维码图片大小
+ (UIImage *)getQRcode:(NSString *)url centerImage:(UIImage *)image QRsize:(CGSize)size
{
    //导入头文件#import <CoreImage/CoreImage.h>
    
    //创建过滤器 -- 苹果没有将这个字符封装成常量
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //过滤器恢复默认设置
    [filter setDefaults];
    
    //给过滤器添加数据(正则表达式/帐号和密码) -- 通过KVC设置过滤器,只能设置NSData类型
    NSString *dataString = url;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    //获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    
    //二维码图片清晰处理
    UIImage *finalImage = [ToolBox QRcodeAddImage:[ToolBox createNonInterpolatedUIImageFormCIImage:outputImage withSize:size.width] smallImage:image];
    
    return finalImage;
}

//  根据CIImage生成指定大小的UIImage，放大，清晰处理
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    //创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    //保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    
}

//在二维码图片中心添加小图片
+ (UIImage *)QRcodeAddImage:(UIImage *)QRImage smallImage:(UIImage *)image
{
    //开启图形上下文
    UIGraphicsBeginImageContext(QRImage.size);
    //将二维码的图片画入
    [QRImage drawInRect:CGRectMake(0, 0, QRImage.size.width, QRImage.size.height)];
    //在中心划入其他图片
    UIImage *centerImg = image;
    //三分之一大小
    CGFloat centerW=QRImage.size.width/4;
    CGFloat centerH=QRImage.size.width/4;
    CGFloat centerX=(QRImage.size.width-centerW)*0.5;
    CGFloat centerY=(QRImage.size.height -centerW)*0.5;
    
    [centerImg drawInRect:CGRectMake(centerX, centerY, centerW, centerH)];
    
    //获取绘制好的图片
    UIImage *finalImg=UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图像上下文
    UIGraphicsEndImageContext();
    
    return finalImg;
}


+ (NSMutableDictionary *)getWebViewSharePara:(UIWebView *)webView
{
    //千山自己的H5字段
    NSString *cmd1 = @"document.getElementById('og-type').getAttribute('content')";
    NSString *url1 = [webView stringByEvaluatingJavaScriptFromString:cmd1];
    
    NSString *cmd2 = @"document.getElementById('og-url').getAttribute('content')";
    NSString *url2 = [webView stringByEvaluatingJavaScriptFromString:cmd2];
    
    NSString *cmd3 = @"document.getElementById('og-title').getAttribute('content')";
    NSString *url3 = [webView stringByEvaluatingJavaScriptFromString:cmd3];
    
    //分享的图片image
    NSString *cmd4 = @"document.getElementById('og-image').getAttribute('content')";
    NSString *url4 = [webView stringByEvaluatingJavaScriptFromString:cmd4];
    
    //子标题
    NSString *cmd5 = @"document.getElementById('og-description').getAttribute('content')";
    NSString *url5 = [webView stringByEvaluatingJavaScriptFromString:cmd5];
    
    // H5页面默认参数
    //标题
    NSString *titleCmd = @"document.title";
    NSString *titlestr = [webView stringByEvaluatingJavaScriptFromString:titleCmd];
    
    //当前页面的网址链接
    NSString *remoteUrlcmd = @"window.location.href";
    NSString *remoteUrl = [webView stringByEvaluatingJavaScriptFromString:remoteUrlcmd];
    
    NSString *descripCmd = @"document.getElementsByName('description')[0].getAttribute('content');";
    NSString *decStr = [webView stringByEvaluatingJavaScriptFromString:descripCmd];
    
    NSMutableDictionary * param = [[NSMutableDictionary alloc] init];
    
    if (url2.length == 0) {
        [param sf_setObject:remoteUrl forKey:ShareUrl];
        [param sf_setObject:[NSString stringWithFormat:@"%@", titlestr] forKey:ShareFirstTitle];
        [param sf_setObject:decStr forKey:ShareSubTitle];
        [param sf_setObject:@"" forKey:ShareImage];
        
    }else{
        [param sf_setObject:url2 forKey:ShareUrl];
        [param sf_setObject:[NSString stringWithFormat:@"%@", url3] forKey:ShareFirstTitle];
        [param sf_setObject:url5 forKey:ShareSubTitle];
        [param sf_setObject:url4 forKey:ShareImage];
    }
    return param;
}

@end




