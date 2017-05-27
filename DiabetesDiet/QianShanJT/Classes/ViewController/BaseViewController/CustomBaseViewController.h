//
//  BaseViewController.h
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"


#import "QSBaseRequest.h"
#import "UserInfoService.h"
#import "EmptyViewTips.h"
#import "ToolFontFit.h"
#import "QNManager.h"
#import "ToolFontFit.h"
#define kNavLeft  [self setNavLeftImage:@"return"]
#define kMoreNavLeftTag 10000
#define kMoreNavRightTag 20000
@interface CustomBaseViewController : UIViewController
{
    CGFloat viewWidth;
    CGFloat viewHeight;
    EmptyViewTips *emptyViewTips;
}
@property (nonatomic, strong)NSString *navTitle;
@property (nonatomic, strong)NSString *NavLeftImage;        //导航左按钮图片名
@property (nonatomic, strong)NSString *NavRightImage;       //导航右按钮图片名
@property (nonatomic, strong)NSArray  *NavLeftImageArray;  //导航右侧多按钮图片
@property (nonatomic, strong)NSArray  *NavRightImageArray;  //导航右侧多按钮图片

- (void)navLeftBut:(UIButton *)sender;          //导航左侧按钮点击方法
- (void)navRightBut:(UIButton *)sender;         //导航右侧按钮点击方法
///导航多个左侧按钮点击方法（tag值越小，越靠前, tag值从10000开始）
- (void)moreNavLeftBut:(UIButton *)sender;
///导航多个右侧按钮点击方法(tag值越小，越靠后, tag值从20000开始)
- (void)moreNavRightBut:(UIButton *)sender;

//空页面
- (void)addEmptyViewWithType:(EmptyViewType)type withTitle:(NSString *)title;
- (void)removeEmptyView;

//设置状态栏样式:YES-UIStatusBarStyleDefault，NO-UIStatusBarStyleLightContent.默认为YES
- (void)setStatusBarStyle:(BOOL)isDefault;
//设置导航栏字体颜色
-(void)setNavTitleColor:(UIColor *)color;

//UIAlert xiangfeng
- (void)showAlertController:(NSString *)message buttons:(NSArray *)btList viewTag:(int)tag;
- (void)clickedCancelEventTag:(int)tag;
- (void)clickedOKEventTag:(int)tag;


//xiaomei
-(void)showActionSheet;
-(void)clickPhoto;
-(void)clickCamera;


//底部按钮
- (void)addBottonButton:(NSString *)title withFrame:(CGRect)frame;
- (void)clickedBottonButton;

//xiaomei
-(UIButton *)getBtnWithTitle:(NSString *)titleStr Tag:(NSInteger )tag;
-(void)clickBtnWithTag:(NSInteger)btnTag;
@end
