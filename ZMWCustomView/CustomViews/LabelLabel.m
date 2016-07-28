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
 *  @param leftFontSize     左边label 文字大小
 *  @param leftTextColor    左边label 文字颜色
 *  @param rightTitle     右边label 文字
 *  @param rightFontSize  右边label 文字大小
 *  @param rightTextColor 右边label 文字颜色
 */
-(void)updateTwoLabelWithleftTitle:(NSString *)leftTitle leftLabelFontSize:(float)leftFontSize  leftTextColor:(UIColor *)leftTextColor rightTitle:(NSString *)rightTitle rightLabelFontSize:(float)rightFontSize  rightTextColor:(UIColor *)rightTextColor {
    
    // leftLabel
    self.leftLabel.font = [UIFont systemFontOfSize:leftFontSize];
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    self.leftLabel.textColor = leftTextColor;
    self.leftLabel.text = leftTitle;
    self.leftLabel.numberOfLines = 0;
    [self.leftLabel sizeToFit];
    self.leftLabel.frame = CGRectMake(0,0, self.leftLabel.width, self.height);
    
    // rightLabel
    self.rightLabel.font = [UIFont systemFontOfSize:rightFontSize];
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    self.rightLabel.textColor = rightTextColor;
    self.rightLabel.text = rightTitle;
    self.rightLabel.numberOfLines = 0;
    self.rightLabel.frame =  CGRectMake(self.leftLabel.width, 0, self.width - self.leftLabel.width, self.height);
    
}


@end
