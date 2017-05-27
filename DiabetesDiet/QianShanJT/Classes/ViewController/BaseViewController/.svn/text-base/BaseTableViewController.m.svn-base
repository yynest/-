//
//  BaseTableViewController.m
//  QianShanJY
//t
//  Created by iosdev on 16/3/11.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MJRefresh.h"
#import "ToolScreenFit.h"
#import "ToolFontFit.h"
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (instancetype)init {
    if (self = [super init]) {
        dataList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    pageNumber = 0;
    pageSize = 10;
    
    viewRect = [UIScreen mainScreen].bounds;
    viewRect.size.height -= 64;

    viewRect.origin.y -= 1;
    baseTableView = [[UITableView alloc] initWithFrame:viewRect style:UITableViewStyleGrouped];
    baseTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    baseTableView.delegate = self;
    baseTableView.dataSource = self;
    //1.分割线从最左边开始绘制
    //baseTableView.separatorInset = UIEdgeInsetsZero;
    //baseTableView.layoutMargins = UIEdgeInsetsZero;
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    baseTableView.backgroundColor = [UIColor colorBGGragLighter];
    baseTableView.separatorColor = [UIColor colorBorderGargLighter];
    [self.view addSubview:baseTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [baseTableView deselectRowAtIndexPath:[baseTableView indexPathForSelectedRow] animated:YES];
}

- (void)backHandle{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma MJRefresh,上拉加载，下拉刷新
//添加下拉刷新
- (void)addMJRefreshHeader {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    header.loadingView.color = [UIColor colorMainGreen];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 马上进入刷新状态
    //    [header beginRefreshing];
    // 设置header
    baseTableView.mj_header = header;
}

//添加上拉加载
- (void)addMJRefreshFooter {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 当上拉刷新控件出现50%时（出现一半），就会自动刷新。这个值默认是1.0（也就是上拉刷新100%出现时，才会自动刷新）
    //    footer.triggerAutomaticallyRefreshPercent = 0.5;
    // 隐藏刷新状态的文字
//    footer.loadingView.color = [UIColor colorMainGreen];
    // 设置footer
    baseTableView.mj_footer = footer;
}

//下拉刷新数据
- (void)loadNewData{
    pageNumber = 0;
    [self requestMyFavoritesListWithPageSize:pageSize andNumber:pageNumber isUpdate:YES];
}

//上拉加载更多数据
- (void)loadMoreData{
    [self requestMyFavoritesListWithPageSize:pageSize andNumber:pageNumber isUpdate:YES];
}


- (void)requestMyFavoritesListWithPageSize:(int)size andNumber:(int)num isUpdate:(BOOL)update{
    [baseTableView.mj_header endRefreshing];
}

//停止刷新
- (void)endTableViewRefreshing:(BOOL)success isUpdate:(BOOL)update {
    if (!success) {
        if (update) {
            [baseTableView.mj_header endRefreshing];
        }
        else {
            [baseTableView.mj_footer endRefreshing];
        }
    }
    else {
        if (update) {
            [baseTableView.mj_header endRefreshing];
        }
//        else {
//            [baseTableView.mj_footer endRefreshing];
//        }
    }
}


#pragma UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCell = @"strCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    
        [ToolFontFit setFontFromLabel:cell.textLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
        cell.textLabel.textColor = [UIColor colorTextBlack];
        cell.textLabel.shadowColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
       [ToolFontFit setFontFromLabel:cell.detailTextLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
        cell.detailTextLabel.textColor = [UIColor colorTextGragLight];
    }
    NSInteger row = indexPath.row;
    cell.textLabel.text = dataList[row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeigh;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

//2.分割线从最左边开始绘制
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
