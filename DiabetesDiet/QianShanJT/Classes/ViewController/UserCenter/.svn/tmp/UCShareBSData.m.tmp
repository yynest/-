//
//  UCShareBSData.m
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/22.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "UCShareBSData.h"
#import "QSNetworkConfig.h"

//查询关联关系
#import "ShareListRecords.h"
#import "ShareListData.h"
#import "ShareListModel.h"
#import "ShareToOtherView.h"
#import "QrcodeModel.h"
#import "QrcodeData.h"
#import "SocialService.h"

@interface UCShareBSData () {
    NSMutableArray *shareList;
    QrcodeModel *model;//二维码信息
    NSMutableDictionary *shareParam;//分享参数
    
    NSInteger delIndex;
}
@property (strong, nonatomic)ShareToOtherView *shareToOtherView;

@end

@implementation UCShareBSData

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"分享血糖数据";
    self.NavRightImage = @"com_share";
    baseTableView.frame = CGRectMake(0, 0, viewWidth, viewHeight);
    
    //生成分享参数
    shareParam = [[NSMutableDictionary alloc] init];
    NSString *str = [NSString stringWithFormat:@"%@/user/share/%@",[QSNetworkConfig sharedInstance].baseURL,[UserInfoService sharedInstance].userId];
    [shareParam sf_setObject:str forKey:ShareUrl];
    [shareParam sf_setObject:[NSString stringWithFormat:@"%@", @"血糖数据"] forKey:ShareFirstTitle];
    [shareParam sf_setObject:@"血糖数据" forKey:ShareSubTitle];
    [shareParam sf_setObject:[UserInfoService sharedInstance].headerUrl forKey:ShareImage];
    
    [self requestGetUserQrcode];
    [self requestGetShareList];
    
    //下拉刷新
    [self addMJRefreshHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadNewData {
    [shareList removeAllObjects];
    [self requestGetShareList];
}

//查询关联关系
- (void)requestGetShareList {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:@"0" forKey:@"pageNum"];
    [dic sf_setObject:@"100" forKey:@"pageSize"];
    NSString *url = @"/bsrecord/share/list";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            ShareListModel *model = [ShareListModel modelObjectWithDictionary:request.responseJSONObject];
            shareList = [NSMutableArray arrayWithArray:model.data.records];
            [baseTableView reloadData];
        }
        else if (error == 10005) {
            [baseTableView reloadData];
        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
        }
        [self endTableViewRefreshing:YES isUpdate:YES];
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
        [self endTableViewRefreshing:YES isUpdate:YES];
    }];
}

// 删除关联关系
- (void)requestDealShareDelete:(NSNumber *) friendId{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:friendId forKey:@"bsRecordShareId"];
    NSString *url = @"/bsrecord/share/delete";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            [SVProgressHUD showInfoWithStatus:@"删除成功"];
            [self requestGetShareList];
        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
        }
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
    }];
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return shareList.count+1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        return [ToolScreenFit getHeightWithControlHeight:50];
    }
    return [ToolScreenFit getHeightWithControlHeight:300];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UCShareDataCell";
    
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
        [ToolFontFit setFontFromLabel:cell.textLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
        [ToolFontFit setFontFromLabel:cell.detailTextLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
    }
    

    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    if (indexPath.section == 0) {
        UIImageView *codeImg = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2 - 80, 60, 160, 160)];
        
        codeImg.image = [ToolBox getQRcode:model.data.url centerImage:[UserInfoService sharedInstance].headerImage QRsize:CGSizeMake(200, 200)];
        [cell.contentView addSubview:codeImg];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 240, viewWidth, 20)];
        label.textColor = [UIColor colorTextGrag];
        label.text = @"对方扫描二维码后获得您的血糖数据";
        label.textAlignment = NSTextAlignmentCenter;
        [ToolFontFit setFontFromLabel:label FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
        [cell.contentView  addSubview:label];
        
    }else if (indexPath.section == 1){
    
        if (indexPath.row == 0) {
            if (shareList.count == 0) {
                cell.textLabel.text = @"暂无关心我的人";
            }
            else {
                cell.textLabel.text = @"已关心我的人";
            }
        }else{
        
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([ToolScreenFit getHeightWithControlHeight:50] + 10, 0, viewWidth, [ToolScreenFit getHeightWithControlHeight:50])];
            label.textColor = [UIColor colorTextGrag];
            ShareListRecords *user = [shareList sf_objectAtIndex:indexPath.row-1];
            label.text = user.friendUserName;
            [ToolFontFit setFontFromLabel:label FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
            [cell.contentView addSubview:label];
            
            UIImageView *headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, [ToolScreenFit getHeightWithControlHeight:50] - 20, [ToolScreenFit getHeightWithControlHeight:50] - 20)];
            [headerImg sd_setImageWithURL:[NSURL URLWithString:user.friendUserPic] placeholderImage:IMAGE_HEAD_DEFAULT];
            headerImg.layer.cornerRadius =  ([ToolScreenFit getHeightWithControlHeight:50] - 20)/2;
            headerImg.layer.masksToBounds = YES;
            headerImg.layer.borderWidth = 1;
            headerImg.layer.borderColor = [UIColor colorBorderGargLighter].CGColor;
            [cell.contentView addSubview:headerImg];
        }
    }
    return cell;
}// 创建（复用）单元格



-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return   UITableViewCellEditingStyleDelete;
}
//先要设Cell可编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 && indexPath.row > 0) {
        return YES;
    }
    return NO;
}
//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    delIndex = indexPath.row-1;
    [self showAlertController:@"是否解除好友关心" buttons:@[@"取消",@"确定"] viewTag:0];
}

- (void)clickedOKEventTag:(int)tag {
    ShareListRecords *user = [shareList sf_objectAtIndex:delIndex];
    [self requestDealShareDelete:[NSNumber numberWithDouble:user.recordsIdentifier]];
}

- (void)clickedCancelEventTag:(int)tag {
    [baseTableView reloadData];
}

//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"解除";
}

- (void)navRightBut:(UIButton *)sender{
    if (!_shareToOtherView && shareParam) {
        _shareToOtherView = [[ShareToOtherView alloc] initWithShareParam:shareParam];
    }
    [_shareToOtherView showView];
}


- (void)requestGetUserQrcode {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *url = @"/user/qrcode";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            model = [QrcodeModel modelObjectWithDictionary:request.responseJSONObject];
            [baseTableView reloadData];
        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
        }
    } failure:^(QSBaseRequest *request) {
        [SVProgressHUD showInfoWithStatus:SERVER_ERROR_TIP];
        DLog(@"接口(%@) fail network",url);
    }];
}

@end
