//
//  XMTextView.h
//  QianShanJY
//
//  Created by Xiaomei on 16/9/8.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMTextView : UITextView
{
    BOOL _shouldDrawPlaceholder;
}

@property (nonatomic) NSString *placeholder;
@property (nonatomic) UIColor *placeholderColor;
@end
