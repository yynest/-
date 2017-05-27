//
//  InputTextField.m
//  QianShanJY
//
//  Created by Xiaomei on 2017/3/24.
//  Copyright © 2017年 chinasun. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
    
}

//控制显示文本的位置

- (CGRect)textRectForBounds:(CGRect)bounds{
    
    CGRect inset = CGRectMake(bounds.origin.x + 15, bounds.origin.y, bounds.size.width - 15, bounds.size.height);
    
    return inset;
    
}

//控制编辑文本的位置

- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect inset = CGRectMake(bounds.origin.x + 15, bounds.origin.y, bounds.size.width - 15, bounds.size.height);
    
    return inset;
    
}

// 控制placeHolder的位置，往右缩 56 （这是左视图和距离左边边距的和）

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 15, 0);  //或者这样写简单些
    
}

@end
