//
//  YYAnimationIndicator.m
//  AnimationIndicator
//
//  Created by 王园园 on 14-8-26.
//  Copyright (c) 2014年 王园园. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "YYAnimationIndicator.h"
#import "UIColor+Custom.h"
@interface YYAnimationIndicator(){
    UIImageView *imageView;
    UILabel *Infolabel;
    UIButton *bt_update;
    UIView *bigView;
}

@end

@implementation YYAnimationIndicator

- (id)initWithFrame:(CGRect)frame imageSize:(CGSize)imageSize
{
    self = [super initWithFrame:frame];
    if (self) {
        _duration = 0.4;
        _infoColor = [UIColor colorTextGrag];
        self.backgroundColor = [UIColor clearColor];
        
        CGRect rect = CGRectMake((frame.size.width - imageSize.width)/2, (frame.size.height*3/4-64 - imageSize.height)/2, imageSize.width, imageSize.height);
        imageView = [[UIImageView alloc] initWithFrame:rect];
        imageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"animation1"],[UIImage imageNamed:@"animation2"],[UIImage imageNamed:@"animation3"],[UIImage imageNamed:@"animation4"], nil];
        [self addSubview:imageView];
        
        Infolabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rect), frame.size.width, 20)];
        Infolabel.backgroundColor = [UIColor clearColor];
        Infolabel.textAlignment = NSTextAlignmentCenter;

        [self addSubview:Infolabel];
        self.layer.hidden = YES;
    }
    return self;
}


- (void)startAnimation{
    self.layer.hidden = NO;
    [self doAnimation];
}

- (void)showAndstartAnimation:(UIViewController *)viewController{
    if (_bgColor) {
        bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewController.view.frame.size.width, viewController.view.frame.size.height)];
        bigView.backgroundColor = _bgColor;
        [viewController.view addSubview:bigView];
    }
    
    [viewController.view addSubview:self];
    [self startAnimation];
}

-(void)doAnimation{
    Infolabel.text = _loadtext;
    Infolabel.textColor = _infoColor;
    //设置动画总时间
    imageView.animationDuration=_duration;
    //设置重复次数,0表示不重复
    imageView.animationRepeatCount=0;
    //开始动画
    [imageView startAnimating];
}

- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type
{
    Infolabel.text = text;
    if(type){
        [self performSelector:@selector(stopAnimationAction) withObject:nil/*可传任意类型参数*/ afterDelay:1.0];
        [UIView animateWithDuration:1.2f animations:^{
        } completion:^(BOOL finished) {
            [imageView stopAnimating];
            self.hidden = YES;
            [bigView removeFromSuperview];
            //self.alpha = 1;
        }];
    }else{
        [imageView stopAnimating];
        [imageView setImage:[UIImage imageNamed:@"animation3"]];
    }
}

- (void)stopAnimationWithDelay:(NSInteger)delay
{
    //防止动画过快，至少运行1S
    [self performSelector:@selector(stopAnimationAction) withObject:nil/*可传任意类型参数*/ afterDelay:delay];
}

- (void)stopAnimationAction
{
    [imageView stopAnimating];
    self.hidden = YES;
    [bigView removeFromSuperview];
}

-(void)setLoadText:(NSString *)text;{
    if(text){
        _loadtext = text;
        Infolabel.text = _loadtext;
    }
}

- (void)setImgList:(NSArray *)imgList{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSString *str in imgList) {
        [array addObject:[UIImage imageNamed:str]];
    }
    //设置动画帧
    imageView.animationImages = array;
}

@end
