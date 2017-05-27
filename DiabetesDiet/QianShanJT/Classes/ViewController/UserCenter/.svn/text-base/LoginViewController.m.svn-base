//
//  LoginViewController.m
//  QianShanJT
//
//  Created by iosdev on 2017/5/3.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "LoginViewController.h"
#import "WebLoadH5VC.h"

//用户手机号码登录
#import "QSBaseRequest.h"
#import "LoginUserInfoTokenMsg.h"
#import "LoginUserInfoData.h"
#import "LoginUserInfoPicture.h"
#import "LoginUserInfoModel.h"
#import "LoginUserInfoUser.h"
#import "RegexVerifyTool.h"
#import "ToolScreenFit.h"
#import "ToolFontFit.h"
#import "MainTabBarVC.h"
#import "SocialService.h"
#import "XZMStatusBarHUD.h"
#import "LoginBindController.h"


@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic, strong)UITextField *mobileField;
@property(nonatomic, strong)UITextField *codeField;
@property(nonatomic, strong)UIButton *codeBtn;
@property(nonatomic, strong)UIButton *loginBtn;
@property(nonatomic, strong)UIButton *wechatBtn;
@property(nonatomic, strong)UIView *tipView;

@property (strong, nonatomic) NSTimer *countDownTimer;
@property (assign, nonatomic) int secondsCountDown;

@property(strong,nonatomic) UIView      *baseView;
@property(strong,nonatomic) UIImageView *imageView;


@end

@implementation LoginViewController{
    BOOL baseViewIsHidden;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"登录";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prepareUi];
    
    // 重置定时器
    [self.countDownTimer invalidate];
    self.countDownTimer = nil;
    self.secondsCountDown = 60;
    baseViewIsHidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiWechatLogin) name:Notifi_Wechat_Login object:nil];
    
}

#pragma mark - 通知

- (void)notiWechatLogin
{
    [self.navigationController pushViewController:[[LoginBindController alloc] init] animated:YES];

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 界面

- (void)prepareUi{
    
    CGFloat offsetY = 0;
    if (IS_IPHONE_6P) {
        offsetY = 30;
    }
    
    //千山降糖logo 369:90
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.image = [UIImage imageNamed:@"QsjtText"];
    logoView.frame = CGRectMake(viewWidth/2 - 369/4, 90 + offsetY, 369/2, 90/2);
    [self.view addSubview:logoView];
    
    //手机号输入
    _mobileField = [[UITextField alloc] init];
    _mobileField.delegate = self;
    _mobileField.keyboardType = UIKeyboardTypeNumberPad;
    _mobileField.backgroundColor = [UIColor colorBGGragLighter];
    _mobileField.textColor = [UIColor colorTextBlack];
    _mobileField.layer.cornerRadius = 25.0;
    [_mobileField setTintColor:[UIColor colorMainGreen]];
    _mobileField.frame = CGRectMake(30, CGRectGetMaxY(logoView.frame) + 30, viewWidth - 60, 50);
    _mobileField.placeholder = @"输入手机号";
    [_mobileField addTarget:self action:@selector(TFChange:) forControlEvents:UIControlEventEditingChanged];

    CGRect frame = _mobileField.frame;
    frame.size.width = 20.0;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    _mobileField.leftViewMode = UITextFieldViewModeAlways;
    _mobileField.leftView = leftview;
    [self.view addSubview:_mobileField];
    
    //验证码输入
    _codeField = [[UITextField alloc] init];
    _codeField.delegate = self;
    _codeField.backgroundColor = [UIColor colorBGGragLighter];
    _codeField.textColor = [UIColor colorTextBlack];
    _codeField.layer.cornerRadius = 25.0;
    [_codeField setTintColor:[UIColor colorMainGreen]];
    _codeField.keyboardType = UIKeyboardTypeNumberPad;

    _codeField.frame = CGRectMake(30, CGRectGetMaxY(_mobileField.frame) + 10, viewWidth - 60, 50);
    _codeField.placeholder = @"输入验证码";
    CGRect frame2 = _mobileField.frame;
    frame2.size.width = 20.0;
    UIView *leftview2 = [[UIView alloc] initWithFrame:frame2];
    _codeField.leftViewMode = UITextFieldViewModeAlways;
    _codeField.leftView = leftview2;
    [self.view addSubview:_codeField];
    
    //竖线
    UIView *spView = [[UIView alloc] init];
    spView.frame = CGRectMake(CGRectGetWidth(_mobileField.frame) - 110, 5, 0.5, CGRectGetHeight(_mobileField.frame) - 10);
    spView.backgroundColor = [UIColor colorBorderGargLighter];
    [_mobileField addSubview:spView];
    
    //验证码发送
    _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _codeBtn.backgroundColor = [UIColor clearColor];
    _codeBtn.frame = CGRectMake(CGRectGetMaxX(_mobileField.frame) - 109, CGRectGetMaxY(logoView.frame) + 30, 109, CGRectGetHeight(_mobileField.frame));
    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateHighlighted];
    [_codeBtn setTitleColor:[UIColor colorTextGragLight] forState:UIControlStateNormal];
    [_codeBtn setTitleColor:[UIColor colorClikcdBTGreen] forState:UIControlStateHighlighted];
    _codeBtn.enabled = NO;
    [_codeBtn addTarget:self action:@selector(requestApiWithSendVerifyCode) forControlEvents:UIControlEventTouchUpInside];
    [ToolFontFit setFontFromLabel:_codeBtn.titleLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
    [self.view addSubview:_codeBtn];
    
    //千山降糖服务条款
    
    _tipView = [[UIView alloc] init];
    _tipView.frame = CGRectMake(0, CGRectGetMaxY(_codeField.frame) + 20, viewWidth, 20);
    [self.view addSubview:_tipView];
    
    CGFloat  allWidth = [ToolBox widthForString:@"点开始即表示已阅读并同意" fontSize:[ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation]];
     CGFloat  btnWidth = [ToolBox widthForString:@"《千山降糖服务条款》" fontSize:[ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation]];
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.frame = CGRectMake(viewWidth/2 - (allWidth + btnWidth)/2, 0, allWidth, 20);
    tipLabel.text = [NSString stringWithFormat:@"%@",@"点开始即表示已阅读并同意"];
    tipLabel.textColor = [UIColor colorTextGragLight];
    tipLabel.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(CGRectGetMaxX(tipLabel.frame), 0, btnWidth, 20);
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   
                                   [ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation],NSFontAttributeName,
                                   
                                   [UIColor colorMainGreen],NSForegroundColorAttributeName,nil];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"《千山降糖服务条款》"  attributes:attributeDict];
    //NSRange strRange = {0,[str length]};
    //[str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [btn setAttributedTitle:str forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(OnClickServiceTips) forControlEvents:UIControlEventTouchUpInside];
    [_tipView addSubview:tipLabel];
    [_tipView addSubview:btn];
    //登录
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
  
    [_loginBtn setTitle:@"开始" forState:UIControlStateNormal];
    [_loginBtn setTitle:@"开始" forState:UIControlStateHighlighted];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:19.0];
    //长宽比 623:153
    _loginBtn.frame = CGRectMake(30, CGRectGetMaxY(_codeField.frame) + 50, viewWidth - 60 , 153*(viewWidth - 60)/623);
    [_loginBtn addTarget:self action:@selector(requestApiWithLoginMobile) forControlEvents:UIControlEventTouchUpInside];
    [self setLoginBtnStatus:NO];
    [self.view addSubview:_loginBtn];
    
    
    _wechatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _wechatBtn.frame = CGRectMake(viewWidth/2 - 60, viewHeight - 70, 120, 40);
    [_wechatBtn setTitle:@"微信登录" forState:UIControlStateNormal];
    [_wechatBtn setTitle:@"微信登录" forState:UIControlStateHighlighted];

    [_wechatBtn setImage:[UIImage imageNamed:@"loginWechat"] forState:UIControlStateNormal];
    [_wechatBtn setImage:[UIImage imageNamed:@"loginWechatHigh"] forState:UIControlStateHighlighted];
    
    [_wechatBtn setTitleColor:[UIColor colorTextGragLight] forState:UIControlStateNormal];
    [_wechatBtn setTitleColor:[UIColor colorTextGrag] forState:UIControlStateHighlighted];
    [ToolFontFit setFontFromLabel:_wechatBtn.titleLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
    _wechatBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [_wechatBtn addTarget:self action:@selector(OnWechatLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_wechatBtn];
    
}

- (void)setLoginBtnStatus:(BOOL)enable
{
    _loginBtn.enabled = enable;

    if (enable) {
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"loginBk"] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"loginBkHigh"] forState:UIControlStateHighlighted];
    }else{
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"loginDisable"] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"loginDisable"] forState:UIControlStateHighlighted];
    }
}

-(UIView *)baseView{
    
    if (_baseView == nil) {
        _baseView = [[UIView alloc]init];
        [self.view insertSubview:self.baseView belowSubview:_codeField];
    }
    
    return _baseView;
}

-(UIImageView *)imageView{
    
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginVoice"]];
        _imageView.frame = CGRectMake(0, 0 , viewWidth - 60, 50);
        _imageView.userInteractionEnabled = YES;
        [self.baseView addSubview:_imageView];
    }
    return _imageView;
}

- (void)OnWechatLogin
{
    [[SocialService sharedInstance] LoginWechat];

}

- (void)OnClickServiceTips
{
    WebLoadH5VC *h5VC = [[WebLoadH5VC alloc] init];
    h5VC.navTitle = @"千山降糖服务条款";
    h5VC.loadUrl = @"/protocol/softagreement";
    [self.navigationController pushViewController:h5VC animated:YES];
}


#pragma mark - UITextFieldDelegate

// 收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 控制验证码和手机号码输入框的输入字符个数限制
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _mobileField) {
        if (textField.text.length > 10) {
            
            if (string.length == 0) {
                return YES;
            }
            else {
                return NO;
            }
        }else {
            return YES;
        }
    }
    else if (textField == _codeField) {
        if (textField.text.length > 3) {
            if (string.length == 0) {
                return YES;
            }
            else {
                return NO;
            }
        }
        else {
            return YES;
        }
    }
    else {
        return YES;
    }
}

-(void)TFChange:(UITextField *)tf{
    if (_mobileField.text.length == 11 && self.secondsCountDown == 60) {
        [self setEnableRequestVerifyCodeButton:YES];
        [self setLoginBtnStatus:YES];

    }
    else {
        [self setEnableRequestVerifyCodeButton:NO];

    }
}

- (void)setEnableRequestVerifyCodeButton:(BOOL)enable
{
    // 正确输入手机号之前按钮无法点击
    [_codeBtn setEnabled:enable];
    if (enable) {
        [_codeBtn setTitleColor:[UIColor colorMainGreen] forState:UIControlStateNormal];
        [_codeBtn setTitleColor:[UIColor colorClikcdBTGreen] forState:UIControlStateHighlighted];
    }
    else {
        [_codeBtn setTitleColor:[UIColor colorTextGragLight] forState:UIControlStateNormal];
        [_codeBtn setTitleColor:[UIColor colorTextGragLight] forState:UIControlStateHighlighted];
    }
}

#pragma mark - 网络请求
//发送短信验证码接口

- (void)requestApiWithSendVerifyCode {
    
    [self.view endEditing:YES];
    
    if (!baseViewIsHidden) {
        baseViewIsHidden = YES;
        [UIView animateWithDuration:1.0 // 动画时长
                              delay:0.0 // 动画延迟
                            options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                         animations:^{
                             // code...
                             self.baseView.transform = CGAffineTransformMakeTranslation(0, 0);
                             
                             _tipView.transform = CGAffineTransformMakeTranslation(0, 0);
                             _loginBtn.transform = CGAffineTransformMakeTranslation(0, 0);
                             
                         }
                         completion:^(BOOL finished) {
                             // 动画完成后执行
                             // code...
                         }];
    }

    if (![RegexVerifyTool regexVerifyWithMobilePhone:_mobileField.text]) {
        [SVProgressHUD showInfoWithStatus:QSText(@"手机号输入有误")];
        return;
    }
    [_codeBtn setEnabled:NO];

    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:_mobileField.text forKey:@"mobile"];
    //smsType (integer, optional): 验证码类型 0 短信验证码 1 语音验证码
    //source (integer, optional): 验证码源 1 登录验证 2 第三方身份绑定
    [dic sf_setObject:[NSNumber numberWithInt:0] forKey:@"smsType"];
    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"source"];
    NSString *url = @"/sms/sendVerifyCode";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            //倒计时秒数颜色为绿色
            [_codeBtn setTitleColor:[UIColor colorMainGreen] forState:UIControlStateNormal];
            
        }
        else{
            _secondsCountDown = 0;
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
        }
    } failure:^(QSBaseRequest *request) {
        _secondsCountDown = 0;
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
    }];
    
    // 开启倒计时
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
}

//开始登录
- (void)requestApiWithLoginMobile {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:_mobileField.text forKey:@"mobile"];
    [dic sf_setObject:_codeField.text forKey:@"verifyCode"];
    NSString *url = @"/user/login/mobile";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            LoginUserInfoModel *model = [LoginUserInfoModel modelObjectWithDictionary:request.responseJSONObject];
            DLog(@"接口数据:%@",model);
            //保存id
            [UserInfoService sharedInstance].userId = [NSNumber numberWithDouble:model.data.user.userIdentifier];
            [UserDefaultsHelper setLoginUserID:[UserInfoService sharedInstance].userId];
            //保存token
            [UserDefaultsHelper setAccessToken:model.data.tokenMsg.accessToken];
            [UserDefaultsHelper setAccessToken:model.data.tokenMsg.refreshToken];
            
            UIViewController *vc;
            vc = [[MainTabBarVC alloc] init];
            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:vc];

        }
        else{
            [self showReturnTipView:request.responseStatusString];
        }
    } failure:^(QSBaseRequest *request) {
        [self showReturnTipView:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
    }];
}
- (void)showReturnTipView:(NSString *)Str
{
    [[XZMStatusBarHUD sharedXZMStatusBarHUD] showError:Str position:0 animaDelay:0 configuration:^() {
        
        /** 设置透明度 */
        [XZMStatusBarHUD sharedXZMStatusBarHUD].statusAlpha = 1.0;
        
        /** 设置提醒框高度 */
        [XZMStatusBarHUD sharedXZMStatusBarHUD].statusH = 70;
        
        /** 设置文字富文本属性 */
        NSMutableDictionary *dict = @{}.mutableCopy;
        dict[NSFontAttributeName] = [UIFont systemFontOfSize:16];
        dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [XZMStatusBarHUD sharedXZMStatusBarHUD].attributedText = dict;
    }];
}




// 倒计时器
- (void)startTimer
{
    self.secondsCountDown--;
    if (self.secondsCountDown <= 0) {
        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.secondsCountDown = 60;
        [self setEnableRequestVerifyCodeButton:YES];
        DLog(@"已经倒计时完了 但是还没输入验证码");
        if (!baseViewIsHidden) {
            for (UIView *view in self.imageView.subviews) {
                [view removeFromSuperview];
            }
            for (UIButton *btn in self.imageView.subviews) {
                [btn removeFromSuperview];
            }
            
            [self addLabelAndBtn];
            
        }else{
            [self shouView];
        }
    }
    else {
        NSString *leftTime = [NSString stringWithFormat:@"%ds", self.secondsCountDown];
        [_codeBtn setTitle:leftTime forState:UIControlStateNormal];
    }
}


//弹出提示语   语音验证码
-(void)shouView{
    self.baseView.frame = CGRectMake(30, CGRectGetMaxY(_codeField.frame) - 50, viewWidth - 60, 50);
    [self addLabelAndBtn];
    baseViewIsHidden = NO;
    [UIView animateWithDuration:1.0 // 动画时长
                          delay:0.0 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                     animations:^{
                         // code...
                         
                         self.baseView.transform = CGAffineTransformMakeTranslation(0, 50);
                         
                         _tipView.transform = CGAffineTransformMakeTranslation(0, 50);
                         _loginBtn.transform = CGAffineTransformMakeTranslation(0, 50);
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

-(void)addLabelAndBtn{


    baseViewIsHidden = NO;
    for (UIView *view in self.imageView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat  allWidth = [ToolBox widthForString:@"长时间未收到短信?点击语音验证码" fontSize:[ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2]];
    CGFloat  firstWidth = [ToolBox widthForString:@"长时间未收到短信?点击" fontSize:[ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, firstWidth, 50)];
    label.text = @"长时间未收到短信?点击";
    label.textColor = [UIColor colorTextBlack];
    label.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2];
    [self.imageView addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(CGRectGetMaxX(label.frame) , 5, allWidth - firstWidth, 50);
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   
                                   [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2],NSFontAttributeName,
                                   
                                   [UIColor colorMainGreen],NSForegroundColorAttributeName,nil];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"语音验证码"  attributes:attributeDict];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [btn setAttributedTitle:str forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
    [self.imageView addSubview:btn];
    
}

//请求语音验证码
-(void)getCode{
    baseViewIsHidden = NO;
    for (UIView *view in self.imageView.subviews) {
        [view removeFromSuperview];
    }
    for (UIButton *btn in self.imageView.subviews) {
        [btn removeFromSuperview];
    }
    CGFloat  Width = [ToolBox widthForString:@"我们会以电话方式告知,请注意接听" fontSize:[ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2]];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, Width, 50)];
    label.text = @"我们会以电话方式告知,请注意接听";
    label.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2];
    label.textColor = [UIColor colorTextBlack];
    label.textAlignment = NSTextAlignmentLeft;
    [self.imageView addSubview:label];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:_mobileField.text forKey:@"mobile"];
    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"smsType"];
    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"source"];
    NSString *url = @"/sms/sendVerifyCode";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            [_codeBtn setEnabled:NO];

            //倒计时秒数颜色为绿色
            [_codeBtn setTitleColor:[UIColor colorMainGreen] forState:UIControlStateNormal];
            // 开启倒计时
            self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
            [_codeField becomeFirstResponder];
        }
        else{
            _secondsCountDown = 0;
            
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
        }
    } failure:^(QSBaseRequest *request) {
        _secondsCountDown = 0;
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
    }];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
