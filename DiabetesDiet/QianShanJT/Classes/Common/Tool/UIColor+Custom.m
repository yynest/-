//
//  UIColor+Custom.m
//  QianShan
//
//  Created by iosdev on 2016/10/20.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (QianShan)




/*****************规范颜色*****************/
/*****************
 名称：主色调
 色值：0x01dac8
 颜色：绿色
 用途：导航栏，菜单栏，按钮，选中后高亮颜色，文字颜色
 */
+ (UIColor *)colorMainGreen {
    return RGBACOLOR_HEX(0x01dac8, 1.0);
}

/*****************
 名称：按钮选中
 色值：0x22ab68
 颜色：深绿色
 用途：按钮点击的颜色
 */
+ (UIColor *)colorClikcdBTGreen {
    return RGBACOLOR_HEX(0x00b6a7, 1.0);
}
/*
 名称：按钮禁用
 色值：0xcecece
 颜色：深绿色
 用途：按钮禁用的颜色
 */
+ (UIColor *)colorDisableBTGrag {
    return RGBACOLOR_HEX(0xcecece, 1.0);
}

/*****************
 名称：文字颜色
 色值：0x404040
 颜色：黑色
 用途：标题
 */
+ (UIColor *)colorTextBlack {
    return RGBACOLOR_HEX(0x404040, 1.0);
}
/*
 名称：文字颜色
 色值：0x666666
 颜色：灰色
 用途：详情
 */
+ (UIColor *)colorTextGrag {
    return RGBACOLOR_HEX(0x666666, 1.0);
}
/*
 名称：文字颜色
 色值：0x999999
 颜色：淡灰色
 用途：提示
 */
+ (UIColor *)colorTextGragLight {
    return RGBACOLOR_HEX(0x999999, 1.0);
}

/*****************
 名称：背景颜色
 色值：0xf5f5f5
 颜色：浅灰色
 用途：界面背景
 */
+ (UIColor *)colorBGGragLighter {
    return RGBACOLOR_HEX(0xf5f5f5, 1.0);
}
/*
 名称：透明的背景颜色
 色值：0xffffff
 颜色：透明色
 用途：弱提醒-0.7，IM-0.5
 */
+ (UIColor *)colorBGWithAlpha:(CGFloat)alpha {
    return RGBACOLOR_HEX(0x000000, alpha);
}

/*****************
 名称：强调色
 色值：0xf5a100
 颜色：黄色
 用途：强调
 */
+ (UIColor *)colorHighlightYellow {
    return RGBACOLOR_HEX(0xf5a100, 1.0);
}
/*
 名称：强调色
 色值：0xf73c3c
 颜色：红色
 用途：强调
 */
+ (UIColor *)colorHighlightRed {
    return RGBACOLOR_HEX(0xf73c3c, 1.0);
}

/*****************
 名称：边框
 色值：0xd5dfdf
 颜色：浅浅灰色
 用途：分割线
 */
+ (UIColor *)colorBorderGargLighter {
    return RGBACOLOR_HEX(0xd5dfdf, 1.0);
}

/*****************
 名称：背景色
 色值：0xfcfcfc
 颜色：最浅灰色
 用途：
 */
+ (UIColor *)colorBgLighter {
    return RGBACOLOR_HEX(0xfcfcfc, 1.0);
}


/*****************
 名称：波浪边框
 色值：0x73f7ef
 颜色：浅浅灰色
 用途：个人中心波浪浅  电话  头像边框
 */
+ (UIColor *)colorUCBorder {
    return RGBACOLOR_HEX(0x73f7ef, 1.0);
}
/*****************
 名称：背景半透明
 色值：0xffffff
 颜色：背景半透明
 用途：背景
 */
+ (UIColor *)halfAlphaColor
{
    return [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
}

+ (UIColor *)colorBorderGargLighterWithAlpha:(CGFloat)alpha {
    return RGBACOLOR_HEX(0xd5dfdf, alpha);
}

//尺子颜色
+ (UIColor *)colorRulerBorderGarg {
    return RGBACOLOR_HEX(0xd8d8d8, 1.0);
}

/*****************规范颜色*****************/


@end
