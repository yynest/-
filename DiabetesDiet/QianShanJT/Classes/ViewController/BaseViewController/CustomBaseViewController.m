//
//  BaseViewController.m
//  QianShan
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "CustomBaseViewController.h"
#import "UIBarButtonItem+MJ.h"

#import "UCMainVC.h"
#import "BSMainVC.h"
#import "LoginViewController.h"
#import "LoginBindController.h"

@interface CustomBaseViewController ()<UIGestureRecognizerDelegate>
{

    UILabel *titleLabel;
}
@end

@implementation CustomBaseViewController

- (id)init {
    if (self=[super init]) {
        //底部工具栏隐藏
        if ([self isKindOfClass:[UCMainVC class]] || [self isKindOfClass:[BSMainVC class]]
            || [self isKindOfClass:[LoginViewController class]] || [self isKindOfClass:[LoginBindController class]]) {
            [self setHidesBottomBarWhenPushed:NO];
        }
        else {
            [self setHidesBottomBarWhenPushed:YES];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    viewWidth = MAIN_SCREEN_WIDTH;
    viewHeight = MAIN_SCREEN_HEIGHT;
    self.view.backgroundColor = [UIColor colorBGGragLighter];
    self.navigationController.interactivePopGestureRecognizer.delegate =  self ;
    self.edgesForExtendedLayout = NO;
    NSArray *array = self.navigationController.viewControllers;
    if (array.count>1) {
        [self setNavLeftImage:@"leftArrow"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    //状态栏样式
    if ([self isKindOfClass:[UCMainVC class]] || [self isKindOfClass:[BSMainVC class]]) {
        [self setStatusBarStyle:NO];
    }
    else {
        [self setStatusBarStyle:YES];
    }
    //导航栏隐藏
    if ([self isKindOfClass:[UCMainVC class]] || [self isKindOfClass:[BSMainVC class]]
        || [self isKindOfClass:[LoginViewController class]] || [self isKindOfClass:[LoginBindController class]]) {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    }
    else {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    if (self.navigationController.viewControllers.count <= 1 ) {
        return false;
    }
    return true;
}


//页面标题栏
- (void)setNavTitle:(NSString *)naviTitle {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = naviTitle;
    titleLabel.font = [UIFont systemFontOfSize:20.0f];
    titleLabel.textColor = [UIColor colorTextBlack];
    self.navigationItem.titleView = titleLabel;
}
#pragma mark 导航设置
//左边按钮
- (void)setNavLeftImage:(NSString *)NavLeftImage{
    _NavLeftImage = NavLeftImage;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:NavLeftImage highIcon:nil target:self action:@selector(navLeftBut:)];
}

//右边按钮
- (void)setNavRightImage:(NSString *)NavRightImage{
    _NavRightImage = NavRightImage;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:NavRightImage highIcon:nil target:self action:@selector(navRightBut:)];
}
//多个导航左按钮
- (void)setNavLeftImageArray:(NSArray *)NavLeftImageArray{
    _NavLeftImageArray = NavLeftImageArray;
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:1];
    
    for (int i = 0; i < NavLeftImageArray.count; i++) {
        NSString *imageName = NavLeftImageArray[i];
        NSInteger itemTag = kMoreNavLeftTag + i;
        UIBarButtonItem *item = [UIBarButtonItem moreItemWithIcon:imageName highIcon:nil target:self action:@selector(moreNavLeftBut:) tag:itemTag];
        item.tag = itemTag;
        [itemArray addObject:item];
    }
    
    self.navigationItem.leftBarButtonItems = itemArray;
}

//多个导航右按钮
- (void)setNavRightImageArray:(NSArray *)NavRightImageArray{
    _NavRightImageArray = NavRightImageArray;
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:1];
    
    //NSEnumerationReverse 倒序遍历
    [NavRightImageArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *imageName = NavRightImageArray[idx];
        NSInteger itemTag = kMoreNavRightTag + NavRightImageArray.count - (NavRightImageArray.count - idx);
        UIBarButtonItem *item = [UIBarButtonItem moreItemWithIcon:imageName highIcon:nil target:self action:@selector(moreNavRightBut:) tag:itemTag];
        item.tag = itemTag;
        [itemArray addObject:item];
    }];
    
    self.navigationItem.rightBarButtonItems = itemArray;
}


//导航按钮点击事件
- (void)navLeftBut:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navRightBut:(UIButton *)sender{}
- (void)moreNavLeftBut:(UIButton *)sender{}
- (void)moreNavRightBut:(UIButton *)sender{}

#pragma mark 触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

//空页面
- (void)addEmptyViewWithType:(EmptyViewType)type withTitle:(NSString *)title{
    [self removeEmptyView];
    
    if (!emptyViewTips) {
        emptyViewTips = [[EmptyViewTips alloc] initWithFrame:self.view.frame withType:type withTitle:title];
        emptyViewTips.type = type;
    }
     [self.view addSubview:emptyViewTips];
}

- (void)removeEmptyView {
    if (emptyViewTips) {
        [emptyViewTips removeFromSuperview];
        emptyViewTips = nil;
    }
}

//设置状态栏样式
- (void)setStatusBarStyle:(BOOL)isDefault {
    if (isDefault) {
        if (UIApplication.sharedApplication.statusBarStyle != UIStatusBarStyleDefault) {
            [UIApplication.sharedApplication setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        }
    }
    else {
        if (UIApplication.sharedApplication.statusBarStyle != UIStatusBarStyleLightContent) {
            [UIApplication.sharedApplication setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        }
    }
}

- (void)setNavTitleColor:(UIColor *)color {
    titleLabel.textColor = color;
}

- (void)showAlertController:(NSString *)message buttons:(NSArray *)btList viewTag:(int)tag {
    if (btList.count==0 || btList.count>2) {
        return;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    NSString *oneStr = [btList sf_objectAtIndex:0];
    if (oneStr) {
        UIAlertAction *bt_cansel = [UIAlertAction actionWithTitle:oneStr style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction *action) {
                                                              [self clickedCancelEventTag:tag];
                                                          }];
        [alertController addAction:bt_cansel];
    }
    NSString *towStr = [btList sf_objectAtIndex:1];
    if (towStr) {
        UIAlertAction *bt_ok = [UIAlertAction actionWithTitle:towStr style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self clickedOKEventTag:tag];
                                                      }];
        [alertController addAction:bt_ok];
    }
    alertController.view.tintColor = [UIColor colorMainGreen];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)clickedCancelEventTag:(int)tag {
    
}
- (void)clickedOKEventTag:(int)tag {
    
}



/////////拍照的弹出框
-(void)showActionSheet{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                   
                                                         handler:^(UIAlertAction * action) {}];
    UIAlertAction* fromPhotoAction = [UIAlertAction actionWithTitle:@"相册选取" style:UIAlertActionStyleDefault                                                                 handler:^(UIAlertAction * action) {
        [self clickPhoto];
    }];
    
    UIAlertAction* fromCameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault                                                             handler:^(UIAlertAction * action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [self clickCamera];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:fromCameraAction];
    [alertController addAction:fromPhotoAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)clickPhoto{
    
}

-(void)clickCamera{
    
}

//底部按钮
- (void)addBottonButton:(NSString *)title withFrame:(CGRect)frame {
    if (CGRectEqualToRect(frame, CGRectZero)) {
        frame = CGRectMake(VIEW_SPACE_EDGE, MAIN_SCREEN_HEIGHT-VIEW_SPACE_EDGE-VIEW_BOTTON_HEIGHT-64, MAIN_SCREEN_WIDTH-VIEW_SPACE_EDGE*2, VIEW_BOTTON_HEIGHT);
    }
    UIButton *bt_bottom = [[UIButton alloc] initWithFrame:frame];
    [bt_bottom setTitle:title forState:UIControlStateNormal];
    [bt_bottom setBackgroundImage:[UIImage imageNamed:@"com_bt_nor"] forState:UIControlStateNormal];
    [bt_bottom setBackgroundImage:[UIImage imageNamed:@"com_bt_high"] forState:UIControlStateHighlighted];
    bt_bottom.layer.cornerRadius = VIEW_SPACE_EDGE/3;
    bt_bottom.layer.masksToBounds = YES;
    [bt_bottom addTarget:self action:@selector(clickedBottonButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt_bottom];
}

- (void)clickedBottonButton {
    
}


-(UIButton *)getBtnWithTitle:(NSString *)titleStr Tag:(NSInteger)tag{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 40);
    btn.tag = tag;
    [btn setTitle:titleStr forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtnWithTag:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor colorMainGreen] forState:UIControlStateNormal];
    return btn;
  
}

-(void)clickBtnWithTag:(NSInteger)btnTag{

}
@end
