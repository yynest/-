//
//  BSRecordVC.m
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/15.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "BSRecordVC.h"
#import "DYScrollRulerView.h"
#import "ZHPickView.h"
#import "QSBaseRequest.h"
#import "BSResultVC.h"
@interface BSRecordVC ()<DYScrollRulerDelegate,ZHPickViewDelegate,DelegateBackRoot>
{

    CGFloat     myValue;
    NSDate  *selectDate;
    NSArray  *textArray;
}
@property(nonatomic,strong)DYScrollRulerView *rullerView;
@property(nonatomic,strong)  NSMutableArray  *detailArr;

@end

@implementation BSRecordVC

-(NSMutableArray *)detailArr{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString* inputDate = [inputFormatter stringFromDate:[NSDate date]];
   
 
    if (_detailArr == nil) {
        _detailArr = [[NSMutableArray alloc]initWithArray:@[inputDate,[ToolBox getTimeParagraphFromHour:[NSDate date]]]];
         selectDate = [NSDate date];
    }
    return _detailArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;
    textArray = @[@"过度肥胖的人减掉5%的体重就能将糖尿病发病率降低70%。计算一下每日的摄入量，看看自己该少吃多少。",
                  @"选用小号餐具能减少食量，降低对食物的摄取欲望和热量摄入，保持合理体重。",
                  @"与其他饮品相比，绿茶由于未经发酵，多酚的含量较高。多酚具有较强的抗氧化性能和降血糖作用，它还能对血糖的释放起到控制作用",
                  @"2型糖尿病患者血糖控制欠佳时忌运动。",
                  @"2型糖尿病患者运动强度宜适中，一般来说以身体微微出汗为度。",
                  @"餐前吃点含脂肪的食物，如杏仁、核桃等坚果，除了增加饱腹感，让你在正餐时少吃点，坚果里的不饱和脂肪酸还有助于改善糖尿病患者的胰岛素水平，减慢食物消化速度，从而有利于控制餐后血糖。",
                  @"2型糖尿病患者通过加强锻炼一般都会得到更好的血糖控制。即使是很简单的运动，如每天步行20分钟，只要能坚持下去，就可以有效地改善胰岛素抵抗和减轻体重。"];
    baseTableView.frame = CGRectMake(0, 0, viewWidth, viewHeight - 64 - 50);
    baseTableView.bounces = NO;

    self.NavLeftImage = @"backArrow";
    self.navTitle = @"血糖记录";
    baseTableView.rowHeight = [ToolScreenFit getHeightWithControlHeight:60];
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, 100)];
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, [ToolScreenFit getHeightWithControlHeight:276],[ToolScreenFit getHeightWithControlHeight:86]);
    saveBtn.center = CGPointMake(viewWidth/2, 20+[ToolScreenFit getHeightWithControlHeight:86]/2);
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"com_bt_nor"] forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"com_bt_high"] forState:UIControlStateHighlighted];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"com_bt_dis"] forState:UIControlStateDisabled];
    [saveBtn addTarget:self action:@selector(toSave) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:saveBtn];
    baseTableView.tableFooterView = footView;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, viewHeight - 64 - 60, viewWidth - 40, 40)];
    label.textColor = [UIColor colorTextGragLight];
    label.numberOfLines = 0;
    [ToolFontFit setFontFromLabel:label FontType:FontTypeNormal WithType:NormalFontTypeExplanation];
    int x = arc4random() % textArray.count;
    label.text = textArray[x];
    
    CGSize strSize = [label.text boundingRectWithSize:CGSizeMake(viewWidth - 40, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[ToolFontFit getFontNormalSizeWithType:NormalFontTypeExplanation ]} context:nil].size;
    label.frame = CGRectMake(20, viewHeight - 64 - strSize.height - 20, viewWidth - 40, strSize.height);
    [self.view addSubview:label];
    
    
    
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, viewHeight - 64 - 25, viewWidth - 40, 20)];
//    label2.textColor = [UIColor colorTextGragLight];
//    label2.textAlignment = NSTextAlignmentRight;
//    [ToolFontFit setFontFromLabel:label2 FontType:FontTypeNormal WithType:NormalFontTypeExplanation];
//    label2.text = @"-毛泽东";
//    [self.view addSubview:label2];
}

- (void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section < 2) {
        return [ToolScreenFit getHeightWithControlHeight:50];
    }
    return 190;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecordCell";
    
    
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
    
    NSArray *textArr = @[@"日期",@"时间"];
   
    if (indexPath.section < 2) {
        cell.textLabel.text = textArr[indexPath.section];
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake( MAIN_SCREEN_WIDTH - 250,0, 210, [ToolScreenFit getHeightWithControlHeight:50])];
        label2.text = self.detailArr[indexPath.section];
        label2.textAlignment = NSTextAlignmentRight;
        label2.textColor = [UIColor colorTextGrag];
        [ToolFontFit setFontFromLabel:label2 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
        [cell.contentView addSubview:label2];

        //箭头
        UIButton *arrowBut = [UIButton buttonWithType:UIButtonTypeCustom];
        arrowBut.frame = CGRectMake(viewWidth - 30, [ToolScreenFit getHeightWithControlHeight:50]/2 - 7.5, 8, 15);
        [arrowBut setImage:[UIImage imageNamed:@"home_arrow2"] forState:UIControlStateNormal];
        [cell.contentView addSubview:arrowBut];

    }else if (indexPath.section == 2){
    
//        self.rullerView.layer.shadowColor = [UIColor grayColor].CGColor;//shadowColor阴影颜色
//        self.rullerView.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//        self.rullerView.layer.shadowOpacity = 0.5;//阴影透明度，默认0
//        self.rullerView.layer.shadowRadius = 1;//阴影半径，默认3
//        self.rullerView.layer.cornerRadius = 2;
//        
//
  
        UIImageView  *bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 70, viewWidth - 20, 70)];
        bgImage.image = [UIImage imageNamed:@"biaochi"];
        bgImage.userInteractionEnabled = YES;
        [cell.contentView addSubview:bgImage];
        [bgImage addSubview:self.rullerView];
        
        
        
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake( 0, [DYScrollRulerView rulerViewHeight] + 30, viewWidth,20)];
        label2.text = @"左右滑动调整血糖值";
        label2.textAlignment = NSTextAlignmentCenter;
        label2.textColor = [UIColor colorTextGrag];
        [ToolFontFit setFontFromLabel:label2 FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
        [cell.contentView addSubview:label2];
        
    }
       return cell;
    
    
}// 创建（复用）单元格

#pragma mark - TableView Datasource

-(DYScrollRulerView *)rullerView{
    if (!_rullerView) {
    
        CGFloat rullerHeight = [DYScrollRulerView rulerViewHeight];
        _rullerView = [[DYScrollRulerView alloc]initWithFrame:CGRectMake(10, -55, viewWidth - 40, rullerHeight) theMinValue:0 theMaxValue:34 theStep:0.1 theUnit:@"" theNum:10];
        [_rullerView setDefaultValue:4.4 animated:YES];
        myValue = 4.4;
        _rullerView.bgColor = [UIColor whiteColor];
        _rullerView.triangleColor   = [UIColor colorMainGreen];
        _rullerView.delegate        = self;
        _rullerView.scrollByHand    = YES;
      //  _rullerView.labelColor = [UIColor colorMainGreen];
    }
    return _rullerView;
}
#pragma mark - YKScrollRulerDelegate
-(void)dyScrollRulerView:(DYScrollRulerView *)rulerView valueChange:(float)value{
    
   // NSLog(@"value->%.1f",value);
      CGFloat num1 = floor(value  * 10) / 10;
      myValue = num1;

    NSString *type;
    type = [ToolBox getTimeTypeWithString:self.detailArr[1]];
   NSString *str = [ToolBox getStateFromBSValue:[NSString stringWithFormat:@"%.1f",myValue] type:type];
    if ([str isEqualToString:@"1"] || [str isEqualToString:@"2"]) {
      self.rullerView.valueTF.textColor = [UIColor colorHighlightYellow];
  
    }else if ([str isEqualToString:@"3"]){
    self.rullerView.valueTF.textColor = [UIColor colorMainGreen];
    }else if ([str isEqualToString:@"4"]){
        self.rullerView.valueTF.textColor = [UIColor colorHighlightRed];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
     //   NSDate *date = [NSDate date];
        ZHPickView *pickview=[[ZHPickView alloc] initDatePickWithDate:selectDate title:@"日期" datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
        pickview.tag = 100;
        pickview.delegate = self;
        pickview.datePicker.maximumDate = [NSDate date];
        [pickview show];
        [pickview setDefaultSelectDate:selectDate];
    }else if (indexPath.section == 1){
       
        ZHPickView *pickview = [[ZHPickView alloc] initPickviewWithArray:[ToolBox getTimeArray] isHaveNavControler:NO];
        [pickview setTitle:@"时间"];
        pickview.tag = 200;
        pickview.delegate = self;
        
        [pickview setDefaultSelectRow:[[ToolBox getTimeTypeWithString:self.detailArr[1]] integerValue] - 1];
        [pickview show];

    }
}
-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView result:(id)result{

    if (result) {
        if (pickView.tag == 100) {
            
            NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
            [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
            [inputFormatter setDateFormat:@"yyyy年MM月dd日"];
            NSString* inputDate = [inputFormatter stringFromDate:pickView.datePicker.date];
            DLog(@"%@",inputDate);
            selectDate = pickView.datePicker.date;
            [self.detailArr replaceObjectAtIndex:0 withObject:inputDate];
            [baseTableView reloadData];
        }else{
            [self.detailArr replaceObjectAtIndex:1 withObject:result];
            [baseTableView reloadData];
        }

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)toSave{
  
    if (myValue >= 0) {
        NSString *type;
        type = [ToolBox getTimeTypeWithString:self.detailArr[1]];
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic sf_setObject:[NSNumber numberWithFloat:myValue] forKey:@"bsValue"];
        [dic sf_setObject:@"0" forKey:@"lat"];
        [dic sf_setObject:@"0" forKey:@"lng"];
        [dic sf_setObject:[NSString stringWithFormat:@"%@",[ToolBox getTimestampFromDate:selectDate]] forKey:@"recordTime"];
        [dic sf_setObject:type forKey:@"timeType"];
        NSString *url = @"/bsrecord/add";
        //请求
        QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
        [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
            NSUInteger error = request.responseStatusCode;
            DLog(@"%@",request.responseJSONObject);
            if (error == 0) {
                //处理数据
            }
            else{
                //缓存
                [UserDefaultsHelper addLocalCacheBloodData:dic];
            }
            [self presentResultViewWithType:type bsValue:[NSString stringWithFormat:@"%.1f",myValue]];
        } failure:^(QSBaseRequest *request) {
            //缓存
            [UserDefaultsHelper addLocalCacheBloodData:dic];
            [self presentResultViewWithType:type bsValue:[NSString stringWithFormat:@"%.1f",myValue]];
        }];

    }else{
    
        [SVProgressHUD showInfoWithStatus:@"血糖值不能为0"];
    }
   }

- (void)presentResultViewWithType:(NSString *)type bsValue:(NSString *)value {
    BSResultVC *vc = [[BSResultVC alloc]init];
    vc.delegate = self;
    vc.type = type;
    vc.myBSValue = value;
    [self.navigationController presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)backRootViewController {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
