//
//  RowCell.m
//  text
//
//  Created by lxl on 2017/5/17.
//  Copyright © 2017年 lxl. All rights reserved.
//

#import "RowCell.h"
#import "HistoryModel.h"
#import "HistoryBsDates.h"
#import "HistoryRecords.h"
#import "ToolBox.h"
#import "ToolFontFit.h"
#import "BSDetailViewController.h"

@implementation RowCell{
    CGFloat width ;
    CGFloat localCellHeight;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        width = MAIN_SCREEN_WIDTH / 9;
        localCellHeight = MAIN_SCREEN_WIDTH / 9 *1.2;
        [self drawBack];
        [self drawLines];

    }
    
    return  self;
}

- (void)drawBack
{
    for(int i=0; i < 9; i++){
        
        if (i == 0 || i == 2 || i == 3 ||i == 6 || i == 7) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(width * i, 0, width, localCellHeight)];
            view.backgroundColor = [UIColor colorBgLighter];
            [self.contentView addSubview:view];
        }
    }
}

- (void)drawLines
{
    _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 0.5)];
    _topLine.backgroundColor = [UIColor colorBorderGargLighter];
    [self.contentView addSubview:_topLine];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, localCellHeight, MAIN_SCREEN_WIDTH, 0.5)];
    _bottomLine.backgroundColor = [UIColor colorBorderGargLighter];
    [self.contentView addSubview:_bottomLine];
    
    //8条竖线
    for (int i=0; i<8; i++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(width*(i + 1), 0, 0.5, localCellHeight)];
        line.backgroundColor = [UIColor  colorBorderGargLighter];
        [self.contentView addSubview:line];
    }
   
}

- (UILabel *)addLabel:(NSInteger)position model:(HistoryRecords*)record
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width *position, 0, width, localCellHeight)];
    
    label.text = [NSString stringWithFormat:@"%0.1f", record.bsValue];
    NSString *result = [ToolBox getStateFromBSValue:label.text  type:record.timeType];
    
    label.textColor = [ToolBox getColorFromLevel:result];
    label.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody1];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
    
    
    return label;
}

- (UILabel *)addDateLabel:(NSInteger )month day:(NSInteger)day
{
    UILabel *dayLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 3, width, localCellHeight/2)];
    UILabel *monthLb = [[UILabel alloc] initWithFrame:CGRectMake(0, localCellHeight/2 - 3, width, localCellHeight/2)];


    dayLb.textColor = [UIColor colorTextBlack];
    dayLb.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody1];
    dayLb.textAlignment = NSTextAlignmentCenter;
    dayLb.text = [NSString stringWithFormat:@"%2ld",day];
    
    monthLb.textColor = [UIColor colorTextGragLight];
    monthLb.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation];
    monthLb.textAlignment = NSTextAlignmentCenter;
    monthLb.text = [NSString stringWithFormat:@"%2ld月",month];


    [self.contentView addSubview:monthLb];
    [self.contentView addSubview:dayLb];

    return nil;
}

- (UIButton *)addButton:(NSInteger)postion model:(HistoryRecords*)record arrayIndex:(NSInteger)arrayIndex
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(width *postion , 0, width, localCellHeight);
    button.tag = arrayIndex;
    
    [button setTitle:[NSString stringWithFormat:@"%0.1f",record.bsValue] forState:UIControlStateNormal];
    NSString *result = [ToolBox getStateFromBSValue:button.titleLabel.text  type:record.timeType];
    [button setTitleColor:[ToolBox getColorFromLevel:result] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(OnClickButton:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [ToolFontFit getFontNormalSizeWithType:NormalFontTypeMainbody1];
    [self.contentView addSubview:button];
    
    UIImageView *corner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBtn"]];
    corner.frame = CGRectMake(width*3/4, localCellHeight - width*1/4, width*1/4, width*1/4);
    [button addSubview:corner];
    return button;
}

- (void)OnClickButton:(UIButton *)button
{
    BSDetailViewController *vc = [[BSDetailViewController alloc] init];
    vc.bsDate = _model;
    vc.record = _model.records[button.tag];
    [_superVC.navigationController pushViewController:vc animated:YES];

}

- (void)setModel:(HistoryBsDates *)model
{
    _model = model;
    //重用cell 清掉之前的labels
    for (id obj in self.contentView.subviews){
        
        if ([obj isKindOfClass:[UILabel class]] || [obj isKindOfClass:[UIButton class]]) {
            [obj removeFromSuperview];
        }
    }
    
    //日期
    NSArray *selectedArray = [model.dateTime componentsSeparatedByString:@"-"];
    [self addDateLabel:[[selectedArray sf_objectAtIndex:1] intValue] day:[[selectedArray sf_objectAtIndex:2] intValue]];

    
    for (int i=0; i< model.records.count; i++) {
        HistoryRecords *record = model.records[i];
        
        //根据timeType放入对应的位置 index 对应值范围是1到8
        NSInteger index = [record.timeType integerValue];
        
        //多条数据则加UIButton
        if(record.bsValue > 0 && record.sumRecords > 1){
            
            [self addButton:index model:record arrayIndex:i];
        }
        //只有一条数据则加UILabel
        else{
            [self addLabel:index model:record];
        }
    }
    
  
}

@end
