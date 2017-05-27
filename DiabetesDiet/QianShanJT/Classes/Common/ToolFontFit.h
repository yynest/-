//
//  ToolFontFit.h
//  XMUIFont
//
//  Created by Xiaomei on 2017/3/2.
//  Copyright © 2017年 Xiaomei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LabelFontType) {
    FontTypeNormal = 0,      //常规字体
    FontTypeSpecial,         //特殊字体 5大 + 1小
    FontTypeButton,          //按钮字体
};

typedef NS_ENUM(NSUInteger, NormalFontType) {
    NormalFontTypeTitle = 0,       //一级标题
    NormalFontTypeMainbody1,       //正文1
    NormalFontTypeMainbody2,       //正文2
    NormalFontTypeExplanation,     //各种数字，说明注释，单位
};

typedef NS_ENUM(NSUInteger, SpecialFontType) {
    SpecialFontTypeBig1 = 0,      //特殊字体1
    SpecialFontTypeBig2,
    SpecialFontTypeBig3,
    SpecialFontTypeBig4,
    SpecialFontTypeBig5,
    SpecialFontTypeSmall1,
};

typedef NS_ENUM(NSUInteger, ButtonFontType) {
    ButtonFontTypeBig = 0,      //常规字体
    ButtonFontTypemiddle,
    ButtonFontTypeSmall1,
    ButtonFontTypeSmall2,
};


@interface ToolFontFit : NSObject
///////////////第一个版本
//+ (CGFloat)getScreenFitWithValues:(NSArray *)values;
/**
 *  正常字体大小
 *
 *  parameter  type:0,1,2
 类型：
 0：列表标题，我的订单切换按钮，
 1：列表详情，首页按钮
 2：列表提示，首页底部按钮，首页顶部提示，
 *  屏幕大小     0    1   2
 *  3.5        16   14  13
 *  4.0        16   14  13
 *  4.7        18   16  14
 *  5.5        18   16  14
 *
 *  @return UIFont
 */
//+ (UIFont *)getFontNormalSizeWithType:(NSInteger)type;


/**
 *  大号字体大小
 *
 *  parameter  type:0,1,2
 类型：
 0：血压手工录入： 血压值
 1：血压详情：列表展示 血压值
 2：高危保护： 四重保护
 *  屏幕大小     0    1   2
 *  3.5        28   26  24
 *  4.0        28   26  24
 *  4.7        30   28  26
 *  5.5        30   28  26
 *
 *  @return UIFont
 */
//+(UIFont *)getFontBigSizeWithType:(NSInteger)type;


/**
 *  小号字体大小
 *
 *  parameter  type:0,1,2
 类型：
 0：远程问诊：高血压专家 电话问诊  高血压在线答疑  问诊详情
 1：实名认证：温馨提示
 2：首   页： 时间
 *  屏幕大小     0     1   2
 *  3.5        10    9   8
 *  4.0        10    9   8
 *  4.7        12    11  10
 *  5.5        12    11  10
 *
 *  @return UIFont
 */
//+(UIFont *)getFontSmallSizeWithType:(NSInteger)type;

//根据不同屏幕 返回所有字体
//+(NSString *)getFontsFromeScreenWithIndexPath:(NSInteger)index;


//获取设备型号
+ (NSString *)getCurrentDeviceModel;




///////////2017年3月17日  第二版本  设计给出方案类型比第一版本多   更新类型

//常规字体
+(UIFont *)getFontNormalSizeWithType:(NSInteger)type;
//特殊字体
+(UIFont *)getFontSpecialSizeWithType:(NSInteger)type;
//按钮字体
+(UIFont *)getFontButtonSizeWithType:(NSInteger)type;

//常规字体
+(void)setFontFromLabel:(UILabel *)label  FontType:(LabelFontType)fontType WithType:(NSInteger)type;
@end
