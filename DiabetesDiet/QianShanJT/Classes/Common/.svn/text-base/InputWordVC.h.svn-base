//
//  InputWordVC.h
//  QianShanJY
//
//  Created by iosdev on 2017/3/22.
//  Copyright © 2017年 chinasun. All rights reserved.
//

#import "CustomBaseViewController.h"

@protocol InputWordDelegate <NSObject>

-(void)returnString:(NSString *)str;

@end

@interface InputWordVC : CustomBaseViewController
@property(nonatomic,strong)NSString *textStr;
@property(nonatomic,strong)NSNumber *maxLength;
@property(nonatomic,strong)NSString *isPhone;
@property (nonatomic, retain) id <InputWordDelegate> delegate;
@end
