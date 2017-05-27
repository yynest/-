//
//  EmptyViewTips.m
//  QianShanJY
//
//  Created by iosdev on 15/12/9.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import "EmptyViewTips.h"

@interface EmptyViewTips () {
    NSArray *imgList;
    NSArray *tipList;
}

@end

@implementation EmptyViewTips

- (instancetype)initWithFrame:(CGRect)frame withType:(EmptyViewType)type withTitle:(NSString *)title {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat width = CGRectGetWidth(frame);
        CGFloat height = CGRectGetHeight(frame);
        NSString *imgString = @"no_data";
        if (type == EmptyViewTypeNoNetwork) {
            imgString = @"no_network";
            title = @"网络连接不可用";
        }
        
        int imgWidth = width/3;
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(imgWidth, height/6, imgWidth, imgWidth)];
        imgView.image = [UIImage imageNamed:imgString];
        [self addSubview:imgView];
        CGRect rect = imgView.frame;
        
        UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rect)+15, width, 20)];
        tipLabel.text = title;
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.textColor = [UIColor colorTextGrag];
        
        [self addSubview:tipLabel];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}

@end
