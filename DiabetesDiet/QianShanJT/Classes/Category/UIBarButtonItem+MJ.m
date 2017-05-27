//
//  UIBarButtonItem+MJ.m
//  xiwang
//
//  Created by duanhongiang on 15/9/3.
//  Copyright (c) 2015年 xiwang. All rights reserved.
//

#import "UIBarButtonItem+MJ.h"

@implementation UIBarButtonItem (MJ)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    if (highIcon && highIcon.length > 0) {
         [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    }

    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)moreItemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    if (highIcon && highIcon.length > 0) {
        [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    }
    button.tag = tag;
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}



+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon butTitle:(NSString *)butTitle highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:butTitle forState:UIControlStateNormal];

    if (icon && icon.length > 0) {
        [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    }else{
    
        button.frame = (CGRect){CGPointZero, {70.0f,45.0f}};
    }
    
    if (highIcon && highIcon.length > 0) {
        [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    }
    
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
