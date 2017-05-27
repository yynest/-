//
//  InputWordVC.m
//  QianShanJY
//
//  Created by iosdev on 2017/3/22.
//  Copyright © 2017年 chinasun. All rights reserved.
//

#import "InputWordVC.h"
#import "InputTextField.h"
@interface InputWordVC ()<UITextFieldDelegate>
{
    UITextField *tf;
}
@end

@implementation InputWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self getBtnWithTitle:@"取消" Tag:1]];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self getBtnWithTitle:@"保存" Tag:2]];
    
    //
    tf = [[InputTextField alloc] initWithFrame:CGRectMake(0, 10, MAIN_SCREEN_WIDTH, 44)];
    tf.text = self.textStr;
    tf.borderStyle =  UITextBorderStyleNone;
    tf.backgroundColor = [UIColor whiteColor];
    tf.delegate = self;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    [tf becomeFirstResponder];
    [self.view addSubview:tf];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged:)
                                                name:@"UITextFieldTextDidChangeNotification" object:tf ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)clickBtnWithTag:(NSInteger)btnTag{
    if (btnTag == 1) {
        [self clickedLeftItem];
    }else{
     [self clickedRightItem];
    }
}
- (void)clickedRightItem {
    if (tf.text.length == 0) {
        [self showAlertController:@"没有输入内容,请重新填写" buttons:@[@"我知道了"] viewTag:0];
        return;
    }else if ([self.isPhone isEqualToString:@"phone"]){
//        if (![RegexVerifyTool regexVerifyWithMobilePhone:tf.text]) {
//            [SVProgressHUD showInfoWithStatus:QSText(@"手机号输入有误")];
//            return;
//        }

    }
    if ([self.delegate respondsToSelector:@selector(returnString:)]) {
        [self.delegate returnString:tf.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickedLeftItem {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length == 0) return YES;
    
    if (textField.text.length > ([self.maxLength intValue] - 1) ) {
        return YES;
    }
    
    return YES;
}


-(void)textFieldEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > [self.maxLength intValue])
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:[self.maxLength intValue]];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:[self.maxLength intValue]];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, [self.maxLength intValue])];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}





@end
