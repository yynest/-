//
//  SHFeedBackVC.m
//  QianShanJY
//
//  Created by Xiaomei on 2017/4/26.
//  Copyright © 2017年 chinasun. All rights reserved.
//

#import "SHFeedBackVC.h"
#import "UserInfoService.h"
//#import "SubmitFeedbackAPI.h"
#import "XMTextView.h"
#import "UIViewExt.h"
#import "DLAVAlertViewController.h"
#import "FSMediaPicker.h"
#import "ZHPickView.h"
#import "DLAVAlertView.h"
#import "InputWordVC.h"
#import "MedicalRecordUpdate.h"
#import "ImageBrowserViewController.h"
#import "PhotoView.h"
#define kMaxWordCount 200
@interface SHFeedBackVC ()<UITextViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,FSMediaPickerDelegate,DLAVAlertViewDelegate>
{
    
    NSMutableArray *photos;
    UICollectionView *photosList;
    UIButton *selectBtn;
    NSInteger size;
    DLAVAlertView *curAlertView;
    FSMediaPicker *fsPicker;
    NSInteger selectedImg;
}
@property (nonatomic, strong)XMTextView             *ssTextView;
@property (nonatomic,strong) UILabel        *wordNum1;
@end

@implementation SHFeedBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"意见反馈";
    photos = [[NSMutableArray alloc] init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self getBtnWithTitle:@"提交" Tag:1]];
    [self _loadContentView];
}

-(void)_loadContentView{

    //输入框
    self.ssTextView = [[XMTextView alloc] initWithFrame:CGRectMake(0, 0, viewWidth , 150.0f)];
    self.ssTextView.delegate = self;
    self.ssTextView.backgroundColor = [UIColor whiteColor];
    NSString  *ns1 = @"输入你的意见和建议";
    self.ssTextView.placeholder = ns1;
    self.ssTextView.placeholderColor = [UIColor lightGrayColor];
    self.ssTextView.font = [UIFont systemFontOfSize:16.0f];
    self.ssTextView.textColor = [UIColor colorTextBlack];
    self.ssTextView.contentInset = UIEdgeInsetsMake(10, 15, 0, 0);
    [self.view addSubview:self.ssTextView];
    
    //字数限制
    self.wordNum1 = [[UILabel alloc]init];
    self.wordNum1.textColor = [UIColor colorTextGrag];
    self.wordNum1.textAlignment = NSTextAlignmentRight;
    self.wordNum1.font = [UIFont systemFontOfSize:10];
    self.wordNum1.text = @"0/200";
    self.wordNum1.frame = CGRectMake(MAIN_SCREEN_WIDTH - 120,self.ssTextView.bottom - 20 , 110, 20);
    [self.view addSubview:self.wordNum1];
  
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 10;
    size = ([UIScreen mainScreen].bounds.size.width - 50)/4;
    if (size%2!=0) {
        size-=1;
    }
    flowLayout.itemSize = CGSizeMake(size, size);
   
    //图片展示
    photosList = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    photosList.scrollIndicatorInsets = photosList.contentInset;
    photosList.delegate = self;
    photosList.dataSource = self;
    photosList.bounces = NO;
    photosList.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toHidden)];
    tap.numberOfTouchesRequired = 1;
    [photosList addGestureRecognizer:tap];
    photosList.alwaysBounceVertical = YES;
    [photosList registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"imagePickerCell"];
    photosList.userInteractionEnabled = YES;
    [self.view addSubview:photosList];
    
    //加号
    selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(15, 15 , size - 10, size - 10);
    [selectBtn addTarget:self action:@selector(pickPhotos) forControlEvents:UIControlEventTouchUpInside];
    selectBtn.layer.borderWidth = 1;
    selectBtn.layer.borderColor = [UIColor colorBorderGargLighter].CGColor;
    [selectBtn setImage:[UIImage imageNamed:@"addIcon"] forState:0];
    [photosList addSubview:selectBtn];
    
    photosList.frame = CGRectMake(0, self.ssTextView.bottom, viewWidth, selectBtn.bottom + 15);
   
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上左下右
    return UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imagePickerCell" forIndexPath:indexPath];
 
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:1];
    if (!imgView) {
        imgView = [[UIImageView alloc] initWithFrame:cell.bounds];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.tag = indexPath.row;
        imgView.clipsToBounds = YES;
        [cell addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedHealthReportImage:)];
        tap.numberOfTouchesRequired = 1;
        [imgView addGestureRecognizer:tap];
        
       UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
       [imgView addGestureRecognizer:longPressGesture];//长按提示是否删除
    }
    cell.tag = indexPath.item;
    
    imgView.image = photos[indexPath.row];
    
    if (photos.count >=4) {
        selectBtn.hidden = YES;
            //当图片满4个  隐藏加号按钮
    }else if (photos.count <4){
        
        selectBtn.hidden = NO;
    
    }
    NSInteger  count = photos.count;
    //
    NSInteger i = count/5;
    NSInteger j = count%5;
    
    selectBtn.frame = CGRectMake(15+(j*(size + 10)), 15*(i+1)+i*size, size - 10, size - 10);
    photosList.frame = CGRectMake(0, self.ssTextView.bottom, viewWidth, selectBtn.bottom + 15);
    return cell;
}

// 点击查看放大原图
- (void)clickedHealthReportImage:(UITapGestureRecognizer *)sender {
    UIImageView *image=(UIImageView *)sender.view;

    [ImageBrowserViewController show:self type:PhotoBroswerVCTypeZoom index:image.tag imagesBlock:^NSArray *{
 
        return photos;
    }];
}
-(void)longPress:(UITapGestureRecognizer *)tap{
    
    UIImageView *img = (UIImageView *)tap.view;
    selectedImg = img.tag;
    [self showAlertController:@"你是否删除该图片？" buttons:@[@"否",@"是"] viewTag:0];
}

-(void)clickedOKEventTag:(int)tag{
   //长按删除
    [photos removeObjectAtIndex:selectedImg];
    if (photos.count == 0) {
        selectBtn.frame = CGRectMake(15, 15, size - 10, size - 10);
    }
    [photosList reloadData];
    
}

- (void)pickPhotos{
    //点击加号相应
    [self.ssTextView resignFirstResponder];
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
    fsPicker.editMode  = FSEditModeNone;
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
    fsPicker.editMode = FSEditModeNone;
    fsPicker.delegate = self;
    
    [fsPicker takePhotoFromPhotoLibrary];
}
#pragma mark - FSMediaPickerDelegate

- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    if (mediaInfo.mediaType == FSMediaTypeVideo) {
    }
    else {
        //拿到图片后 修改数据源 刷新页面
        UIImage *img2 = mediaInfo.originalImage;
        UIImage *image = [ToolBox imageScaleHandle:img2];
        [photos addObject:image];
        [photosList reloadData];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickBtnWithTag:(NSInteger)btnTag{
    if (self.ssTextView.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"输入内容不能为空"];
        return;
    }
    //点击发表
    [self.ssTextView resignFirstResponder];
    NSMutableArray *pathArray = [NSMutableArray arrayWithCapacity:5];
    for (UIImage *img in photos) {
        
      
        NSData *data = UIImagePNGRepresentation(img);
          [SVProgressHUD showWithStatus:nil];
        //先把图片上传 拿到地址 存入数组  再请求发表接口
        [[QNManager sharedInstance]putDataType:@"1" data:data suffix:@"png" complete:^(BOOL isSuccess, NSString * _Nullable path) {
            [pathArray addObject:path];
            if (pathArray.count == photos.count) {
                  [SVProgressHUD dismiss];
                [self requestSendUserAdviceWithImgArray:(NSArray *)pathArray suggest:self.ssTextView.text];
            }
        }];
    }
    //点击提交
}

- (void)requestSendUserAdviceWithImgArray:(NSArray *)imgArray suggest:(NSString *)suggest {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
 
    [dic sf_setObject:imgArray forKey:@"picUrls"];
    [dic sf_setObject:suggest forKey:@"suggest"];
    NSString *url = @"/user/advice";
    //请求
    QSBaseRequest *api = [[QSBaseRequest alloc] initWithRequestURL:url parameter:dic];
    [api startWithCompletionBlockWithSuccess:^(QSBaseRequest *request) {
        NSUInteger error = request.responseStatusCode;
        if (error == 0) {
            //处理数据
            [SVProgressHUD showInfoWithStatus:@"提交成功"];
            [self performSelector:@selector(toPop) withObject:self afterDelay:2];
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

-(void)toPop{

         [self.navigationController popViewControllerAnimated:YES];
}
- (void)textViewDidChange:(UITextView *)textView {
    
    if (textView.text.length == 0) {
        self.ssTextView.placeholder = @"请输入您的宝贵意见...";
    }
    if (textView.text.length > kMaxWordCount )
    {
        [SVProgressHUD showInfoWithStatus:@"您最多只能输入200字"];
        
        textView.text =[textView.text substringToIndex:kMaxWordCount];
    }
    
    NSInteger res =  textView.text.length;
    
    self.wordNum1.text = [NSString stringWithFormat:@"%ld/%d",(long)res,kMaxWordCount];
    
    [textView flashScrollIndicators];   // 闪动滚动条
    
    static CGFloat maxHeight = 200.0f;
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size2 = [textView sizeThatFits:constraintSize];
    if (size2.height >= maxHeight)
    {
        size2.height = maxHeight;
        textView.scrollEnabled = YES;   // 允许滚动
    }
    else if(size2.height <= 130){
        size2.height = 130;
        textView.scrollEnabled = NO;
    }else
    {
        textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
    }
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size2.height+20);
    self.wordNum1.frame = CGRectMake(viewWidth - 200, textView.bottom - 20, 190, 20);
    photosList.frame = CGRectMake(0, self.ssTextView.bottom, viewWidth, selectBtn.bottom + 15);
}

-(void)toHidden{

    [self.ssTextView resignFirstResponder];
}


@end
