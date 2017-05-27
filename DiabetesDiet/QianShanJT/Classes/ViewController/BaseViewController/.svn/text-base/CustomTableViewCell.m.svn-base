//
//  CustomTableViewCell.m
//  QianShanJT
//
//  Created by Xiaomei on 2017/5/25.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "ToolFontFit.h"
@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

 
}

//重写布局
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [ToolFontFit setFontFromLabel:self.textLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody1];
        [ToolFontFit setFontFromLabel:self.detailTextLabel FontType:FontTypeNormal WithType:NormalFontTypeMainbody2];
        self.textLabel.textColor = [UIColor colorTextBlack];
        self.detailTextLabel.textColor = [UIColor colorTextGrag];
      
    }
    return self;
}

@end
