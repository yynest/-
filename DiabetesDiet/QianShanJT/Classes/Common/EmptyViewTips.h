//
//  EmptyViewTips.h
//  QianShanJY
//
//  Created by iosdev on 15/12/9.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EmptyViewType) {
    EmptyViewTypeNoNetwork = 0,           //网络连接不可用
    EmptyViewTypeNOData,                  //暂时没有数据
};

@interface EmptyViewTips : UIView

@property(nonatomic,assign)EmptyViewType type;

- (instancetype)initWithFrame:(CGRect)frame withType:(EmptyViewType)type withTitle:(NSString *)title;

@end
