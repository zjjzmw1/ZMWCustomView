//
//  LabelLabelMasonry.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/29.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "LabelLabelMasonry.h"
#import "UIView+Utils.h"
#import <Masonry.h>

@implementation LabelLabelMasonry


-(instancetype)init{
    self = [super init];
    if (self) {
        // 左边的 label
        self.leftLabel = [[UILabel alloc]init];
        [self addSubview:self.leftLabel];
        self.leftLabel.backgroundColor = [UIColor clearColor];
        
        // 右边的 label
        self.rightLabel = [[UILabel alloc]init];
        self.rightLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.rightLabel];
        
    }
    return self;
}

/**
 *  LabelLabelMasonry  : 左边 1 个 label 右边 1 个 label  ----------
 *
 *  @param leftTitle        左边label 文字
 *  @param font             左边label 文字大小
 *  @param leftTextColor    左边label 文字颜色
 *  @param rightTitle     右边label 文字
 *  @param rightFont      右边label 文字大小
 *  @param rightTextColor 右边label 文字颜色
 */
-(void)updateTwoLabelWithleftTitle:(NSString *)leftTitle leftLabelFont:(UIFont *)font  leftTextColor:(UIColor *)leftTextColor rightTitle:(NSString *)rightTitle rightLabelFont:(UIFont *)rightFont  rightTextColor:(UIColor *)rightTextColor {
    
    __weak typeof(self) wSelf = self;
    // leftLabel
    self.leftLabel.font = font;
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    self.leftLabel.textColor = leftTextColor;
    self.leftLabel.text = leftTitle;
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wSelf);
        make.top.equalTo(wSelf);
        make.bottom.equalTo(wSelf);
    }];
    
    // rightLabel
    self.rightLabel.font = rightFont;
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    self.rightLabel.textColor = rightTextColor;
    self.rightLabel.text = rightTitle;
    self.rightLabel.frame =  CGRectMake(self.leftLabel.width, 0, self.width - self.leftLabel.width, self.height);
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wSelf);
        make.left.equalTo(wSelf.leftLabel.mas_right);
        make.right.equalTo(wSelf);
        make.bottom.equalTo(wSelf);
    }];
    
}

@end
