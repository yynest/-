//
//  ZHPickView.m
//  ZHpickView
//
//  Created by liudianling on 14-11-18.
//  Copyright (c) 2014年 赵恒志. All rights reserved.
//
#define ZHToobarHeight 45
#import "ZHPickView.h"
#import "ToolBox.h"

@implementation addressModel



@end

@interface ZHPickView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    UILabel *centerName;
}



@property(nonatomic,copy)NSString *plistName;
@property(nonatomic,strong)NSArray *plistArray;
@property(nonatomic,assign)BOOL isLevelArray;
@property(nonatomic,assign)BOOL isLevelString;
@property(nonatomic,assign)BOOL isLevelDic;
@property(nonatomic,strong)NSDictionary *levelTwoDic;
@property(nonatomic,strong)UIToolbar *toolbar;
@property(nonatomic,strong)UIPickerView *pickerView;
@property(nonatomic,assign)NSDate *defaulDate;
@property(nonatomic,assign)BOOL isHaveNavControler;
@property(nonatomic,assign)NSInteger pickeviewHeight;
@property(nonatomic,copy)NSString *resultString;
@property(nonatomic,strong)NSMutableArray *componentArray;
@property(nonatomic,strong)NSMutableArray *dicKeyArray;
@property(nonatomic,copy)NSMutableArray *state;
@property(nonatomic,copy)NSMutableArray *city;
@property(nonatomic,strong) NSString *pickTitle;
//设置默认选中行
@property(nonatomic,assign)NSInteger defaultSelectRow;

@end

@implementation ZHPickView
{
    UIButton *backView;
}

-(NSArray *)plistArray{
    if (_plistArray==nil) {
        _plistArray=[[NSArray alloc] init];
    }
    return _plistArray;
}

-(NSArray *)componentArray{

    if (_componentArray==nil) {
        _componentArray=[[NSMutableArray alloc] init];
    }
    return _componentArray;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(instancetype)initPickviewWithPlistName:(NSString *)plistName title:(NSString *)title isHaveNavControler:(BOOL)isHaveNavControler{
    
    self=[super init];
    if (self) {
        _pickTitle = title;
        [self addHalfAlphaBackView];
        [self setUpToolBar];
        _plistName=plistName;
        self.plistArray=[self getPlistArrayByplistName:plistName];
        [self setUpPickView];
        [self setFrameWith:isHaveNavControler];
        
    }
    return self;
}
-(instancetype)initPickviewWithArray:(NSArray *)array isHaveNavControler:(BOOL)isHaveNavControler{
    self=[super init];
    if (self) {
        self.plistArray=array;
        [self addHalfAlphaBackView];
        [self setUpToolBar];
        [self setArrayClass:array];
        [self setUpPickView];
        [self setFrameWith:isHaveNavControler];
    }
    return self;
}

-(instancetype)initDatePickWithDate:(NSDate *)defaulDate title:(NSString *)title datePickerMode:(UIDatePickerMode)datePickerMode isHaveNavControler:(BOOL)isHaveNavControler{
    
    self=[super init];
    if (self) {
        _pickTitle = title;
        [self addHalfAlphaBackView];
        [self setUpToolBar];
        _defaulDate=defaulDate;
        [self setUpDatePickerWithdatePickerMode:(UIDatePickerMode)datePickerMode];
        [self setFrameWith:isHaveNavControler];
    }
    return self;
}


-(NSArray *)getPlistArrayByplistName:(NSString *)plistName{
    
    NSString *path= [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray * array=[[NSArray alloc] initWithContentsOfFile:path];
    [self setArrayClass:array];
    return array;
}

-(void)setArrayClass:(NSArray *)array{
    _dicKeyArray=[[NSMutableArray alloc] init];
    for (id levelTwo in array) {
        
        if ([levelTwo isKindOfClass:[NSArray class]]) {
            _isLevelArray=YES;
            _isLevelString=NO;
            _isLevelDic=NO;
        }else if ([levelTwo isKindOfClass:[NSString class]]){
            _isLevelString=YES;
            _isLevelArray=NO;
            _isLevelDic=NO;
            
        }else if ([levelTwo isKindOfClass:[NSDictionary class]])
        {
            _isLevelDic=YES;
            _isLevelString=NO;
            _isLevelArray=NO;
            _levelTwoDic=levelTwo;
            [_dicKeyArray addObject:[_levelTwoDic allKeys] ];
        }
    }
}

-(void)setFrameWith:(BOOL)isHaveNavControler{
    CGFloat toolViewX = 0;
    CGFloat toolViewH = _pickeviewHeight+ZHToobarHeight;
    CGFloat toolViewY ;
    if (isHaveNavControler) {
        toolViewY= [UIScreen mainScreen].bounds.size.height-toolViewH-50;
    }else {
        toolViewY= [UIScreen mainScreen].bounds.size.height-toolViewH;
    }
    CGFloat toolViewW = [UIScreen mainScreen].bounds.size.width;
    self.frame = CGRectMake(toolViewX, toolViewY, toolViewW, toolViewH);
}
-(void)setUpPickView{
    
    UIPickerView *pickView=[[UIPickerView alloc] init];
    pickView.backgroundColor=[UIColor whiteColor];
    _pickerView=pickView;
    pickView.delegate=self;
    pickView.dataSource=self;
    pickView.frame=CGRectMake(0, ZHToobarHeight, [UIScreen mainScreen].bounds.size.width, pickView.frame.size.height);
    _pickeviewHeight=pickView.frame.size.height;
    [self addSubview:pickView];
}

-(void)setUpDatePickerWithdatePickerMode:(UIDatePickerMode)datePickerMode{
    UIDatePicker *datePicker=[[UIDatePicker alloc] init];
    //datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datePicker.timeZone = [NSTimeZone localTimeZone];
    datePicker.datePickerMode = datePickerMode;
    self.datePicker = datePicker;
    //datePicker.maximumDate = [NSDate date];
    //如果要限制所选择的时间必须是过去式的  则重写这一行。这里默认可以选择过去以及未来任何时间。
    datePicker.backgroundColor=[UIColor whiteColor];
    if (_defaulDate) {
        [datePicker setDate:_defaulDate];
    }
    //_datePicker=datePicker;
    datePicker.frame=CGRectMake(0, ZHToobarHeight, [UIScreen mainScreen].bounds.size.width, datePicker.frame.size.height);
    _pickeviewHeight=datePicker.frame.size.height;
    [self addSubview:datePicker];
}

-(void)setUpToolBar{
    _toolbar=[self setToolbarStyle];
    [self setToolbarWithPickViewFrame];
    [self addSubview:_toolbar];
}

- (void)setDefaultSelectRow:(NSInteger)row
{
    _defaultSelectRow = row;
    [_pickerView selectRow:row inComponent:0 animated:NO];
}

- (void)setDefaultSelectDate:(NSDate*)defaultDate
{
    [_datePicker setDate:defaultDate];
}


-(UIToolbar *)setToolbarStyle{
    UIToolbar *toolbar=[[UIToolbar alloc] init];
    toolbar.barTintColor = [UIColor colorBGGragLighter];
    UIView *spView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 45)];
    UIBarButtonItem *first = [[UIBarButtonItem alloc] initWithCustomView:spView];
    
    UIBarButtonItem *lefttem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(remove)];
    lefttem.tintColor = [UIColor colorMainGreen];
    
    UIBarButtonItem *centerSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
//    if (self.pickTitle) {
        centerName = [[UILabel alloc] init];
        centerName.text = _pickTitle;
        centerName.textAlignment = NSTextAlignmentCenter;
        centerName.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 0, 100, 45);
        centerName.textColor = [UIColor colorTextBlack];
        centerName.backgroundColor = [UIColor clearColor];
        centerSpace.customView = centerName;
//    }
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
    right.tintColor = [UIColor colorMainGreen];
    
    UIView *lastView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 45)];
    UIBarButtonItem *last = [[UIBarButtonItem alloc] initWithCustomView:lastView];
    
    toolbar.items=@[first,lefttem,centerSpace,right,last];
    return toolbar;
}
-(void)setToolbarWithPickViewFrame{
    _toolbar.frame=CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, ZHToobarHeight);
}

#pragma mark piackView 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    NSInteger component;
    if (_isLevelArray) {
        component=_plistArray.count;
    } else if (_isLevelString){
        component=1;
    }else if(_isLevelDic){
        component=[_levelTwoDic allKeys].count*2;
    }
    return component;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *rowArray=[[NSArray alloc] init];
    if (_isLevelArray) {
        rowArray=_plistArray[component];
    }else if (_isLevelString){
        rowArray=_plistArray;
    }else if (_isLevelDic){
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        NSDictionary *dic=_plistArray[pIndex];
        for (id dicValue in [dic allValues]) {
                if ([dicValue isKindOfClass:[NSArray class]]) {
                    if (component%2==1) {
                        rowArray=dicValue;
                    }else{
                        rowArray=_plistArray;
                    }
            }
        }
    }
    return rowArray.count;
}

#pragma mark UIPickerViewdelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *rowTitle=nil;
    if (_isLevelArray) {
        rowTitle=_plistArray[component][row];
    }else if (_isLevelString){
        rowTitle=_plistArray[row];
    }else if (_isLevelDic){
        NSInteger pIndex = [pickerView selectedRowInComponent:0];
        NSDictionary *dic=_plistArray[pIndex];
        if(component%2==0)
        {
            rowTitle=_dicKeyArray[row][component];
        }
        for (id aa in [dic allValues]) {
           if ([aa isKindOfClass:[NSArray class]]&&component%2==1){
                NSArray *bb=aa;
                if (bb.count>row) {
                    rowTitle=aa[row];
                }
                
            }
        }
    }
    return rowTitle;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (_isLevelDic&&component%2==0) {
        
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    if (_isLevelString) {
        _resultString=_plistArray[row];
        
    }else if (_isLevelArray){
        _resultString=@"";
        if (![self.componentArray containsObject:@(component)]) {
            [self.componentArray addObject:@(component)];
        }
        for (int i=0; i<_plistArray.count;i++) {
            if ([self.componentArray containsObject:@(i)]) {
                NSInteger cIndex = [pickerView selectedRowInComponent:i];
                _resultString=[NSString stringWithFormat:@"%@%@",_resultString,_plistArray[i][cIndex]];
            }else{
                _resultString=[NSString stringWithFormat:@"%@%@",_resultString,_plistArray[i][0]];
                          }
        }
    }else if (_isLevelDic){
        if (component==0) {
          _state =_dicKeyArray[row][0];
        }else{
            NSInteger cIndex = [pickerView selectedRowInComponent:0];
            NSDictionary *dicValueDic=_plistArray[cIndex];
            NSArray *dicValueArray=[dicValueDic allValues][0];
            if (dicValueArray.count>row) {
                _city =dicValueArray[row];
            }
        }
    }
}

-(void)remove{
    
    if ([self.delegate respondsToSelector:@selector(toobarDonBtnHaveClick:result:)]) {
        [self.delegate toobarDonBtnHaveClick:self result:nil];
    }
    [self dissmissSelf];

}
-(void)show{
    //[[UIApplication sharedApplication].keyWindow addSubview:self];
    [self showWithAnimate];
}

- (void)showWithAnimate
{
    self.frame = CGRectMake(0, MAIN_SCREEN_HEIGHT , MAIN_SCREEN_WIDTH, ZHToobarHeight + _pickeviewHeight);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^(){
        //执行弹出动画
        self.frame = CGRectMake(0, MAIN_SCREEN_HEIGHT -  (ZHToobarHeight + _pickeviewHeight), MAIN_SCREEN_WIDTH, ZHToobarHeight + _pickeviewHeight);
        
    }completion:^(BOOL finished) {
        
    }];
}

-(void)doneClick{
    if (_pickerView) {
        if (_resultString) {
        }
        else{
            if (_isLevelString) {
                _resultString=[NSString stringWithFormat:@"%@",[_plistArray sf_objectAtIndex:_defaultSelectRow]];
            }
            else if (_isLevelArray){
                _resultString=@"";
                for (int i=0; i<_plistArray.count;i++) {
                    _resultString=[NSString stringWithFormat:@"%@%@",_resultString,_plistArray[i][0]];
                }
            }
            else if (_isLevelDic){
                
                if (_state==nil) {
                     _state =_dicKeyArray[0][0];
                    NSDictionary *dicValueDic=_plistArray[0];
                    _city=[dicValueDic allValues][0][0];
                }
                if (_city==nil){
                    NSInteger cIndex = [_pickerView selectedRowInComponent:0];
                    NSDictionary *dicValueDic=_plistArray[cIndex];
                    _city=[dicValueDic allValues][0][0];
                    
                }
              _resultString=[NSString stringWithFormat:@"%@%@",_state,_city];
//                addressModel *model = [[addressModel alloc] init];
//                model.province = [NSString stringWithFormat:@"%@",_state];
//                model.city     = [NSString stringWithFormat:@"%@",_city];
                
           }
        }
        if ([self.delegate respondsToSelector:@selector(toobarDonBtnHaveClick:result:)]) {
            [self.delegate toobarDonBtnHaveClick:self result:_resultString];
        }
    }
    else if (_datePicker) {
        _resultString=[NSString stringWithFormat:@"%@",_datePicker.date];
        if ([self.delegate respondsToSelector:@selector(toobarDonBtnHaveClick:result:)]) {
            [self.delegate toobarDonBtnHaveClick:self result:_resultString];
        }
    }
    [self dissmissSelf];
}
/**
 *  设置PickView的颜色
 */
-(void)setPickViewColer:(UIColor *)color{
    _pickerView.backgroundColor=color;
}
/**
 *  设置toobar的文字颜色
 */
-(void)setTintColor:(UIColor *)color{
    
    _toolbar.tintColor=color;
}
/**
 *  设置toobar的背景颜色
 */
-(void)setToolbarTintColor:(UIColor *)color{
    
    _toolbar.barTintColor=color;
}

- (NSString*)getTitle{
    return _pickTitle;
}

- (void)setTitle:(NSString *)title{
    _pickTitle = title;
    centerName.text = _pickTitle;
}

//背景消失事件
- (void)addHalfAlphaBackView
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    backView = [UIButton buttonWithType:UIButtonTypeCustom];
    backView.frame = window.frame;
    [backView addTarget:self action:@selector(dissmissSelf) forControlEvents:UIControlEventTouchUpInside];
    backView.backgroundColor = [UIColor colorBGWithAlpha:0.5];
    [window addSubview:backView];
}

- (void)dissmissSelf
{
    
    [UIView animateWithDuration:0.25 animations:^(){
        //执行弹出动画
        self.frame = CGRectMake(0, MAIN_SCREEN_HEIGHT , MAIN_SCREEN_WIDTH, ZHToobarHeight + _pickeviewHeight);
        
    }completion:^(BOOL finished) {
        [backView removeFromSuperview];
        [self removeFromSuperview];
    }];


}


-(void)dealloc{
    
    //NSLog(@"销毁了");
}
@end

