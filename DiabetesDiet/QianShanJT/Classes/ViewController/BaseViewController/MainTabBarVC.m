//
//  MainTabBarVC.m
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "MainTabBarVC.h"
#import "CustomNavigationController.h"
#import "DMMainVC.h"
#import "UIMainVC.h"
#import "QSBaseRequest.h"
#import "UserInfoService.h"
#import "QNManager.h"

@interface MainTabBarVC ()

@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO;
    [UITabBar appearance].backgroundColor = [UIColor whiteColor];
    NSDictionary *dicNor = @{NSForegroundColorAttributeName: [UIColor colorTextGrag],NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:12.0f]};
    NSDictionary *dicSel = @{NSForegroundColorAttributeName: [UIColor colorMainGreen],NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:12.0f]};
//    NSDictionary *dicNor = @{NSForegroundColorAttributeName: [UIColor colorTextGrag]};
//    NSDictionary *dicSel = @{NSForegroundColorAttributeName: [UIColor colorMainGreen]};
    [[UITabBarItem appearance] setTitleTextAttributes:dicNor forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:dicSel forState:UIControlStateSelected];
    
    DMMainVC *dmMainVC = [[DMMainVC alloc] init];
    dmMainVC.navTitle = @"饮食管理";
    dmMainVC.tabBarItem.title = @"首页";
    dmMainVC.tabBarItem.image = [[UIImage imageNamed:@"home2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    dmMainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CustomNavigationController *dmNav = [[CustomNavigationController alloc] initWithRootViewController:dmMainVC];
    
    UIMainVC *uiMainVC = [[UIMainVC alloc] init];
    uiMainVC.navTitle = @"个人信息";
    uiMainVC.tabBarItem.title = @"我的";
    uiMainVC.tabBarItem.image=[[UIImage imageNamed:@"mine2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    uiMainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"mine1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CustomNavigationController *uiNav = [[CustomNavigationController alloc] initWithRootViewController:uiMainVC];
    self.viewControllers = @[dmNav,uiNav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
