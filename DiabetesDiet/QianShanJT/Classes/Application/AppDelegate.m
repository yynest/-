//
//  AppDelegate.m
//  QianShanJT
//
//  Created by iosdev on 2017/5/2.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "AppDelegate.h"

#import <Bugly/Bugly.h>
#import "FLURLProtocol.h"
#import "QSNetworkConfig.h"
#import "YYMonitorNetwork.h"

#import "LaunchIntroductionView.h"
#import "CustomNavigationController.h"
#import "LoginViewController.h"
#import "MainTabBarVC.h"
#import "UserInfoService.h"
#import "SocialService.h"

#define BUGLY_APP_ID @"569d95cf15"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)setWebCache {
    [NSURLProtocol registerClass:[FLURLProtocol class]];
    NSURLCache *urlCache = [[NSURLCache alloc] initWithMemoryCapacity:10*1024*1024 diskCapacity:100 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:urlCache];
}

- (void)setupBugly {
    // Get the default config
    BuglyConfig * config = [[BuglyConfig alloc] init];
    
    // Open the debug mode to print the sdk log message.
    // Default value is NO, please DISABLE it in your RELEASE version.
#if DEBUG
    config.debugMode = YES;
#endif
    
    // Open the customized log record and report, BuglyLogLevelWarn will report Warn, Error log message.
    // Default value is BuglyLogLevelSilent that means DISABLE it.
    // You could change the value according to you need.
    config.reportLogLevel = BuglyLogLevelWarn;
    
    // Open the STUCK scene data in MAIN thread record and report.
    // Default value is NO
    config.blockMonitorEnable = YES;
    
    // Set the STUCK THRESHOLD time, when STUCK time > THRESHOLD it will record an event and report data when the app launched next time.
    // Default value is 3.5 second.
    config.blockMonitorTimeout = 3.5;
    
    // Set the app channel to deployment
    config.channel = @"Bugly";
    
    //
    config.symbolicateInProcessEnable = YES;
    //用户标识
    NSString *userPhone = [NSString stringWithFormat:@"%@",[UserInfoService sharedInstance].userId];
    if (userPhone) {
        [Bugly setUserIdentifier:userPhone];
    }
    
    // NOTE:Required
    // Start the Bugly sdk with APP_ID and your config
    [Bugly startWithAppId:BUGLY_APP_ID config:config];
}

- (void)InitSVProgressHudForQianShan
{
    //设置弱提醒背景色，字体色
    [SVProgressHUD setBackgroundColor:[UIColor colorBGWithAlpha:0.7]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    
    //设置提醒的提示图片
    [SVProgressHUD setInfoImage:nil];
    //提醒文字
    //[SVProgressHUD showInfoWithStatus:@"收藏成功"];
    //设置可否操作
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setMinimumDismissTimeInterval:2.0];
}

//app引导页
- (void)showDefaultView {
    LaunchIntroductionView *introductionView = [LaunchIntroductionView sharedWithImages:@[@"default0",@"default1"] buttonImage:@"start" buttonFrame:CGRectMake(kScreen_width/2 - 551/4, kScreen_height*4/5, 551/2, 45)];
    introductionView.nomalColor = RGBACOLOR_HEX(0x01dac8, 0.3);
    introductionView.currentColor = [UIColor colorMainGreen];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化网络请求
    [[QSNetworkConfig sharedInstance] InitNetWork];
    //监听网络变化，并提示
    [[YYMonitorNetwork sharedInstance] monitorNetworkStateChange];
    // 离线缓存
    [self setWebCache];
    
    //初始化社会化分享
    [[SocialService sharedInstance] registerAllSocial];
    
    // Init the Bugly sdk
    [self setupBugly];
//    [self performSelector:@selector(testBugly) withObject:self afterDelay:2.0];

    // 初始化弱提醒风格
    [self InitSVProgressHudForQianShan];
    
    // 检查用户是否登录过
    UIViewController *vc;
    NSNumber *userID = [UserInfoService sharedInstance].userId;
    DLog(@"%@",userID);
    if (userID||YES) {
        vc = [[MainTabBarVC alloc] init];
    }
    else {
        vc = [[CustomNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
        //navi.navigationBarHidden = YES;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor colorBGGragLighter];
    [self.window makeKeyAndVisible];
    //app引导页
//    [self showDefaultView];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [[SocialService sharedInstance] application:application handleOpenURL:url];
    
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [[SocialService sharedInstance] application:app openURL:url options:options];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
