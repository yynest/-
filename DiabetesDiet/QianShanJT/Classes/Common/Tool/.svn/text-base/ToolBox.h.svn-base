//
//  ToolBox.h
//  QianShanJY
//
//  Created by lxl on 15/10/9.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonDefined.h"


typedef NS_ENUM(NSUInteger, BloodPressureLevel) {
    BloodPressureLevel_Low,                 // 血压偏低
    BloodPressureLevel_Normal,              // 正常血压
    BloodPressureLevel_HighNormal,          // 正常高值
    BloodPressureLevel_Mild,                // 一级高血压(轻度)
    BloodPressureLevel_Moderate,            // 二级高血压(中度)
    BloodPressureLevel_Severe,              // 三级高血压(重度)
};

@interface ToolBox : NSObject


//获取当前时间
+ (NSString *)getCurrentTime;
+ (NSTimeInterval)getCurrentTimeInterval;
//隔几天
+ (NSTimeInterval)getCurrentTimeIntervalWithDay:(int)day;

//字符串格式时间戳转NSDate
+ (NSDate *)StrToNsDate:(NSString *)str;
+ (NSString *)mSecondToDateString:(long long)second;
+ (NSString *)mSecondToDateTimeString:(long long)second;

// 将NSDate格式日期转换成时间戳
+ (NSNumber *)getTimestampFromDate:(NSDate *)date;

// 将时间戳转换为NSDate日期
+ (NSDate *)getDateFromTimestamp:(NSNumber *)timestamp;

//当前年 则返回月，往年，返回年月
+ (NSString *)getCurrentYearMonthWithTimestamp:(NSNumber *)dataNumber;

// 从时间戳获取小时和分钟
+ (NSString *)getHoursAndMinutesFromTimestamp:(NSNumber *)timestamp;

// 从时间戳获取年和月
+ (NSString *)getYearsAndMonthsFromTimestamp:(NSNumber *)timestamp;
+ (NSString *)getMonthsAndDayFromTimestamp:(NSNumber *)timestamp;


// 从时间戳获取年月日,小时和分钟
+ (NSString *)getYearsAndMonthsAndDaysAndHoursAndMinutesFromTimestamp:(NSNumber *)timestamp;

// 从时间戳获取年月日（以/分隔）
+ (NSString *)getYearsAndMonthsAndDaysFromTimestamp:(NSNumber *)timestamp;
+ (NSString *)getYearsAndMonthsAndDaysAndHMFromTimestamp:(NSNumber *)timestamp;

// 从时间戳获取年月日（以-分隔）
+ (NSString *)getYearsAndMonthsAndDaysWithDescriptionFromTimestamponathe:(NSNumber *)timestamp;
//xiangfeng
+ (NSString *)getYearsAndMonthsAndDaysHMSFromTimestamponathe:(NSNumber *)timestamp;

// 从时间戳获取年月日(以年月日分隔)
+ (NSString *)getYearsAndMonthsAndDaysWithDescriptionFromTimestamp:(NSNumber *)timestamp;

// 从时间戳获取月和日
+ (NSString *)getMonthsAndDaysFromTimestamp:(NSNumber *)timestamp;

// 从时间戳获取月和日（为首页定制）
+ (NSString *)getMonthsAndDaysFromTimestampForMainPageView:(NSNumber *)timestamp;

// 带今天、昨天和前天转换功能的年、月、日生成器（为血压详情列表定制）
+ (NSString *)getCustomYearsMonthsDaysForBPDetailRecordListWithDateString:(NSString *)dateString;

// 从日期获取星期
+ (NSString *)getWeekdayStringFromDate:(NSDate *)date;

// 获取指定日期所在周的周一的日期
+ (NSDate *)getTheFirstDayDateOfAWeek:(NSDate *)date;

// 获取指定日期所在周的周日的日期
+ (NSDate *)getTheLastDayDateOfAWeek:(NSDate *)date;

// 获取指定日期所在月的第一天的日期
+ (NSDate *)getTheFirstDayDateOfAMonth:(NSDate *)date;

// 获取指定日期所在月的最后一天的日期
+ (NSDate *)getTheLastDayDateOfAMonth:(NSDate *)date;

// 转化时间为今天，昨天，前天
+ (NSString *)getCustomFormWithDateString:(double)date;
// 社区统一时间返回，今天，昨天，前天，当前，往年格式规定
+ (NSString *)getCommonDateAndTime:(NSNumber *)dateNumber;
//图文问诊统一时间返回，
+ (NSString *)getCommonDateAndTimeForChat:(NSNumber *)dateNumber;
//
+(NSNumber *)getAgoTimeStampsForYears:(int)years;
//日历 转 NSDate
+ (NSDate *)getDateFromCalendar:(int)year month:(int)month day:(int)day;
//NSDate 转 日历
+ (NSDateComponents *)getCalendarFromDate:(NSDate *)date;
//NSDate 转上午下午 小时 和 分钟
+ (NSString *)getHoursAndMinutesFromTimestampAndPMAM:(NSNumber *)timestamp;
//计算两个日期相差天数
+(NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;
+ (NSDate *)getDateByAddingDays:(int)days fromDate:(NSDate *)date;

//本地图片缓存
+ (NSString *)saveFileToDocuments:(NSString *)url;
//图片压缩
+ (UIImage*)imageScaleHandle:(UIImage*)originImage;
+ (UIImage*)imageScaleHandle:(UIImage*)originImage scale:(CGFloat)math quality:(CGFloat)quality;
+ (NSData*)imageScaleHandleToData:(UIImage*)originImage scale:(CGFloat)math quality:(CGFloat)quality;
+ (UIImage *)imageScaleHandeToOneSize:(UIImage *)originImage;


//计算文件大小
+ (long long) fileSizeAtPath:(NSString*) filePath;

//得到HttpRequestURL
+ (NSURL *)getHttpRequestURLWithData:(NSDictionary *)dic api:(NSString *)api;

// 根据收缩压和舒张压的血压值得出用户所处的血压等级
+ (BloodPressureLevel)getBloodPressureLevelWithSBP:(NSInteger)highValue andDBP:(NSInteger)lowValue;

//根据屏幕大小返回数值
+ (CGFloat)getValueScreenWithArray:(NSArray *)array;

//返回app使用相机权限的状态
+ (BOOL)canVideo;

//数字转成易读
+ (NSString *)numberChangeShorthand:(NSNumber *)number;
//生成一个红点
+ (UILabel *)redCircleView:(CGRect)frame;

//得到字符的字节数
+ (float)getSizeLengthWithString:(NSString*)str;
//动态计算uitextview 的内容高度，以及uitextview frame 自适应
+ (CGFloat)calcUITextViewForText:(NSString *)content lineSpace:(CGFloat)space textFont:(CGFloat)font textViewWidth:(CGFloat)width;
//普通字符串转 NSAttributedString
+ (NSAttributedString *)ChangeStrToAttributeStr:(NSString *)oriStr space:(NSInteger) fontSpace size:(NSInteger)fontSize color:(UIColor*)fontColor;

+ (NSAttributedString *)ChangeStrToAttributeStrNoTail:(NSString *)oriStr space:(NSInteger) fontSpace size:(NSInteger)fontSize color:(UIColor*)fontColor;


//字符串转 NSAttributedString，调整行距
+ (NSAttributedString *)attributedString:(NSString *)string lineSpace:(CGFloat)space;

+ (BloodPressureLevel)getBloodPressureLevelColorWithSBP:(NSInteger)highValue andDBP:(NSInteger)lowValue;

/*
 数组：values:
 dic:
 NSString:字符串
 dicProperty:属性
 行数：numberOfLines:1
 间距：lineSpacing:
 
 */
+ (NSMutableAttributedString *)attributedStringValues:(NSArray *)values numOfLines:(NSInteger)line lineSpace:(CGFloat)space;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

// 字符串中的逗号 转 空格，返回字符串
- (NSString *)strSymbolToBlankStr:(NSString *)orginStr;

//H5页面获取分享参数返回
+ (NSMutableDictionary *)getWebViewSharePara:(UIWebView *)webView;

#pragma -mark -functions
//获取字符串的宽度
+ (float) widthForString:(NSString *)value fontSize:(UIFont *)font;
//获得字符串的高度
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize;

+ (NSAttributedString *)updateTotlePrice:(NSString *) strPrice;

//判断是否安装某个app
+ (BOOL)isInstalledWithAppIdentifier:(NSString *) appIdentifier;


//xiaomei

//时间段数组
+(NSArray *)getTimeArray;

//根据字符串返回时间类型    凌晨  ---  返回1
+(NSString *)getTimeTypeWithString:(NSString *)string;

//根据类型返回字符串  1 --- 凌晨
+(NSString *)getTimeStringWithType:(NSString *)type;

//根据血糖值和时间类型 返回 偏低1  正常3 偏高4
+(NSString *)getStateFromBSValue:(NSString *)value type:(NSString *)type;

//根据状态 返回对应的解读文字
+(NSString *)getStringWithState:(NSString *)state;

//根据level返回颜色值  level  低血糖1 偏低2  正常3 偏高4
+ (UIColor *)getColorFromLevel:(NSString *)level;
//根据1到8来返回时间段的文字
+(NSString *)getTextFromTime:(NSString *)time;


//根据时间 返回现在是哪个时间段
+(NSString *)getTimeParagraphFromHour:(NSDate *)nowDate;

//根据时分秒 返回时间戳
+ (NSInteger  )getDateFromCalendarhour:(int)hour min:(int)min;

//生成二维码图片，url:链接地址 image:中心小图片 size:二维码图片大小
+ (UIImage *)getQRcode:(NSString *)url centerImage:(UIImage *)image QRsize:(CGSize)size;

//在app中调其系统的短信发送页面
- (void)sendMessage:(NSString *)content;
@end

