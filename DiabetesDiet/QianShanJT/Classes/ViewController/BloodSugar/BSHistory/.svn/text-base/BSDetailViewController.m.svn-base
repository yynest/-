//
//  BSDetailViewController.m
//  QianShanJT
//
//  Created by lxl on 2017/5/17.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "BSDetailViewController.h"
#import "HistoryBsDates.h"
#import "HistoryRecords.h"
#import "QSBaseRequest.h"
#import "HistoryTypeModel.h"
#import "HistoryTypeData.h"
#import "HistoryTypeLists.h"

#define locateRowHeight (62)

@interface BSDetailViewController ()

@end

@implementation BSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"记录详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    viewRect = [UIScreen mainScreen].bounds;
    baseTableView.frame = viewRect;
    if (_bsDate && _record) {
        [self requestBSRecordListOfDateTime];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestBSRecordListOfDateTime {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:_bsDate.dateTime forKey:@"dateTime"];
    [dic sf_setObject:@"0" forKey:@"pageNum"];
    [dic sf_setObject:@"100" forKey:@"pageSize"];
    [dic sf_setObject:_record.timeType forKey:@"timeType"];
    NSString *url = @"/bsrecord/listofdate";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        DLog(@"%@",request.responseJSONObject);
        if (error == 0) {
            //处理数据
            HistoryTypeModel *model = [HistoryTypeModel modelObjectWithDictionary:request.responseJSONObject];
            DLog(@"%@",model);
            dataList = model.data.lists;
            [baseTableView reloadData];
        }
        else if (error == 10005) {
            [self addEmptyViewWithType:EmptyViewTypeNOData withTitle:@"暂时没有血糖数据"];
        }
        else{
            [SVProgressHUD showInfoWithStatus:request.responseStatusString];
            DLog(@"接口(%@)fail data",url);
        }
    } failure:^(QSBaseRequest *request) {
        [self addEmptyViewWithType:EmptyViewTypeNoNetwork withTitle:nil];
    }];
    
}


#pragma UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (void)addLabels:(UITableViewCell *)cell
{
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(MAIN_SCREEN_WIDTH - 120, locateRowHeight/2, 100, 20)];
    label1.textAlignment = NSTextAlignmentRight;
    label1.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2];
    label1.textColor = [UIColor colorTextGragLight];
    label1.tag = 1;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, MAIN_SCREEN_WIDTH - 100, locateRowHeight)];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody1];
    label2.textColor = [UIColor colorTextGragLight];
    label2.tag = 2;

    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(MAIN_SCREEN_WIDTH - 120, 10, 100, 20)];
    label3.textAlignment = NSTextAlignmentRight;
    label3.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2];
    label3.textColor = [UIColor colorTextGrag];
    label3.tag = 3;

    [cell.contentView addSubview:label1];
    [cell.contentView addSubview:label2];
    [cell.contentView addSubview:label3];
}

- (void)updateLables:(HistoryTypeLists *)model cell:(UITableViewCell *)cell
{
    UILabel *label1 = [cell viewWithTag:1];
    UILabel *label2 = [cell viewWithTag:2];
    UILabel *label3 = [cell viewWithTag:3];
    
    NSString *result = [ToolBox getStateFromBSValue:[NSString stringWithFormat:@"%0.1f", model.bsValue]type:model.timeType];
    
    label1.text =[NSString stringWithFormat:@"%@ %@", [ToolBox getTextFromTime:model.timeType],  [ToolBox getHoursAndMinutesFromTimestamp:[NSNumber numberWithDouble:model.recordTime]]];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%0.1f mmol/L",model.bsValue]];
    
    [attributeString addAttributes:@{NSForegroundColorAttributeName : [ToolBox getColorFromLevel:result],	NSFontAttributeName : [ToolFontFit getFontSpecialSizeWithType:SpecialFontTypeBig2]} range:NSMakeRange(0, attributeString.length)];
    
    [attributeString addAttributes:@{NSForegroundColorAttributeName :[UIColor colorTextGragLight],	NSFontAttributeName : [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2]} range:NSMakeRange(attributeString.length-6, 6)];

    label2.attributedText = attributeString;

    NSArray *array = @[@"血糖偏低",@"血糖偏低",@"血糖正常",@"血糖偏高"];
    label3.text =   [array objectAtIndex:[result integerValue] - 1];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCell = @"strCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addLabels:cell];
    }
    NSInteger row = indexPath.row;
    HistoryTypeLists *model = dataList[row];
    [self updateLables:model cell:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return locateRowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == dataList.count - 1) {
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
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
