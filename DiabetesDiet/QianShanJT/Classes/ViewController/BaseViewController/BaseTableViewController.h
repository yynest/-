//
//  BaseTableViewController.h
//  QianShanJY
//
//  Created by iosdev on 16/3/11.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import "CustomBaseViewController.h"
#import "MJRefresh.h"
@interface BaseTableViewController : CustomBaseViewController<UITableViewDelegate,UITableViewDataSource>{
    CGRect viewRect;
    NSMutableArray *dataList;
    UITableView *baseTableView;
    
    int pageSize;
    int pageNumber;
    CGFloat cellHeigh;
    
}

//添加下拉刷新
- (void)addMJRefreshHeader;
//添加上拉加载
- (void)addMJRefreshFooter;
//下拉刷新数据
- (void)loadNewData;
//上拉加载更多数据
- (void)loadMoreData;

//停止刷新
- (void)endTableViewRefreshing:(BOOL)success isUpdate:(BOOL)update;

@end
