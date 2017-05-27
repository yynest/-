//
//  YYAnimationIndicator.h
//  AnimationIndicator
//
//  Created by 王园园 on 14-8-26.
//  Copyright (c) 2014年 王园园. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

@interface YYAnimationIndicator : UIView

@property (nonatomic, strong) NSString *loadtext;
@property (nonatomic, strong) NSArray *imgList;
@property (nonatomic,assign) float duration;
@property (nonatomic,weak) UIColor *infoColor;

@property (nonatomic,weak) UIColor *bgColor;

- (void)showAndstartAnimation:(UIViewController *)viewController;
- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;

- (id)initWithFrame:(CGRect)frame imageSize:(CGSize)imageSize;

- (void)stopAnimationWithDelay:(NSInteger)delay;

@end
