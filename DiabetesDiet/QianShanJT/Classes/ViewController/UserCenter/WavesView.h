//
//  WavesView.h
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/10.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WavesBlock)(CGRect myFrame);

@interface WavesView : UIImageView

/**
 *  浪弯曲度
 */
@property (nonatomic, assign) CGFloat waveCurvature;
/**
 *  浪速
 */
@property (nonatomic, assign) CGFloat waveSpeed;
/**
 *  浪高
 */
@property (nonatomic, assign) CGFloat waveHeight;
/**
 *  实浪颜色
 */
@property (nonatomic, strong) UIColor *realWaveColor;
/**
 *  遮罩浪颜色
 */
@property (nonatomic, strong) UIColor *maskWaveColor;

@property (nonatomic, copy) WavesBlock waveBlock;

@property (nonatomic , assign)CGRect imageFrame;


- (void)stopWaveAnimation;

- (void)startWaveAnimation;
@end
