//
//  UCShareAPP.m
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/22.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "UCShareAPP.h"
#import "UIViewExt.h"
#import "SocialService.h"
#import "QrcodeModel.h"
#import "QrcodeData.h"

@interface UCShareAPP ()

@end

@implementation UCShareAPP
{
    NSMutableDictionary *sharePara;//分享参数
    NSString *appDownUrl;          //app下载地址
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"分享APP";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, viewWidth, 20)];
    label.textColor = [UIColor colorTextGrag];
    label.text = @"扫描下载千山降糖";
    label.textAlignment = NSTextAlignmentCenter;
    [ToolFontFit setFontFromLabel:label FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    [self.view  addSubview:label];
    
    appDownUrl = [NSString stringWithFormat:@"%@",@"http://chinasunhealth.com/m/appH5/"];
    sharePara = [[NSMutableDictionary alloc] init];
    
    [sharePara sf_setObject:appDownUrl forKey:ShareUrl];
    [sharePara sf_setObject:[NSString stringWithFormat:@"%@", @"千山降糖"] forKey:ShareFirstTitle];
    [sharePara sf_setObject:@"千山降糖" forKey:ShareSubTitle];
    [sharePara sf_setObject:[UserInfoService sharedInstance].headerUrl forKey:ShareImage];

    
    UIImageView *codeImg = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2 - 80, 80, 160, 160)];
    codeImg.image = [ToolBox getQRcode:appDownUrl centerImage:[UserInfoService sharedInstance].headerImage QRsize:CGSizeMake(200, 200)];
    [self.view addSubview:codeImg];


    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake([ToolScreenFit getHeightWithControlHeight:50], 270, viewWidth - [ToolScreenFit getHeightWithControlHeight:50]*2 , 1)];
    lineView.backgroundColor = [UIColor colorBorderGargLighter];
    [self.view addSubview:lineView];
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, lineView.bottom + 30, viewWidth, 20)];
    label1.textColor = [UIColor colorTextGrag];
    label1.text = @"还可以通过以下方式分享";
    label1.textAlignment = NSTextAlignmentCenter;
    [ToolFontFit setFontFromLabel:label1 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    [self.view  addSubview:label1];
    NSArray *shareImgs = @[@"shareWeChat",@"shareFriend",@"shareMsg"];
    NSArray *textArray = @[@"分享到微信",@"分享到朋友圈",@"短信分享"];
    
    for (int i = 0 ; i < 3 ; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn addTarget:self action:@selector(OnShareEvent:) forControlEvents:UIControlEventTouchUpInside];
       
        if (i == 0) {
         btn.frame = CGRectMake(35  , label1.bottom + 20, 90 , 80);
        }else if (i == 1){
         btn.frame = CGRectMake(viewWidth/3  , label1.bottom + 20, viewWidth /3 , 80);
        }else if (i == 2){
        btn.frame = CGRectMake(viewWidth - 120  , label1.bottom + 20, 80 , 80);
        }
//        btn.layer.borderColor = [UIColor colorBorderGargLighter].CGColor;
//        btn.layer.borderWidth = 1;
        [btn setImage:[UIImage imageNamed:shareImgs[i]] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(btn.left, btn.bottom , btn.bounds.size.width, 40)];
        label.textColor = [UIColor colorTextGrag];
        label.text = textArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        [ToolFontFit setFontFromLabel:label FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
        [self.view addSubview:label];
        
    }
}

- (void)OnShareEvent:(UIButton *)send
{
    if (send.tag == 0) {
        //分享到微信好友
        [[SocialService sharedInstance] sharetoWechat:sharePara type:QSWXSceneSession];

    }else if (send.tag == 1){
        //分享到朋友圈
        [[SocialService sharedInstance] sharetoWechat:sharePara type:QSWXSceneTimeline] ;

    }else if (send.tag == 2){
        //短信分享
         [self sendMessage:appDownUrl];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self presentViewController:messageController animated:YES completion:^{
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
