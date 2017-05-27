//
//  SocialService.h
//  QianShan
//
//  Created by lxl on 15/9/1.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "BaseService.h"


// 微信
#define WeiChatUserDefault      @"WeiChatUserDefault"
#define WeiChatNickName         @"WeiChatNickName"
#define WeiChatImageUrl         @"WeiChatImageUrl"
#define WeiChatUnionId          @"WeiChatUnionId"


//第三方登录平台
#define ThirdLoginPlat          @"ThirdLoginPlat"
#define ThirdLoginPlatWechat    @"ThirdLoginPlatWechat"
#define ThirdLoginPlatSina      @"ThirdLoginPlatSina"
#define ThirdLoginPlatQQ        @"ThirdLoginPlatQQ"

#define ShareImage        @"ShareImage"
#define ShareUrl          @"ShareUrl"
#define ShareFirstTitle   @"ShareFirstTitle"
#define ShareSubTitle     @"ShareSubTitle"

enum QSWXScene {
    QSWXSceneSession  = 0,        /**< 聊天界面    */
    QSWXSceneTimeline = 1,        /**< 朋友圈      */
    QSWXSceneFavorite = 2,        /**< 收藏       */
};

@interface SocialService : BaseService

+ (SocialService*) sharedInstance;
- (void)registerAllSocial;

- (void)LoginWechat;
- (void)sharetoWechat:(NSDictionary *)param type:(enum QSWXScene)type;


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

@end
