//
//  UCMainVC.m
//  QianShanJT
//
//  Created by iosdev on 2017/5/3.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "UCMainVC.h"
#import "UCMainCell.h"
#import "WavesView.h"
#import "UCInforVC.h"
#import "UserInfoUser.h"
#import "UserInfoPicture.h"

#import "LoginViewController.h"
#import "SHFeedBackVC.h"
#import "WebLoadH5VC.h"

#import "UCShareBSData.h"
#import "BSHistoryViewController.h"
#import "UCShareAPP.h"
#import "BSBindVC.h"
#import "HomeIndexModel.h"
#import "HomeIndexData.h"
#import "HomeIndexUser.h"
#import "HomeIndexBsRecord.h"

#import "QSNetworkConfig.h"

//#import "ZJLabel.h"
@interface UCMainVC () {
    UserInfoUser *userInfo;
    HomeIndexData *homeIndex;
    
    NSString *strVersion;
    
    UISegmentedControl *segment;
    NSUInteger selectedSegmentIndex;
}

@property (nonatomic,strong)WavesView * WavesView; //背景View
@property (nonatomic,strong)UIImageView * headerImageView; //头像
@end

@implementation UCMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    baseTableView.frame = CGRectMake(0, -20, viewWidth, viewHeight - 49 +20);
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cellHeigh = 50; //单元格高度
    
#ifdef DEBUG
    strVersion = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleVersion"];
#else
    strVersion = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"];
#endif
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UserInfoService sharedInstance] requestHomeIndexWithSuccessBlock:^{
        //处理数据
        homeIndex = [UserInfoService sharedInstance].homeIndexData;
        DLog(@"%@",homeIndex);
     
    }failureBlock:^{
        
    }];
     baseTableView.frame = CGRectMake(0, -20, viewWidth, viewHeight - 49 +20);
    //网络请求
    [[UserInfoService sharedInstance] requestUserInfoWithSuccessBlock:^{
        //处理数据
        userInfo = [UserInfoService sharedInstance].userInfo;
        DLog(@"%@",userInfo);
        [baseTableView reloadData];
    }failureBlock:^{
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)headerView{
   
    self.WavesView = [[WavesView alloc]initWithFrame:CGRectMake(0,0, viewWidth, [ToolScreenFit getHeightWithControlHeight:180])];
    self.WavesView.image = [UIImage imageNamed:@"uc_beijing"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toUserInfo)];
    tap.numberOfTouchesRequired = 1;
    self.WavesView.userInteractionEnabled = YES;
    [self.WavesView addGestureRecognizer:tap];
    
    [self.view addSubview:self.WavesView];
    
    //名字
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, [ToolScreenFit getHeightWithControlHeight:180]/2 - 15, 200, 20)];
    nameLabel.text = userInfo.name;
    nameLabel.textColor = [UIColor whiteColor];

    [_WavesView addSubview:nameLabel];
    
    //手机号码
    UILabel *telLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, [ToolScreenFit getHeightWithControlHeight:180]/2+10 , 120, 20)];
    telLabel.text = userInfo.mobile;
    telLabel.textColor = [UIColor colorUCBorder];
    telLabel.font = [UIFont systemFontOfSize:13];
    [ToolFontFit setFontFromLabel:telLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    telLabel.alpha = 0.8;
    [_WavesView addSubview:telLabel];
    
    //头像
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, [ToolScreenFit getHeightWithControlHeight:180]/2 - 20, 56, 56)];
    _headerImageView.layer.borderColor = [UIColor colorUCBorder].CGColor;
    _headerImageView.layer.borderWidth = 3;
    _headerImageView.layer.cornerRadius = 28;
    _headerImageView.layer.masksToBounds = YES;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",userInfo.picture.path,userInfo.picture.name,userInfo.picture.suffix] ] placeholderImage:IMAGE_HEAD_DEFAULT];
    [_WavesView addSubview:self.headerImageView];
    
    //箭头
    UIButton *arrowBut = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowBut.frame = CGRectMake(viewWidth - 30, [ToolScreenFit getHeightWithControlHeight:180]/2 - 5, 8, 15);
    [arrowBut setImage:[UIImage imageNamed:@"uc_arrow"] forState:UIControlStateNormal];
    [_WavesView addSubview:arrowBut];
    
    //开始执行
    [_WavesView startWaveAnimation];
    return self.WavesView;
}

#pragma mark UITableViewDataSource

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return [self headerView];
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }if (section == 1) {
        
#ifdef DEBUG
        return 6;
#else
        return 5;
#endif
        
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [ToolScreenFit getHeightWithControlHeight:180];
    }
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UCMainCell";
    
    UCMainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
   
    if (cell == nil) {
        
       cell = [[UCMainCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
       cell.accessoryType = UITableViewCellAccessoryNone;
       cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    NSArray *textArray1 = @[@"血糖历史数据",@"分享血糖数据"];
    NSArray *imageArray1 = @[@"uc_historyData",@"uc_shareData"];
#ifdef DEBUG
 
    NSArray *textArray2 = @[@"我的设备",@"意见反馈",@"分享APP",@"关于我们",@"版本",@"网络环境"];
    NSArray *imageArray2 = @[@"uc_edition",@"uc_feedback",@"uc_shareApp",@"uc_about",@"uc_myequipment", @"uc_edition"];
#else

    NSArray *textArray2 = @[@"我的设备",@"意见反馈",@"分享APP",@"关于我们",@"版本"];
    NSArray *imageArray2 = @[@"uc_edition",@"uc_feedback",@"uc_shareApp",@"uc_about",@"uc_myequipment"];
#endif
   
    
    //箭头
    UIButton *arrowBut = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowBut.frame = CGRectMake(viewWidth - 30, 50/2 - 7.5, 8, 15);
    [arrowBut setImage:[UIImage imageNamed:@"home_arrow2"] forState:UIControlStateNormal];
    [cell.contentView addSubview:arrowBut];

    
    if (indexPath.section == 0) {
        cell.textLabel.text = textArray1[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageArray1[indexPath.row]];
      
         //   cell.separatorInset = UIEdgeInsetsMake(0, viewWidth, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
   
    }else if (indexPath.section == 1){
        cell.textLabel.text = textArray2[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageArray2[indexPath.row]];
        if (indexPath.row == 0 && indexPath.section == 1) {
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake( MAIN_SCREEN_WIDTH - 200,0, 160,50)];
            label2.text = @"未绑定";
            label2.shadowOffset =  CGSizeMake(0, 0);
            label2.textAlignment = NSTextAlignmentRight;
            label2.textColor = [UIColor colorHighlightRed];
            [ToolFontFit setFontFromLabel:label2 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
            [cell.contentView addSubview:label2];
        }
        if (indexPath.row == 4) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.detailTextLabel.text = strVersion;
            arrowBut.hidden = YES;
        }
        
    }
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(20, 50-0.5, viewWidth - 20, 0.5)];
    lineView.backgroundColor = [UIColor colorBorderGargLighter];
    [cell.contentView addSubview:lineView];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            lineView.frame = CGRectMake(0, 50-0.5, viewWidth , 0.5);
        }
    }else if (indexPath.section == 1){
    
        if (indexPath.row == 0) {
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth , 0.5)];
            lineView.backgroundColor = [UIColor colorBorderGargLighter];
            [cell.contentView addSubview:lineView];
        }if (indexPath.row == 5) {
            lineView.frame = CGRectMake(0, 50-0.5, viewWidth , 0.5);

        }
        
#ifdef DEBUG
        //内网 预发布环境切换
        if (indexPath.row == 5) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [arrowBut removeFromSuperview];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            NSArray *array = @[@"内网",@"预发布",@"外网"];
            selectedSegmentIndex = [[UserDefaultsHelper getNetworkType] integerValue];
            segment = [[UISegmentedControl alloc] initWithItems:array];
            segment.frame = CGRectMake(MAIN_SCREEN_WIDTH - 150 -20  ,50 /2 -15, 150, 30);
            segment.selectedSegmentIndex = selectedSegmentIndex;
            segment.tintColor = [UIColor colorMainGreen];
            
            //设置文字属性
            NSDictionary* unselectedTextAttributes =@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor colorTextGrag]};
            [segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
            NSDictionary* selectedTextAttributes =@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]};
            [segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
            [segment addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventValueChanged];
            
            [cell.contentView addSubview:segment];
        }
#endif
    }
    else if (indexPath.section == 2){
        cell.accessoryType = UITableViewCellAccessoryNone;
        arrowBut.hidden = YES;
        //退出登录
        UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        exitBtn.frame = CGRectMake(0, 0, viewWidth, 50);
        [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitBtn setTitleColor:[UIColor colorHighlightRed] forState:UIControlStateNormal];
        [exitBtn addTarget:self action:@selector(toExit) forControlEvents:UIControlEventTouchUpInside];
        [exitBtn setBackgroundImage:[UIImage imageNamed:@"uc_beijing2"] forState:UIControlStateHighlighted];
        exitBtn.titleLabel.shadowOffset =  CGSizeMake(0, 0);
        [cell.contentView addSubview:exitBtn];
        if (indexPath.row == 0) {
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth , 0.5)];
            lineView.backgroundColor = [UIColor colorBorderGargLighter];
            [cell.contentView addSubview:lineView];
        }
            lineView.frame = CGRectMake(0, 50-0.5, viewWidth , 0.5);
            
        
    }


    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        UIViewController *vc = [[BSHistoryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        UCShareBSData *shareVC = [[UCShareBSData alloc]init];
        [self.navigationController pushViewController:shareVC animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 0){
    
        if (homeIndex.bsRecord.state == 0) {
            
        }else{
            BSBindVC *vc = [[BSBindVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
   else if (indexPath.section == 1 && indexPath.row == 1) {
        SHFeedBackVC *vc = [[SHFeedBackVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];

   } else if (indexPath.section == 1 && indexPath.row == 2) {
       UCShareAPP *vc = [[UCShareAPP alloc]init];
       [self.navigationController pushViewController:vc animated:YES];
  
  }else if (indexPath.section == 1 && indexPath.row == 3){

        WebLoadH5VC *h5VC = [[WebLoadH5VC alloc] init];
        h5VC.navTitle = @"关于我们";
        h5VC.loadUrl = @"/protocol/aboutus";
        [self.navigationController pushViewController:h5VC animated:YES];

    }
}

//退出登录
-(void)toExit {
    [self showAlertController:@"您确定要退出当前账号" buttons:@[@"取消",@"确定"] viewTag:0];
}

- (void)clickedOKEventTag:(int)tag {
    if (tag == 1) {
        NSInteger index = [segment selectedSegmentIndex];
        selectedSegmentIndex = index;
        [UserDefaultsHelper setNetworkType:[NSNumber numberWithInteger:index]];
        //重置网络环境
        [[QSNetworkConfig sharedInstance] InitNetWork];
    }
    [[UserInfoService sharedInstance] clearAllData];
    CustomNavigationController *navi = [[CustomNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    navi.navigationBar.hidden = YES;
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:navi];
}

- (void)clickedCancelEventTag:(int)tag {
    if (tag == 1) {
        segment.selectedSegmentIndex = selectedSegmentIndex;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",baseTableView.contentOffset.y);
    if (baseTableView.contentOffset.y <= 0) {
        baseTableView.bounces = NO;
        
        NSLog(@"禁止下拉");
    }
    else
        if (baseTableView.contentOffset.y >= 0){
            baseTableView.bounces = YES;
            NSLog(@"允许上拉");
            
        }
}

- (void)myAction:(UISegmentedControl *)seg
{
    [self showAlertController:@"切换网络环境，需要重新登录" buttons:@[@"取消",@"确定"] viewTag:1];
   // [self clickedOKEventTag:0];
}


-(void)toUserInfo{

    UCInforVC *infoVC = [[UCInforVC alloc]init];
    infoVC.userInfo = userInfo;
    [self.navigationController pushViewController:infoVC animated:YES];
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
