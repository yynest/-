//
//  UCInforVC.m
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/8.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "UCInforVC.h"
#import "UCInforCell.h"
#import "DLAVAlertViewController.h"
#import "FSMediaPicker.h"
#import "ZHPickView.h"
#import "DLAVAlertView.h"
#import "InputWordVC.h"
#import "MedicalRecordUpdate.h"
#import "UserInfoModel.h"
#import "UserInfoUser.h"
#import "UserInfoModel.h"
#import "UserInfoData.h"
#import "UserInfoPicture.h"
@interface UCInforVC ()<UITableViewDelegate,UITableViewDataSource,DLAVAlertViewDelegate,ZHPickViewDelegate,FSMediaPickerDelegate,InputWordDelegate>
{

    DLAVAlertView *curAlertView;

    
    FSMediaPicker *fsPicker;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ZHPickView *pickview;
@end

@implementation UCInforVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"个人信息";
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    baseTableView.frame = CGRectMake(0, 0, viewWidth, viewHeight);
}

- (void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    
}

#pragma mark UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UCInforCell";
    
    UCInforCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    
    if (cell == nil) {
        
        cell = [[UCInforCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    NSArray *textArray1 = @[@"修改头像",@"姓名",@"手机号"];
    NSArray *textArray2 = @[@"性别",@"身高",@"体重",@"出生年月",@"糖尿病类型",@"确诊年份"];
    NSArray *detailTextArray1 = @[self.userInfo.name,self.userInfo.mobile];
    
    NSString *sex;
    if (self.userInfo.sex == 1  ) {
        sex = @"男";
    }else{
        sex = @"女";
    }
    
    NSString *type ;
    if (self.userInfo.bsType == 1) {
        type = @"1型糖尿病";
    }else if (self.userInfo.bsType == 2){
    type = @"2型糖尿病";
    }else if (self.userInfo.bsType == 3){
        type = @"妊娠糖尿病";
    }else if (self.userInfo.bsType == 4){
        type = @"其他类型";
    }else if (self.userInfo.bsType == 0){
        type = @"未填写";
    }
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:self.userInfo.birthday/1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];

    
    NSArray *detailTextArray2 = @[sex,[NSString stringWithFormat:@"%.0fCM",self.userInfo.height],[NSString stringWithFormat:@"%.0fKG",self.userInfo.weight],confromTimespStr,type,[NSString stringWithFormat:@"%.0f",self.userInfo.bsSikeage]];
    if (indexPath.section == 0) {
        cell.textLabel.text = textArray1[indexPath.row];
        if (indexPath.row >0) {
            cell.detailTextLabel.text = detailTextArray1[indexPath.row - 1];
        }
        if (indexPath.row == 2) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            
        }
    }else if (indexPath.section == 1){
        cell.textLabel.text = textArray2[indexPath.row];
        cell.detailTextLabel.text = detailTextArray2[indexPath.row];
    }
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(20, 50 - 0.5, viewWidth - 20, 0.5)];
    lineView.backgroundColor = [UIColor colorBorderGargLighter];
    [cell.contentView addSubview:lineView];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth , 0.5)];
            lineView.backgroundColor = [UIColor colorBorderGargLighter];
            [cell.contentView addSubview:lineView];
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth - 50 - 20, 10, 30, 30)];
            imageView.layer.cornerRadius = 30/2;
            imageView.layer.masksToBounds = YES;
            imageView.layer.borderColor = [UIColor whiteColor].CGColor;
            imageView.layer.borderWidth = 0.5;
             [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",self.userInfo.picture.path,self.userInfo.picture.name,self.userInfo.picture.suffix] ] placeholderImage:IMAGE_HEAD_DEFAULT];
            [cell.contentView addSubview:imageView];
        }
        if (indexPath.row == 2) {
            lineView.frame = CGRectMake(0, 50 - 0.5, viewWidth , 0.5);
        }
    }else if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth , 0.5)];
            lineView.backgroundColor = [UIColor colorBorderGargLighter];
            [cell.contentView addSubview:lineView];
        }if (indexPath.row == 5) {
            lineView.frame = CGRectMake(0, 50-0.5, viewWidth , 0.5);
            
        }}

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self setHead];
        }else if (indexPath.row == 1){
            [self setName];
        }else if (indexPath.row == 2){
            
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [self setSex];

        }else if (indexPath.row == 1){
            [self setHeight];
        }else if (indexPath.row == 2){
            [self setWeight];
        }else if (indexPath.row == 3){
            [self setBirthDay];
        }else if (indexPath.row == 4){
            [self setDiabetesType];
        }else if (indexPath.row == 5){
            [self setDiagnosisYears];
        }
    }
}

- (void)setBirthDay
{
    NSDate *date = [NSDate date];
    ZHPickView *pickview=[[ZHPickView alloc] initDatePickWithDate:date title:@"出生年月" datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
    pickview.tag = 100;
    pickview.delegate = self;
    [pickview show];
    [pickview setDefaultSelectDate:[ToolBox getDateFromTimestamp:[NSNumber numberWithDouble:self.userInfo.birthday]]];
}
- (void)setHead
{
    [self showActionSheet];
    
}

-(void)clickCamera{
    [self leftHead];
}

-(void)clickPhoto{
    [self rightHead];
}

- (void)leftHead
{
    [curAlertView dismissWithClickedButtonIndex:0 animated:YES];
    if (![ToolBox canVideo]) {
        return;
    }
    if (!fsPicker) {
        fsPicker = [[FSMediaPicker alloc] init];
    }
    fsPicker.mediaType = FSMediaTypePhoto;
    fsPicker.editMode  = FSEditModeStandard;
    fsPicker.delegate = self;
    [fsPicker takePhotoFromCamera];
    
}

- (void)rightHead
{
    [curAlertView dismissWithClickedButtonIndex:0 animated:YES];
    if (!fsPicker) {
        fsPicker = [[FSMediaPicker alloc] init];
    }
    fsPicker.mediaType = FSMediaTypePhoto;
    fsPicker.editMode = FSEditModeStandard;
    fsPicker.delegate = self;
    [fsPicker takePhotoFromPhotoLibrary];
}
#pragma mark - FSMediaPickerDelegate

- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    if (mediaInfo.mediaType == FSMediaTypeVideo) {
    }
    else {
   
        UIImage *img2 = mediaInfo.editedImage;
        UIImage *image = [ToolBox imageScaleHandle:img2];
        NSData *data = UIImagePNGRepresentation(image);
        
        [SVProgressHUD showWithStatus:@"图片发送中"];
        [[QNManager sharedInstance]putDataType:@"1" data:data suffix:@"png" complete:^(BOOL isSuccess, NSString * _Nullable path) {
            [SVProgressHUD dismiss];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setValue:path forKey:@"headPic"];
            [dic setValue:@"0" forKey:@"isOverride"];
            [self requestUpdateUserInfoWithDic:dic];
        }];
        
    }
}




- (void)setName
{
    InputWordVC *vc = [[InputWordVC alloc]init];
    vc.navTitle= @"修改昵称";
    vc.textStr = @"";
    vc.maxLength = [NSNumber numberWithInt:16];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)setSex
{
    [self showOnePickerType:patientTypeSex];
    
}

- (void)setHeight{
    [self showOnePickerType:patientTypeHeight];
}
- (void)setWeight{
    [self showOnePickerType:patientTypeWeight];
}

- (void)setDiabetesType{
    [self showOnePickerType:patientTypeDiabetesType];
}
- (void)setDiagnosisYears{
    [self showOnePickerType:patientTypeDiagnosisYears];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Birthday pick delegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView result:(id)result
{
    if (result) {
        NSLog(@"%@",result);
        NSInteger tag = pickView.tag;
       
            if (tag == 100) {//时间
               NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[pickView.datePicker.date timeIntervalSince1970]];
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                
                [dic sf_setObject:[NSNumber numberWithInteger:[timeSp integerValue] * 1000] forKey:@"birthday"];
                [self requestUpdateUserInfoWithDic:dic];
            }
     
        else {//
            NSString *string = [NSString stringWithFormat:@"%@",result];
            NSLog(@"%@",string);
            patientType type = (int)pickView.tag;
            
            switch (type) {
                case patientTypeSex:{
                    if ([string isEqualToString:@"男"]) {
                        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                        [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"sex"];
                        [self requestUpdateUserInfoWithDic:dic];
                    }else{
                        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                        [dic sf_setObject:[NSNumber numberWithInt:2] forKey:@"sex"];
                        [self requestUpdateUserInfoWithDic:dic];
                    }
                }
                    break;
                case patientTypeHeight:{
                    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                    [dic sf_setObject:result forKey:@"height"];
                    [self requestUpdateUserInfoWithDic:dic];
                }
                    break;
                case patientTypeWeight:{
                    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                    [dic sf_setObject:result forKey:@"weight"];
                    [self requestUpdateUserInfoWithDic:dic];
                }
                    break;
            
                case patientTypeDiabetesType:{
                    if ([string isEqualToString:@"1型糖尿病"]) {
                        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                        [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"bsType"];
                        [self requestUpdateUserInfoWithDic:dic];
                    }else if ([string isEqualToString:@"2型糖尿病"]){
                        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                        [dic sf_setObject:[NSNumber numberWithInt:2] forKey:@"bsType"];
                        [self requestUpdateUserInfoWithDic:dic];
                    }else if ([string isEqualToString:@"妊娠糖尿病"]){
                        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                        [dic sf_setObject:[NSNumber numberWithInt:3] forKey:@"bsType"];
                        [self requestUpdateUserInfoWithDic:dic];
                    }else if ([string isEqualToString:@"其他类型"]){
                        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                        [dic sf_setObject:[NSNumber numberWithInt:4] forKey:@"bsType"];
                        [self requestUpdateUserInfoWithDic:dic];
                    }
                  
                }
                    break;
                case patientTypeDiagnosisYears:{
                    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                    [dic sf_setObject:result forKey:@"bsSikeage"];
                    [self requestUpdateUserInfoWithDic:dic];
                }
                    break;
                default:
                    break;
            }
        }
        
    }
}

//patientTypeSex,
//patientTypeHeight,
//patientTypeWeight,
//patientTypeAge,
//patientTypeDiabetesType,
//patientTypeDiagnosisYears,
- (void)requestUpdateUserInfoWithDic:(NSMutableDictionary *)dic {
    //
    //    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"bsSikeage"];
    //    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"bsType"];
    //    [dic sf_setObject:@"head" forKey:@"headPic"];
    //    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"height"];
    //    [dic sf_setObject:@"0" forKey:@"isOverride"];
    //    [dic sf_setObject:@"name" forKey:@"name"];
    //    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"sex"];
    //    [dic sf_setObject:[NSNumber numberWithInt:1] forKey:@"weight"];
    
    NSString *url = @"/user/info/update";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            UserInfoModel *model = [UserInfoModel modelObjectWithDictionary:request.responseJSONObject];
            DLog(@"接口数据:%@",model);
            //网络请求
            [[UserInfoService sharedInstance] requestUserInfoWithSuccessBlock:^{
                //处理数据
               self.userInfo = [UserInfoService sharedInstance].userInfo;
            
                [baseTableView reloadData];
            }failureBlock:^{
                
            }];
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


//添加选择滚轮
- (void)showOnePickerType:(patientType)type {
    NSMutableArray *temps = [[NSMutableArray alloc] init];
    NSString *title;
    NSInteger selectRow;
    switch (type) {
        case patientTypeSex:{
            title = @"性别";
            [temps addObjectsFromArray:@[@"男",@"女"]];
            if (!self.userInfo.sex) {
                selectRow = 0;
            }else if (self.userInfo.sex  == 1){
                
                selectRow = 0;
            }else{
                
                selectRow = 1;
            }
            break;
        }

        case patientTypeHeight:{
            for (int i = 50; i < 201; i++) {
                if (!self.userInfo.height ) {
                    selectRow = 120;
                }
                else if (i == self.userInfo.height ) {
                    selectRow = i - 50;
                }
                [temps addObject:[NSString stringWithFormat:@"%d", i]];
                title = @"身高";
            }
            break;
        }
        case patientTypeWeight:{
            for (int i = 20; i < 181; i++) {
                if (!self.userInfo.weight) {
                    selectRow = 40;
                }else if (i == self.userInfo.weight ){
                    selectRow = i - 20;
                }
                [temps addObject:[NSString stringWithFormat:@"%d", i]];
                title = @"体重";
            }
            break;
        }

        case patientTypeDiabetesType:{
            [temps addObject:@"1型糖尿病"];
            [temps addObject:@"2型糖尿病"];
            [temps addObject:@"妊娠糖尿病"];
            [temps addObject:@"其他类型"];
            title = @"糖尿病类型";
           
        }
             break;
        case patientTypeDiagnosisYears:{
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"YYYY"];
            NSString *DateTime = [formatter stringFromDate:date];
            int  year = [DateTime intValue];
            int min = year - 100;
            for (int a = year; a> min  ; a--) {
                                if (!self.userInfo.bsSikeage) {
                                    selectRow = 0;
                                }else if (a  == self.userInfo.bsSikeage ){
                                    selectRow = year- a;
                                }
                [temps addObject:[NSString stringWithFormat:@"%d", a]];
                title = @"确诊年份";
            }

           break;
        }
            
        default:
            break;
    }
    ZHPickView *pickview = [[ZHPickView alloc] initPickviewWithArray:temps isHaveNavControler:NO];
    [pickview setTitle:title];
    pickview.tag = type;
    pickview.delegate = self;
    
    [pickview setDefaultSelectRow:selectRow];
    [pickview show];
}

-(void)returnString:(NSString *)str{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic sf_setObject:str forKey:@"name"];
    [self requestUpdateUserInfoWithDic:dic];
}

@end
