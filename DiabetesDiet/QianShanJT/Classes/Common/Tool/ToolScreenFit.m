//
//  ToolScreenFit.m
//  QianShanJY
//
//  Created by iosdev on 16/8/10.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import "ToolScreenFit.h"

@implementation ToolScreenFit

//判断屏幕类型：3.5-0,4-1,4.7-2,5.5-3
+ (NSInteger)getMainScreenType {
    NSInteger type;
    CGFloat height = MAIN_SCREEN_HEIGHT;
    if (height == 480) {
        type = 0;
    }
    else if (height == 568) {
        type = 1;
    }
    else if (height == 667) {
        type = 2;
    }
    else if (height == 736) {
        type = 3;
    }
    else {
        type = 3;
    }
    return type;
}

//
+ (CGFloat)getScreenFitWithValues:(NSArray *)values {
    NSInteger type = [self getMainScreenType];
    CGFloat value = [[values sf_objectAtIndex:type] floatValue];
    return value;
}

//左侧Cell高度
+ (CGFloat)getLeftMenuCellHeight {
    NSArray *sizes = @[@"50", @"52", @"56", @"60"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return size;
}

//按钮间隔
+ (CGFloat)getButtonSpace {
    NSArray *sizes = @[@"10", @"15", @"20", @"25"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return size;
}

//左侧字体大小
+ (UIFont *)getLeftMenuFont {
    NSArray *sizes = @[@"17", @"17", @"17", @"18"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return [UIFont systemFontOfSize:size];
}

//单元格（两列）字体大小：设置，个人信息，
//版本更新             1.0.4 >
+ (UIFont *)getTowColumnCellFont {
    NSArray *sizes = @[@"17", @"17", @"17", @"18"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)getTowColumnCellDetailFont {
    NSArray *sizes = @[@"15", @"15", @"16", @"16"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return [UIFont systemFontOfSize:size];
}

//按钮字体大小
+ (UIFont *)getButtonFont {
    NSArray *sizes = @[@"15", @"15", @"15", @"16"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return [UIFont systemFontOfSize:size];
}


//说明提示字体大小
+ (UIFont *)getTipsFont {
    NSArray *sizes = @[@"15", @"15", @"16", @"17"];
    NSInteger type = [self getMainScreenType];
    CGFloat size = [[sizes sf_objectAtIndex:type] floatValue];
    return [UIFont systemFontOfSize:size];
}

//得到底部按钮的高度
+ (CGFloat)getFootButtonHeight {
    CGFloat height = 50*(MAIN_SCREEN_HEIGHT-64)/603;
    return height;
}

//根据控件在6s 设计图上的高度 返回 不同屏幕尺寸上的高度
+(NSInteger)getHeightWithControlHeight:(CGFloat)height{

    if (MAIN_SCREEN_HEIGHT == 480) {
        return height/667.0*568;
    }
    return height/667.0*MAIN_SCREEN_HEIGHT;
}
@end
