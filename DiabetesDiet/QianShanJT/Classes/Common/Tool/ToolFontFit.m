//
//  ToolFontFit.m
//  XMUIFont
//
//  Created by Xiaomei on 2017/3/2.
//  Copyright © 2017年 Xiaomei. All rights reserved.
//

#import "ToolFontFit.h"
#include <sys/types.h>
#include <sys/sysctl.h>

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ToolFontFit () {
    
}

@end
@implementation ToolFontFit



//判断屏幕类型：3.5-0,4-1,4.7-2,5.5-3
+ (NSInteger)getMainScreenType {
    NSInteger type;
    CGFloat height = SCREENH_HEIGHT;
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

+ (CGFloat)getScreenFitWithValues:(NSArray *)values {
    NSInteger type = [self getMainScreenType];
    CGFloat  value = [[values sf_objectAtIndex:type] floatValue];
    return value;
}

////正常字体
//+ (UIFont *)getFontNormalSizeWithType:(NSInteger)type {
//
//    NSMutableArray *types = [ManageFont sharedInstance].norSizes[type];
//    CGFloat   size = [ToolFontFit getScreenFitWithValues:types];
//    return [UIFont systemFontOfSize:size];
//}

////大号字体
//+(UIFont *)getFontBigSizeWithType:(NSInteger)type{
//    NSMutableArray *types = [ManageFont sharedInstance].specialSizes[type];
//    CGFloat   size = [ToolFontFit getScreenFitWithValues:types];
//    return [UIFont systemFontOfSize:size];
//}
//
////小号字体
//+(UIFont *)getFontSmallSizeWithType:(NSInteger)type{
//    NSMutableArray *types = [ManageFont sharedInstance].buttonSizes[type];
//    CGFloat   size = [ToolFontFit getScreenFitWithValues:types];
//    return [UIFont systemFontOfSize:size];
//}

////根据不同屏幕 返回所有字体
//+(NSString *)getFontsFromeScreenWithIndexPath:(NSInteger)index{
//    NSArray *sizes1 = [ManageFont sharedInstance].specialSizes;
//    NSArray *sizes2 = [ManageFont sharedInstance].norSizes;
//    NSArray *sizes3 = [ManageFont sharedInstance].buttonSizes;
//    NSArray *allArr = @[sizes1,sizes2,sizes3];
//    NSArray *sizes = allArr[index];
//    NSMutableArray *array = [[NSMutableArray alloc]init];
//    for (NSArray *arr in sizes) {
//        NSInteger type = [self getMainScreenType];
//        NSString *size = arr[type];
//        [array addObject:size];
//    }
//    return [array componentsJoinedByString:@"、"];
//}





////////////2017年3月17   第二版本
//常规字体
+(UIFont *)getFontNormalSizeWithType:(NSInteger)type{
    NSArray *norArr = @[@[@"17",@"17",@"17",@"18"],   //一级标题
                        @[@"15",@"15",@"16",@"17"],   //正文1
                        @[@"14",@"14",@"15",@"16"],   //正文2
                        @[@"12",@"12",@"12",@"13"]];  //注释
    CGFloat   size = [ToolFontFit getScreenFitWithValues:norArr[type]];
    return [UIFont systemFontOfSize:size];
}

//特殊字体
+(UIFont *)getFontSpecialSizeWithType:(NSInteger)type{
//    NSArray *specialArr = @[@[@"40",@"40",@"40",@"40"],
//                            @[@"25",@"25",@"25",@"25"],
//                            @[@"23",@"23",@"23",@"23"],
//                            @[@"21",@"21",@"21",@"21"],
//                            @[@"19",@"19",@"19",@"19"],
//                            @[@"10",@"10",@"10",@"10"]];//5大 + 1小
    NSArray *specialArr = @[@[@"40",@"40",@"40",@"40"],
                            @[@"25",@"25",@"25",@"25"],
                            @[@"20",@"20",@"20",@"20"],//血压仪测量
                            @[@"17",@"17",@"17",@"18"],//左侧menu,
                            @[@"14",@"14",@"16",@"16"],//睡眠，今日运动
                            @[@"10",@"10",@"10",@"10"]];//5大 + 1小
    CGFloat   size = [ToolFontFit getScreenFitWithValues:specialArr[type]];
    return [UIFont systemFontOfSize:size];
}

//按钮字体
+(UIFont *)getFontButtonSizeWithType:(NSInteger)type{
    NSArray *buttonArr = @[@[@"21",@"21",@"21",@"21"],  //大按钮
                           @[@"17",@"17",@"17",@"17"],  //中按钮
                           @[@"15",@"15",@"15",@"15"],  //小按钮1
                           @[@"14",@"14",@"14",@"14"]]; //小按钮2
    CGFloat   size = [ToolFontFit getScreenFitWithValues:buttonArr[type]];
    return [UIFont systemFontOfSize:size];
}

+(void)setFontFromLabel:(UILabel *)label  FontType:(LabelFontType )fontType WithType:(NSInteger)type {
    
    UIFont *font;
    switch (fontType) {
        case FontTypeNormal:
            font = [self getFontNormalSizeWithType:type];
        
            break;
        case FontTypeSpecial:
            font = [self getFontSpecialSizeWithType:type];
            break;
        case FontTypeButton:
            font = [self getFontButtonSizeWithType:type];
            break;
        default:
            font = [self getFontSpecialSizeWithType:type];
            
            break;
    }
    [label setFont:font];
   
    
}



//获得设备型号
+ (NSString *)getCurrentDeviceModel
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6Plus";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone7Plus";
    
    //iPod Touch
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPodTouch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPodTouch2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPodTouch3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPodTouch4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPodTouch5G";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPodTouch6G";
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad4";
    
    //iPad Air
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPadAir2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPadAir2";
    
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPadmini4";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPadmini4";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhoneSimulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhoneSimulator";
    return platform;
}





@end
