//
//  CustomNavigationController.m
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为去掉导航栏的边界黑线，使用图片做导航栏背景
    self.navigationBar.barTintColor = [UIColor whiteColor];
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"com_nav_bgi"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationBar.shadowImage = [[UIImage alloc] init];
//

    //导航栏上的字体和 左右按钮 图片渲染颜色
   }
-(void)setNavTitleColor:(UIColor *)color{
    self.navigationBar.tintColor = color;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
