//
//  BSMainVC.m
//  QianShanJT
//
//  Created by iosdev on 2017/5/3.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "BSMainVC.h"
#import "TestAPIVC.h"
#import "UIViewExt.h"
#import "BSRecordVC.h"
#import "HomeIndexModel.h"
#import "BSHistoryViewController.h"

#import "HomeIndexData.h"
#import "HomeIndexBsRecord.h"
#import "HomeIndexBsStatistics.h"
#import "BSBindVC.h"
#define KLine 0.5
@interface BSMainVC (){
    UIButton *bindImg;  //首页中间查看动态血糖的插图
   HomeIndexData *homeIndex;
}

@end

@implementation BSMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = YES;
    baseTableView.frame = CGRectMake(0, -20, viewWidth, [ToolScreenFit getHeightWithControlHeight:667] + 20);
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //检查缓存数据
    [self checkLocalCacheBSDate];
    
    //接口测试
    TestAPIVC *apiVC = [[TestAPIVC alloc] init];
    DLog(@"%@",apiVC);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
//        //网络请求
    [[UserInfoService sharedInstance] requestHomeIndexWithSuccessBlock:^{
        //处理数据
        homeIndex = [UserInfoService sharedInstance].homeIndexData;
        DLog(@"%@",homeIndex);
        [baseTableView reloadData];
    }failureBlock:^{
            
    }];
}

//检查缓存数据
- (void)checkLocalCacheBSDate {
    NSArray *datas = [UserDefaultsHelper getAllLocalCacheBloodDatas];
    if (datas) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic sf_setObject:datas forKey:@"list"];
        NSString *url = @"/bsrecord/batch";
        //请求
        QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
        [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
            NSUInteger error = request.responseStatusCode;
            DLog(@"%@",request.responseJSONObject);
            if (error == 0) {
                //处理数据
                [UserDefaultsHelper clearLocalCacheBloodData];
            }
            else{
//                [SVProgressHUD showInfoWithStatus:request.responseStatusString];
                DLog(@"接口(%@)fail data",url);
            }
        } failure:^(QSBaseRequest *request) {
//            [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
            DLog(@"接口(%@) fail network",url);
        }];
    }
}


-(UIView *)getHeaderView{
    
    //除了单元格整个headerView视图为单元格的头部视图    headerView 分为myImageView（绿色背景） baseView（记录血糖和插画）baseView2 （血糖统计部分）
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, [ToolScreenFit getHeightWithControlHeight:667] - [ToolScreenFit getHeightWithControlHeight:65] + 20 - 49)];
    headerView.backgroundColor = [UIColor whiteColor];

    //背景图

    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  viewWidth,[ToolScreenFit getHeightWithControlHeight:285])];
    myImageView.image = [UIImage imageNamed:@"home_beijing"];
    myImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toHistoryVC)];
    tap.numberOfTouchesRequired = 1;
    [myImageView addGestureRecognizer:tap];
 
    NSString *date = [ToolBox getCustomFormWithDateString:homeIndex.bsRecord.recordTime];
    //时间
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [ToolScreenFit getHeightWithControlHeight:71], viewWidth, 20)];
   
  
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.textColor = [UIColor whiteColor];
    [myImageView addSubview:dateLabel];
    
    //血糖值
    UILabel *bloodSugar = [[UILabel alloc]initWithFrame:CGRectMake(0, [ToolScreenFit getHeightWithControlHeight:105], viewWidth,100)];
    if (homeIndex.bsRecord.timeType) {
        DLog(@"%@",homeIndex);
        dateLabel.text = [NSString stringWithFormat:@"%@-%@",date,[ToolBox getTimeStringWithType:homeIndex.bsRecord.timeType]];
        bloodSugar.text = [NSString stringWithFormat:@"%.1f",homeIndex.bsRecord.bsValue];
    }else{
        bloodSugar.text = @"0.0";
        dateLabel.text = @"暂无数据";
    }
    
    bloodSugar.font = [UIFont systemFontOfSize:90] ;
    
    bloodSugar.textAlignment = NSTextAlignmentCenter;
    //阴影颜色
    bloodSugar.layer.shadowColor = [UIColor colorTextGragLight].CGColor;
    //阴影偏移  x，y为正表示向右下偏移
    bloodSugar.layer.shadowOffset = CGSizeMake(2, 2);
    bloodSugar.textColor = [UIColor whiteColor];
    bloodSugar.layer.shadowOpacity = 0.2;
    [myImageView addSubview:bloodSugar];
    
    //单位
    UILabel *unitLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [ToolScreenFit getHeightWithControlHeight:210], viewWidth, 20)];
    unitLabel.text = @"mmol/L";
    unitLabel.textAlignment = NSTextAlignmentCenter;
    unitLabel.textColor = [UIColor whiteColor];
    [myImageView addSubview:unitLabel];
    [headerView addSubview:myImageView];
    
    
    
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, myImageView.bottom, viewWidth,[ToolScreenFit getHeightWithControlHeight:148] )];
    baseView.backgroundColor = [UIColor whiteColor];
    
    //记录血糖按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(20, [ToolScreenFit getHeightWithControlHeight:0], viewWidth - 40, [ToolScreenFit getHeightWithControlHeight:70]);
 //   addBtn.backgroundColor = [UIColor colorMainGreen];
//    addBtn.layer.shadowColor = [UIColor colorMainGreen].CGColor;
//    addBtn.layer.shadowOffset = CGSizeMake(1,5);
//    addBtn.layer.shadowOpacity = 0.4;
//    addBtn.layer.shadowRadius = 4;
//    addBtn.layer.cornerRadius = 8;
//    addBtn.layer.masksToBounds = YES;
    [addBtn setBackgroundImage:[UIImage imageNamed:@"record1"] forState:UIControlStateNormal];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"record2"] forState:UIControlStateHighlighted];
    [addBtn setImage:[UIImage imageNamed:@"home_add"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"home_add"] forState:UIControlStateHighlighted];
    [addBtn setTitle:@"  记录血糖" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(toAdd) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [baseView addSubview:addBtn];
    
    //插图
    bindImg = [UIButton buttonWithType:UIButtonTypeCustom];
    bindImg.frame = CGRectMake(35, [ToolScreenFit getHeightWithControlHeight:78],  viewWidth - 90, [ToolScreenFit getHeightWithControlHeight:60]);
    if (homeIndex.bsRecord.state == 0) {
         [bindImg setImage:[UIImage imageNamed:@"chatuu2"] forState:UIControlStateNormal];
    }else{
        [bindImg setImage:[UIImage imageNamed:@"chatu"] forState:UIControlStateNormal];

    }
     [bindImg setAdjustsImageWhenHighlighted:NO];
    [bindImg addTarget:self action:@selector(bind) forControlEvents:UIControlEventTouchUpInside];
   
    [baseView addSubview:bindImg];
   
    UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowBtn.frame = CGRectMake(viewWidth - 28,  [ToolScreenFit getHeightWithControlHeight:78]+[ToolScreenFit getHeightWithControlHeight:60]/2 - 7.5, 10, 15);
    [arrowBtn setBackgroundImage:[UIImage imageNamed:@"home_arrow"] forState:UIControlStateNormal];
    [baseView addSubview:arrowBtn];
    
    [headerView addSubview:baseView];
    
    
    
    UIView *baseView2 = [[UIView alloc]initWithFrame:CGRectMake(0,  baseView.bottom, viewWidth,[ToolScreenFit getHeightWithControlHeight:110]  )];
    baseView2.backgroundColor = [UIColor whiteColor];
    
    //分割线

    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, KLine)];
    line.backgroundColor = [UIColor colorBorderGargLighter];
    [baseView2 addSubview:line];
    
    //本周血糖统计
    UILabel *weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, line.bottom +[ToolScreenFit getHeightWithControlHeight:15], viewWidth, 20)];
    weekLabel.text = @"本周血糖统计";
    weekLabel.textAlignment = NSTextAlignmentCenter;
    [ToolFontFit setFontFromLabel:weekLabel FontType:FontTypeNormal WithType:NormalFontTypeTitle];
    weekLabel.textColor = [UIColor colorTextBlack];
    [baseView2 addSubview:weekLabel];
    
    //竖着的两根分割线
    for (int i = 0; i < 2; i++) {
        UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(viewWidth/3*(i+1), line.bottom +[ToolScreenFit getHeightWithControlHeight:50],KLine, [ToolScreenFit getHeightWithControlHeight:50])];
        line2.backgroundColor = [UIColor colorBorderGargLighter];
        [baseView2 addSubview:line2];
    }
    
    //血糖统计
    NSArray *arr = @[@"偏高",@"正常",@"偏低"];
    NSArray *arr2 = @[[NSString stringWithFormat:@"%.0f",homeIndex.bsStatistics.heightCount],[NSString stringWithFormat:@"%.0f",homeIndex.bsStatistics.normalCount],[NSString stringWithFormat:@"%.0f",homeIndex.bsStatistics.lowCount]];
    NSArray *colorArr = @[[UIColor colorHighlightRed],[UIColor colorMainGreen],[UIColor colorHighlightYellow]];
    for (int i = 0; i< 3; i++) {
        UILabel *Label = [[UILabel alloc]initWithFrame:CGRectMake(viewWidth/3 * i,[ToolScreenFit getHeightWithControlHeight:48], viewWidth/3, 20)];
        Label.text = arr[i];
        Label.textAlignment = NSTextAlignmentCenter;
        Label.textColor = [UIColor colorTextBlack];
        [ToolFontFit setFontFromLabel:Label FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
        [baseView2 addSubview:Label];
        UILabel *Label2 = [[UILabel alloc]initWithFrame:CGRectMake(viewWidth/3 * i+ 9, [ToolScreenFit getHeightWithControlHeight:80], viewWidth/3, 15)];
        Label2.text = @"次";
        Label2.textAlignment = NSTextAlignmentCenter;
        [ToolFontFit setFontFromLabel:Label2 FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
        Label2.textColor = [UIColor colorTextBlack];
        [baseView2 addSubview:Label2];
        
        UILabel *ciShu = [[UILabel alloc]initWithFrame:CGRectMake(viewWidth/3 * i, [ToolScreenFit getHeightWithControlHeight:76], viewWidth/3/2, 20)];
        ciShu.text = arr2[i];
        ciShu.textAlignment = NSTextAlignmentRight;
        ciShu.font = [UIFont systemFontOfSize:24];
        ciShu.textColor = colorArr[i];
        [baseView2 addSubview:ciShu];
        
          }
    [headerView addSubview:baseView2];

    return headerView;
}

#pragma mark - TableView Datasource

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self getHeaderView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 1;
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

        return [ToolScreenFit getHeightWithControlHeight:667.0] - [ToolScreenFit getHeightWithControlHeight:65.0] - 49;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
        [ToolFontFit setFontFromLabel:cell.textLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
        [ToolFontFit setFontFromLabel:cell.detailTextLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    }    
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(20, KLine, viewWidth - 40, KLine)];
    line3.backgroundColor = [UIColor colorBorderGargLighter];
    [cell.contentView addSubview:line3];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, [ToolScreenFit getHeightWithControlHeight:55] - KLine, viewWidth, KLine)];
    line.backgroundColor = [UIColor colorBorderGargLighter];
    [cell.contentView addSubview:line];

 
    cell.textLabel.text = @"查看历史血糖数据";
    cell.imageView.image = [UIImage imageNamed:@"home_historyData"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIButton *arrowBut = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowBut.frame = CGRectMake(viewWidth - 28, [ToolScreenFit getHeightWithControlHeight:55]/2 - 8, 8, 16);
    [arrowBut setImage:[UIImage imageNamed:@"home_arrow2"] forState:UIControlStateNormal];
    [cell.contentView addSubview:arrowBut];

    return cell;
    
    
}// 创建（复用）单元格

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [ToolScreenFit getHeightWithControlHeight:55.0];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self toHistoryVC];
    
}

-(void)toHistoryVC{
    UIViewController *vc = [[BSHistoryViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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

-(void)toAdd{

    BSRecordVC *vc = [[BSRecordVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)bind{
    if (homeIndex.bsRecord.state == 0) {
       
    }else{
        BSBindVC *vc = [[BSBindVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
