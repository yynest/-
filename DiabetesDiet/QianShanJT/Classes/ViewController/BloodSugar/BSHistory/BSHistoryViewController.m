//
//  BSHistoryViewController
//  text
//
//  Created by lxl on 2017/5/15.
//  Copyright © 2017年 lxl. All rights reserved.
//

#import "BSHistoryViewController.h"
#import "ColorCircleView.h"
#import "RowCell.h"
#import "HistoryData.h"
#import "HistoryUserBSStatistics.h"
#import "HistoryBsDates.h"

@interface BSHistoryViewController () {
    HistoryUserBSStatistics *historyStatistics;
    NSArray * historyAllData;
    
}

@property(nonatomic, strong)UIView *headView;
@property(nonatomic, strong)UILabel *highLabel;
@property(nonatomic, strong)UILabel *namolLabel;
@property(nonatomic, strong)UILabel *lowLabel;
@property(nonatomic, strong)ColorCircleView *circleView;


@end

@implementation BSHistoryViewController
{
    UICollectionView *collectView;
    CGFloat localCellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    localCellHeight = MAIN_SCREEN_WIDTH/9 *1.2;
    
    self.navTitle = @"血糖历史数据";
    
    baseTableView.backgroundColor = [UIColor whiteColor];
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addMJRefreshFooter];
    //请求历史数据
    [self requestHistoryData];
}

//上拉加载更多数据
- (void)loadMoreData{
    //请求历史数据
    [self requestHistoryData];
}

- (void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    
}

//请求历史数据
- (void)requestHistoryData {
    [[UserInfoService sharedInstance] requestHistoryWithPageNum:pageNumber successBlock:^{
        //处理数据
        historyStatistics = [UserInfoService sharedInstance].historyStatistics;
        historyAllData = [UserInfoService sharedInstance].historyAllData;
        if (historyAllData.count > 0) {
            //更新统计
            [self updateStatics];
            //更新tableview
            baseTableView.frame = CGRectMake(0, CGRectGetMaxY(self.headView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.headView.frame));
            [baseTableView reloadData];
            pageNumber++;
        }
        else {
            [self addEmptyViewWithType:EmptyViewTypeNOData withTitle:@"暂时没有血糖数据"];
        }
        [self endTableViewRefreshing:YES isUpdate:NO];
    }failureBlock:^{
        [self endTableViewRefreshing:NO isUpdate:NO];
        [self addEmptyViewWithType:EmptyViewTypeNoNetwork withTitle:nil];
    }];
}
- (NSAttributedString *)attributeStr:(NSString *)str color:(UIColor *)color{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [attributeString addAttributes:@{NSForegroundColorAttributeName : color, NSFontAttributeName : [ToolFontFit getFontNormalSizeWithType:NormalFontTypeTitle]} range:NSMakeRange(0, str.length)];

     [attributeString addAttributes:@{NSForegroundColorAttributeName : [UIColor colorTextGragLight],	NSFontAttributeName : [ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation]} range:NSMakeRange(str.length - 1 , 1)];
    
    return attributeString;

}

- (void)updateStatics {
    [self.view addSubview:self.headView];

    _highLabel.attributedText =[self attributeStr:[NSString stringWithFormat:@"%d 次",(int)historyStatistics.heightCount] color: [UIColor colorHighlightRed]];
    _namolLabel.attributedText =[self attributeStr:[NSString stringWithFormat:@"%d 次",(int)historyStatistics.normalCount]color: [UIColor colorMainGreen]];
    _lowLabel.attributedText =[self attributeStr:[NSString stringWithFormat:@"%d 次",(int)historyStatistics.lowCount]color: [UIColor colorHighlightYellow]];
    
    [self updateCircleView];

}
- (void)updateCircleView
{
    float a = historyStatistics.normalCount,b=historyStatistics.lowCount,c=historyStatistics.heightCount;
    _circleView.circleArray =@[
                               @{
                                   @"strokeColor":[UIColor colorMainGreen],
                                   @"precent"    :@(a/(a+b+c))
                                   },
                               @{
                                   @"strokeColor":[UIColor colorHighlightYellow],
                                   @"precent"    :@(b/(a+b+c))
                                   },
                               @{
                                   @"strokeColor":[UIColor colorHighlightRed],
                                   @"precent"    :@(c/(a+b+c))
                                   }
                               ];

}

- (UIView *)headView{

    
    if (!_headView) {
        
        //格子长宽
        CGFloat width = MAIN_SCREEN_WIDTH/9;
        CGFloat height = width*1.4;
        
        CGFloat circleWidth = width*2 - 45;
        //headView 高度计算
        CGFloat headHeight = 20 + circleWidth + 30 + height;
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, headHeight)];
        bgView.backgroundColor = [UIColor whiteColor];
        

        //占比圆圈
        //圆圈阴影
     
        ColorCircleView *view = [[ColorCircleView alloc] initWithFrame:CGRectMake(width-circleWidth/2, width-circleWidth/2, circleWidth, circleWidth)];
        UIImageView *shadow = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.origin.x-10, view.frame.origin.y-8, circleWidth + 20, circleWidth + 20)];
        shadow.image = [UIImage imageNamed:@"circleShadow"];
        [self updateCircleView];
        _circleView = view;
        [bgView addSubview:view];
        [bgView insertSubview:shadow belowSubview:view];
        
        //分隔线
        UIImageView *spLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spLineView"]];
        spLine.frame = CGRectMake(width*2, CGRectGetMinY(view.frame), 1, width*2 - 35);
        [bgView addSubview:spLine];

        //次数
        UILabel *high = [self JTLabel:bgView];
        high.frame = CGRectMake(width*2, CGRectGetMinY(view.frame), width*2, CGRectGetHeight(view.frame)/2);
        high.text = @"偏高";
        
        UILabel *nomal = [self JTLabel:bgView];
        nomal.frame = CGRectMake(CGRectGetMaxX(high.frame) , CGRectGetMinY(view.frame), width*2, CGRectGetHeight(view.frame)/2);
        nomal.text = @"正常";
        
        UILabel *low = [self JTLabel:bgView];
        low.frame = CGRectMake(CGRectGetMaxX(nomal.frame), CGRectGetMinY(view.frame), width*2, CGRectGetHeight(view.frame)/2);
        low.text = @"偏低";
        
        _highLabel = [self JTLabel:bgView];
        _highLabel.frame = CGRectMake(width*2, CGRectGetMaxY(high.frame)+4, width*2, CGRectGetHeight(view.frame)/2);
        _highLabel.text = @"";
        _highLabel.textColor = [UIColor colorHighlightRed];
        
        _namolLabel = [self JTLabel:bgView];
        _namolLabel.frame = CGRectMake(CGRectGetMaxX(_highLabel.frame) , CGRectGetMaxY(high.frame)+4, width*2, CGRectGetHeight(view.frame)/2);
        _namolLabel.text = @"";
        _namolLabel.textColor = [UIColor colorMainGreen];
        
        _lowLabel = [self JTLabel:bgView];
        _lowLabel.frame = CGRectMake(CGRectGetMaxX(_namolLabel.frame), CGRectGetMaxY(high.frame)+4, width*2, CGRectGetHeight(view.frame)/2);
        _lowLabel.text = @"";
        _lowLabel.textColor = [UIColor colorHighlightYellow];
        
      
        //labels
        NSArray *titleArray = @[@"日期",@"凌晨",@"早餐",@"前",@"后",@"午餐",@"前",@"后",@"晚餐",@"前",@"后",@"睡前"];
        NSArray *x = @[@0,[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width*2],[NSNumber numberWithFloat:width*2],[NSNumber numberWithFloat:width*3],[NSNumber numberWithFloat:width*4],[NSNumber numberWithFloat:width*4],[NSNumber numberWithFloat:width*5],[NSNumber numberWithFloat:width*6],[NSNumber numberWithFloat:width*6],[NSNumber numberWithFloat:width*7],[NSNumber numberWithFloat:width*8]];
        CGFloat offy = CGRectGetMaxY(view.frame) + 30;
        NSArray *y = @[[NSNumber numberWithFloat:offy],[NSNumber numberWithFloat:offy],[NSNumber numberWithFloat:offy],[NSNumber numberWithFloat:offy+height/2],[NSNumber numberWithFloat:offy+height/2],[NSNumber numberWithFloat:offy],[NSNumber numberWithFloat:offy+height/2], [NSNumber numberWithFloat:offy +height/2],[NSNumber numberWithFloat:offy],[NSNumber numberWithFloat:offy + height/2],[NSNumber numberWithFloat:offy +height/2],[NSNumber numberWithFloat:offy]];
        NSArray *w = @[[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width*2],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width*2],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width*2],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width]];
        
        NSArray *h = @[[NSNumber numberWithFloat:height],[NSNumber numberWithFloat:height],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height/2],[NSNumber numberWithFloat:height]];
        for (int i = 0; i<titleArray.count; i++) {
            UILabel *label = [self JTLabel:bgView];
            label.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2];
            label.backgroundColor = [UIColor colorBgLighter];
            
            if (i == 1 || i == 5 || i == 6 || i == 7 || i == 11) {
                label.backgroundColor = [UIColor whiteColor];
            }
            label.text = titleArray[i];
            label.frame = CGRectMake([x[i] floatValue] , [y[i] floatValue], [w[i] floatValue] , [h[i] floatValue]);
            [bgView addSubview:label];
            
            //画线
            //3条横线
            for (int i=0; i<3; i++) {
                UIView *line = [[UIView alloc] init];
                line.backgroundColor = [UIColor colorBorderGargLighter];
                [bgView addSubview:line];
                
                if (i == 0) {
                    line.frame = CGRectMake(0, CGRectGetMaxY(view.frame) + 30, self.view.frame.size.width, 0.5);
                }else if(i == 1){
                    line.frame = CGRectMake(width*2, CGRectGetMaxY(view.frame) + 30 + height/2, width*6 , 0.5);
                }else{
                    line.frame = CGRectMake(0, CGRectGetMaxY(view.frame) + 30 + height, self.view.frame.size.width, 0.5);
                }
            }
            //5条长竖线
            NSArray *array = @[[NSNumber numberWithFloat:width],[NSNumber numberWithFloat:width*2],[NSNumber numberWithFloat:width*4],[NSNumber numberWithFloat:width*6],[NSNumber numberWithFloat:width*8]];
            for (int i = 0; i<5; i++) {
                UIView *line = [[UIView alloc] init];
                line.backgroundColor = [UIColor colorBorderGargLighter];
                [bgView addSubview:line];
                
                line.frame = CGRectMake(0, CGRectGetMaxY(view.frame) + 30, 0.5, height);
                CGRect myFrame = line.frame;
                myFrame.origin.x = [array[i] floatValue];
                line.frame = myFrame;
                
            }
            //3条短竖线
            NSArray *array2 = @[[NSNumber numberWithFloat:width*3],[NSNumber numberWithFloat:width*5],[NSNumber numberWithFloat:width*7]];
            for (int i=0; i<3; i++) {
                UIView *line = [[UIView alloc] init];
                line.backgroundColor = [UIColor colorBorderGargLighter];
                [bgView addSubview:line];
                line.frame = CGRectMake(0, CGRectGetMaxY(view.frame) + 30 +  height/2, 0.5, height/2);
                CGRect myFrame = line.frame;
                myFrame.origin.x = [array2[i] floatValue];
                line.frame = myFrame;
            }
        }
        _headView = bgView;
    }
    return _headView;
}
/*
- (UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.headView.frame)) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}
*/
- (UILabel *)JTLabel:(UIView *)superView
{
    UILabel *label = [[UILabel alloc] init];
    
    label.textColor = [UIColor colorTextBlack];
    label.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeTitle];
    label.textAlignment = NSTextAlignmentCenter;
    [superView addSubview:label];
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return historyAllData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * array = historyAllData[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *uniqueStr = @"rowCell";
    RowCell *cell = [tableView dequeueReusableCellWithIdentifier:uniqueStr];
    if (!cell) {
        cell = [[RowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:uniqueStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.superVC = self;
    }
     NSArray * array = historyAllData[indexPath.section];
    
    //判断 是string类型 或model类型
    id model = array[indexPath.row];
    
    if ([model isKindOfClass:[NSString class]]) {
        UITableViewCell *cell =  [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor colorBgLighter];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *label = [self JTLabel:cell.contentView] ;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorDisableBTGrag];
        CGRect frame = cell.frame;
        frame.size.height = 30;
        frame.size.width = MAIN_SCREEN_WIDTH;
        label.frame = frame;
        label.text = model;
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 0.5)];
        topLine.backgroundColor = [UIColor colorBorderGargLighter];
        [cell.contentView addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 30, MAIN_SCREEN_WIDTH, 0.5)];
        bottomLine.backgroundColor = [UIColor colorBorderGargLighter];
        [cell.contentView addSubview:bottomLine];
        bottomLine.hidden = YES;

        //如果不是section最后的row,则隐藏bottom Line
        if (indexPath.row == array.count - 1) {
            bottomLine.hidden = NO;
        }
        
        return cell;
    }else if ([model isKindOfClass:[HistoryBsDates class]]){
        cell.model = array[indexPath.row];
        cell.bottomLine.hidden = YES;

        //如果不是section最后的row,则隐藏bottom Line
        if (indexPath.row == array.count - 1) {
            cell.bottomLine.hidden = NO;
        }

    }
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * array = historyAllData[indexPath.section];
    //判断 是string类型 或model类型
    id model = array[indexPath.row];
    if ([model isKindOfClass:[NSString class]]) {
        return 30;
    }else{
        return localCellHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return localCellHeight;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *view = [self JTLabel:nil];
    view.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody2];
    view.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, localCellHeight);
    view.backgroundColor = [UIColor whiteColor];
    
    //月份计算
    NSArray *array = historyAllData[section];
    for(id obj in array){
        if ([obj isKindOfClass:[HistoryBsDates class]]) {
 
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date=[formatter dateFromString:((HistoryBsDates *)obj).dateTime];
        view.text =  [ToolBox getCurrentYearMonthWithTimestamp:[ToolBox getTimestampFromDate:date]];
        break;
        }
    }
    
    return view;
}



@end
