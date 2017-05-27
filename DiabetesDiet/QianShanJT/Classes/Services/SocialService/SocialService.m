//
//  SocialService.m
//  QianShan
//
//  Created by lxl on 15/9/1.
//  Copyright (c) 2015年 chinasun. All rights reserved.
//

#import "SocialService.h"
#import "WXApi.h"


//wechat  setting
#define wechatAppId        @"wx2fb8aef715823a8b"
#define wechatAppSecret    @"2017ae70be93bb78ab0c927d81507a68"

static SocialService *_instance = nil;

@interface SocialService()<WXApiDelegate>
{
    
    enum WXScene _scene;
    
    //wechat
    NSString     *wechatCode;
    NSString     *wechatToken;
    NSString     *wechatOpenId;

}


@end

@implementation SocialService

+ (SocialService*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

//+ (id) allocWithZone:(struct _NSZone *)zone
//{
//    return [SocialService sharedInstance];
//}
//
//+ (id) copyWithZone:(struct _NSZone *)zone
//{
//    return [SocialService sharedInstance];
//}

- (void)registerAllSocial
{
    //向微信注册
    bool weRet = [WXApi registerApp:wechatAppId];

    weRet = YES;

}


#pragma  mark
#pragma  mark weixin
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    //如果涉及其他应用交互,请做如下判断,例如:还可能和新浪微博进行交互
    if ([url.scheme isEqualToString:wechatAppId]) {
        return [WXApi handleOpenURL:url delegate:self];
    }
    else
    {
        return YES;
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.scheme isEqualToString:wechatAppId]) {
        return [WXApi handleOpenURL:url delegate:self];
    }
    else{
        return YES;
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([url.scheme isEqualToString:wechatAppId]) {
        return [WXApi handleOpenURL:url delegate:self];
    }
    else{
        return YES;
    }
}


-(void) onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
//       GetMessageFromWXReq *temp = (GetMessageFromWXReq *)req;
#ifdef DEBUG
        // 微信请求App提供内容， 需要app提供内容后使用sendRsp返回
//       NSString *strTitle = [NSString stringWithFormat:@"微信请求App提供内容"];
//        NSString *strMsg = [NSString stringWithFormat:@"openID: %@", temp.openID];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        alert.tag = 1000;
//        [alert show];
#endif
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
//        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
//        WXMediaMessage *msg = temp.message;
//        
//        //显示微信传过来的内容
//        WXAppExtendObject *obj = msg.mediaObject;
//        
//        NSString *strTitle = [NSString stringWithFormat:@"微信请求App显示内容"];
//        NSString *strMsg = [NSString stringWithFormat:@"openID: %@, 标题：%@ \n内容：%@ \n附带信息：%@ \n缩略图:%ld bytes\n附加消息:%@\n", temp.openID, msg.title, msg.description, obj.extInfo, msg.thumbData.length, msg.messageExt];
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        //[alert show];
    }
    else if([req isKindOfClass:[LaunchFromWXReq class]])
    {
 //       LaunchFromWXReq *temp = (LaunchFromWXReq *)req;
//        WXMediaMessage *msg = temp.message;
        
#ifdef DEBUG
        //从微信启动App
//        NSString *strTitle = [NSString stringWithFormat:@"从微信启动"];
//        NSString *strMsg = [NSString stringWithFormat:@"openID: %@, messageExt:%@", temp.openID, msg.messageExt];

//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
#endif
    }
}

-(void) onResp:(BaseResp*)resp
{

   if([resp isKindOfClass:[SendAuthResp class]])
    {
        SendAuthResp *temp = (SendAuthResp*)resp;
        
//        NSString *strTitle = [NSString stringWithFormat:@"Auth结果"];
//        NSString *strMsg = [NSString stringWithFormat:@"code:%@,state:%@,errcode:%d", temp.code, temp.state, temp.errCode];
        wechatCode = temp.code;
        
        [self getAccess_token];
    }
    else if ([resp isKindOfClass:[AddCardToWXCardPackageResp class]])
    {
        AddCardToWXCardPackageResp* temp = (AddCardToWXCardPackageResp*)resp;
        NSMutableString* cardStr = [[NSMutableString alloc] init];
        for (WXCardItem* cardItem in temp.cardAry) {
            [cardStr appendString:[NSString stringWithFormat:@"cardid:%@ cardext:%@ cardstate:%u\n",cardItem.cardId,cardItem.extMsg,(unsigned int)cardItem.cardState]];
        }


    } else if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        
    }

}

- (void)isOnlineResponse:(NSDictionary *)response
{
    
}


- (void)LoginWechat
{
    SendAuthReq* req =[[SendAuthReq alloc ] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"123" ;
    [WXApi sendReq:req];
}


-(void)getAccess_token
{
    //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
    
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",wechatAppId,wechatAppSecret,wechatCode];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                /*
                 {
                 "access_token" = "OezXcEiiBSKSxW0eoylIeJDUKD6z6dmr42JANLPjNN7Kaf3e4GZ2OncrCfiKnGWiusJMZwzQU8kXcnT1hNs_ykAFDfDEuNp6waj-bDdepEzooL_k1vb7EQzhP8plTbD0AgR8zCRi1It3eNS7yRyd5A";
                 "expires_in" = 7200;
                 openid = oyAaTjsDx7pl4Q42O3sDzDtA7gZs;
                 "refresh_token" = "OezXcEiiBSKSxW0eoylIeJDUKD6z6dmr42JANLPjNN7Kaf3e4GZ2OncrCfiKnGWi2ZzH_XfVVxZbmha9oSFnKAhFsS0iyARkXCa7zPu4MqVRdwyb8J16V8cWw7oNIff0l-5F-4-GJwD8MopmjHXKiA";
                 scope = "snsapi_userinfo,snsapi_base";
                 }
                 */
                
                wechatToken  = [dic objectForKey:@"access_token"];
                wechatOpenId = [dic objectForKey:@"openid"];
                [self getUserInfo];
                
            }
        });
    });
}

-(void)getUserInfo
{
    // https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",wechatToken,wechatOpenId];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"%@",dic);
                //微信取消
                if (![[dic allKeys] containsObject:@"openid"]) {
                    return;
                }
                /*
                 {
                 city = Haidian;
                 country = CN;
                 headimgurl = "http://wx.qlogo.cn/mmopen/FrdAUicrPIibcpGzxuD0kjfnvc2klwzQ62a1brlWq1sjNfWREia6W8Cf8kNCbErowsSUcGSIltXTqrhQgPEibYakpl5EokGMibMPU/0";
                 language = "zh_CN";
                 nickname = "xxx";
                 openid = oyAaTjsDx7pl4xxxxxxx;
                 privilege =     (
                 );
                 province = Beijing;
                 sex = 1;
                 unionid = oyAaTjsxxxxxxQ42O3xxxxxxs;
                 }
                 */
                
                NSLog(@"%@", [dic objectForKey:@"nickname"]);
                NSLog(@"%@", [dic objectForKey:@"headimgurl"]);
                //self.wxHeadImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dic objectForKey:@"headimgurl"]]]];
                
                // unionid = oNYjzt5lzRrpKm1vheoBYFPIcYgo
                
                //获取微信信息
                [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"openid"] forKey:WeiChatUserDefault];
                 [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"headimgurl"] forKey:WeiChatImageUrl];
                [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"unionid"] forKey:WeiChatUnionId];

                [[NSUserDefaults standardUserDefaults] setObject:ThirdLoginPlatWechat forKey:ThirdLoginPlat];
                //微信成功授权
                NSMutableDictionary *obj = [[NSMutableDictionary alloc] init];
                [obj setObject:[dic objectForKey:@"openid"] forKey:@"platUserId"];
                [obj setObject:[dic objectForKey:@"unionid"] forKey:@"unionid"];
                [obj setObject:[NSNumber numberWithInt:2] forKey:@"platId"];
                [obj setObject:[NSNumber numberWithBool:YES] forKey:@"status"];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:Notifi_Wechat_Login object:nil];

            }
        });
        
    });
}



//分享到微信
- (void) sharetoWechat:(NSDictionary *)param type:(enum QSWXScene)type
{
    //检测是否安装客户端
    if (![WXApi isWXAppInstalled]) {
        //未安装
        [SVProgressHUD showInfoWithStatus:@"未安装微信客户端"];
        return;
        
    }
    WXMediaMessage *message = [WXMediaMessage message];
    
    message.title = [param objectForKey:ShareFirstTitle];
    message.description = [param objectForKey:ShareSubTitle];
    
    [SDWebImageManager.sharedManager downloadImageWithURL:[param objectForKey:ShareImage] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image != nil) {
            NSData *data=UIImageJPEGRepresentation(image, 1.0);
            if (data.length > 40*1024) {
                UIImage *scaleImage = [ToolBox imageScaleHandle:image scale:6 quality:0.2];
                [message setThumbImage:scaleImage];
            }else{
                [message setThumbImage:image];
            }
        }else{
            [message setThumbImage:[UIImage imageNamed:@"shareIcon"]];
        }
        
        WXWebpageObject *ext = [WXWebpageObject object];
        ext.webpageUrl =[param valueForKey:ShareUrl];
        
        message.mediaObject = ext;
        message.mediaTagName = @"WECHAT_TAG_JUMP_SHOWRANK";
        
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        //分享到好友或朋友圈
        req.scene = type;
        [WXApi sendReq:req];
    }];
}


@end

