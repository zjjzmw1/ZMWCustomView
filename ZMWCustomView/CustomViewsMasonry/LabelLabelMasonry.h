//
//  LabelLabelMasonry.h
//  ZMWCustomView
//
//  Created by speedx on 16/7/29.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelLabelMasonry : UIView

/// 左边的 label
@property (strong, nonatomic) UILabel               *leftLabel;
/// 右边的 label
@property (strong, nonatomic) UILabel               *rightLabel;

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
-(void)updateTwoLabelWithleftTitle:(NSString *)leftTitle leftLabelFont:(UIFont *)font  leftTextColor:(UIColor *)leftTextColor rightTitle:(NSString *)rightTitle rightLabelFont:(UIFont *)rightFont  rightTextColor:(UIColor *)rightTextColor;


@end
