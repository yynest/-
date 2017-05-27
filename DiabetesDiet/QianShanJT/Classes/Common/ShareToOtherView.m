//
//  ShareToOtherView.m
//  QianShanJY
//
//  Created by lxl on 16/3/14.
//  Copyright © 2016年 _shareParam. All rights reserved.
//

#import "ShareToOtherView.h"
#import "SocialService.h"
#import "ToolBox.h"
#import "ToolFontFit.h"
#import "CustomNavigationController.h"
@implementation ShareToOtherView
{
    UIButton *transparentView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithShareParam:(NSDictionary*)shareParam
{
    self = [super init];
    if (self) {
        CGFloat totalHeight = 204.0;
        self.frame = CGRectMake(0, MAIN_SCREEN_HEIGHT - totalHeight,  MAIN_SCREEN_WIDTH, totalHeight);
        self.backgroundColor = [UIColor whiteColor];
        
        [self setBackGroundView];
        [self presentShareView];
        [self addCancelBtn];
        _shareParam = shareParam;
    }
    return self;
}


- (void)presentShareView
{
    UIView *shareView = [[UIView alloc] initWithFrame:CGRectMake(0, 24, MAIN_SCREEN_WIDTH, 104)];
    
    CGFloat btnWidth = MAIN_SCREEN_WIDTH/3;
    CGFloat laberHeight = 20;
    CGFloat btnHeight = 64;
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    [button1 setImage:[UIImage imageNamed:@"shareWeChat"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(shareOtherPlat1Event) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:button1];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 74, btnWidth, laberHeight)];
    label1.textColor = [UIColor grayColor];
    label1.text = @"微信好友";
    label1.textAlignment = NSTextAlignmentCenter;
    [ToolFontFit setFontFromLabel:label1 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    [shareView addSubview:label1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(btnWidth, 0, btnWidth, btnHeight);
    [button2 setImage:[UIImage imageNamed:@"shareFriend"] forState:UIControlStateNormal];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(btnWidth, 74, btnWidth, laberHeight)];
    label2.textColor = [UIColor grayColor];
    label2.text = @"朋友圈";
    label2.textAlignment = NSTextAlignmentCenter;
    [ToolFontFit setFontFromLabel:label2 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    [shareView addSubview:label2];
    [button2 addTarget:self action:@selector(shareOtherPlat2Event) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:button2];
    
    if (![ToolBox isInstalledWithAppIdentifier:@"wechat"]) {
        button1.enabled = NO;
        button2.enabled = NO;
    }
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(btnWidth*2, 0, btnWidth, btnHeight);
    [button3 setImage:[UIImage imageNamed:@"shareMsg"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(shareOtherPlat3Event) forControlEvents:UIControlEventTouchUpInside];
    [shareView addSubview:button3];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(btnWidth*2, 74, btnWidth, laberHeight)];
    label3.textColor = [UIColor grayColor];
    label3.text = @"短信";
    label3.textAlignment = NSTextAlignmentCenter;
    [ToolFontFit setFontFromLabel:label3 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    [shareView addSubview:label3];

    
    [self addSubview:shareView];
}

- (void)addCancelBtn
{
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 204.0 - 60 , MAIN_SCREEN_WIDTH, 60);
    cancelBtn.backgroundColor = [UIColor whiteColor];
    [cancelBtn setTitle:@"取 消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    [ToolFontFit setFontFromLabel:cancelBtn.titleLabel FontType:FontTypeButton WithType:ButtonFontTypemiddle];
    cancelBtn.layer.borderColor = [UIColor colorBorderGargLighter].CGColor;
    cancelBtn.layer.borderWidth = 0.5;
    [cancelBtn addTarget:self action:@selector(cancelEvent) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
}


- (void)shareOtherPlat1Event
{
    //微信好友
    [[SocialService sharedInstance] sharetoWechat:_shareParam type:QSWXSceneSession];
    [self dismissView];
}
-(void)shareOtherPlat2Event
{
    //朋友圈
    [[SocialService sharedInstance] sharetoWechat:_shareParam type:QSWXSceneTimeline] ;
    [self dismissView];

}
- (void)shareOtherPlat3Event
{
    [self sendMessage:[_shareParam objectForKey:ShareUrl]];
    [self dismissView];

}
- (void)shareOtherPlat4Event
{
    //[[SocialService sharedInstance] shareToQQ:_shareParam];
    [self dismissView];

}

- (void)cancelEvent
{
    [self dismissView];
}

- (void)setBackGroundView
{
    transparentView = [UIButton buttonWithType:UIButtonTypeCustom];
    transparentView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
    [transparentView addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    transparentView.backgroundColor = [UIColor halfAlphaColor];
}

- (void)showView
{
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    [keyWindow addSubview:transparentView];
    [keyWindow addSubview:self];
}

- (void)dismissView
{
    [transparentView removeFromSuperview];
    [self removeFromSuperview];
}


//获取当前ViewController
- (UIViewController *)currentVisibleController
{
    UIViewController *topController = self.currentVisibleWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

- (UIWindow *)currentVisibleWindow
{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows){
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            return window;
        }
    }
    return [[[UIApplication sharedApplication] delegate] window];
}


//在app中调其系统的短信发送页面
- (void)sendMessage:(NSString *)content
{
    //实例化MFMessageComposeViewController,并设置委托
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.delegate = self;
    messageController.messageComposeDelegate = self;
    
    //拼接并设置短信内容
    NSString *messageContent = content;
    messageController.body = messageContent;
    //设置发送给谁
    //messageController.recipients = @[@"199999999"];
    //推到发送试图控制器
    [self.currentVisibleController presentViewController:messageController animated:YES completion:^{
    }];
}

//发送短信后回调的方法
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            //tipContent = @"发送短信已";
            break;
        case MessageComposeResultFailed:
            //tipContent = @"发送短信失败";
            break;
        case MessageComposeResultSent:
            //tipContent = @"发送成功";
            break;
            
        default:
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

@end
