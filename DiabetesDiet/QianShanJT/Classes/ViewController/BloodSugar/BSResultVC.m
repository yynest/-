//
//  BSResultVC.m
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/17.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "BSResultVC.h"
#import "UIViewExt.h"
@interface BSResultVC ()

@end

@implementation BSResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    NSString *state = [ToolBox getStateFromBSValue:self.myBSValue  type:self.type];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2 - [ToolScreenFit getHeightWithControlHeight:200]/2, [ToolScreenFit getHeightWithControlHeight:100], [ToolScreenFit getHeightWithControlHeight:200], [ToolScreenFit getHeightWithControlHeight:150])];
    if ([state isEqualToString:@"1"] || [state isEqualToString:@"2"]) {
       imageView.image = [UIImage imageNamed:@"low"];
    }else if ([state isEqualToString:@"3"]){
         imageView.image = [UIImage imageNamed:@"normal"];
    }else if ([state isEqualToString:@"4"]){
        imageView.image = [UIImage imageNamed:@"height"];
    }
    
    [self.view addSubview:imageView];
    
    UILabel *resultLabel = [[UILabel alloc]initWithFrame:CGRectMake( [ToolScreenFit getHeightWithControlHeight:60], imageView.bottom +20 ,viewWidth - [ToolScreenFit getHeightWithControlHeight:120], 80)];
    resultLabel.numberOfLines = 0;
    resultLabel.font = [UIFont systemFontOfSize:15];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    resultLabel.textColor = [UIColor colorTextBlack];
    resultLabel.text = [ToolBox getStringWithState:[ToolBox getStateFromBSValue:self.myBSValue type:self.type]];
    resultLabel.frame = CGRectMake(40, imageView.bottom +20 ,viewWidth - 80 ,[ToolBox calcUITextViewForText:resultLabel.text lineSpace:5 textFont:15 textViewWidth:viewWidth -80]) ;
    
    [self.view addSubview:resultLabel];
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(40, [ToolScreenFit getHeightWithControlHeight:400], viewWidth - 80, 90);
    saveBtn.frame = CGRectMake(0, [ToolScreenFit getHeightWithControlHeight:400], [ToolScreenFit getHeightWithControlHeight:276],[ToolScreenFit getHeightWithControlHeight:86]);
    saveBtn.center = CGPointMake(viewWidth/2, resultLabel.bottom + 20 + [ToolScreenFit getHeightWithControlHeight:86]/2);
    [saveBtn setTitle:@"知道了" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"com_bt_nor"] forState:UIControlStateNormal];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"com_bt_high"] forState:UIControlStateHighlighted];
    [saveBtn setBackgroundImage:[UIImage imageNamed:@"com_bt_dis"] forState:UIControlStateDisabled];
    [saveBtn addTarget:self action:@selector(IKnow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];

}


-(void)IKnow{
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.delegate) {
            [self.delegate backRootViewController];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
