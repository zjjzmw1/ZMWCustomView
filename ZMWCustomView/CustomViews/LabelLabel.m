//
//  LabelLabel.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "LabelLabel.h"
#import "UIView+Utils.h"

@implementation LabelLabel

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 左边的 label
        self.leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width/2.0f, frame.size.height)];
        self.leftLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.leftLabel];
        
        // 右边的 label
        self.rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.leftLabel.right, frame.size.width/2.0, frame.size.height)];
        self.rightLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.rightLabel];
        
        
    }
    return self;
}

/**
 *  LabelLabel  : 左边 1 个 label 右边 1 个 label  ----------
 *
 *  @param leftTitle        左边label 文字
 *  @param font             左边label 文字大小
 *  @param leftTextColor    左边label 文字颜色
 *  @param rightTitle     右边label 文字
 *  @param rightFont      右边label 文字大小
 *  @param rightTextColor 右边label 文字颜色
 */
-(void)updateTwoLabelWithleftTitle:(NSString *)leftTitle leftLabelFont:(UIFont *)font  leftTextColor:(UIColor *)leftTextColor rightTitle:(NSString *)rightTitle rightLabelFont:(UIFont *)rightFont  rightTextColor:(UIColor *)rightTextColor {
    
    // leftLabel
    self.leftLabel.font = font;
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    self.leftLabel.textColor = leftTextColor;
    self.leftLabel.text = leftTitle;
    self.leftLabel.numberOfLines = 1;
    [self.leftLabel sizeToFit];
    NSDictionary *attrs = @{NSFontAttributeName:self.leftLabel.font};
    CGSize size = [self.leftLabel.text sizeWithAttributes:attrs];
    self.leftLabel.frame = CGRectMake(0,0, size.width, self.height);
    
    // rightLabel
    self.rightLabel.font = rightFont;
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    self.rightLabel.textColor = rightTextColor;
    self.rightLabel.text = rightTitle;
    self.rightLabel.numberOfLines = 1;
    [self.rightLabel sizeToFit];
    self.rightLabel.frame =  CGRectMake(self.leftLabel.width, 0, self.width - self.leftLabel.width, self.height);
    
}

@end
