//
//  Tooles.m
//  Vodka
//
//  Created by 小明 on 15-12-26.
//  Copyright (c) 2014年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "Tooles.h"
#import "UIColor+IOSUtils.h"
#import "NSString+IOSUtils.h"

@implementation Tooles

/**
 *  获取UILabel 、UIButton 、UIImageView的类方法汇总
 *
 *  @param frame     控件大小
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *  @param textColor 字体颜色
 *
 *  @return UILabel/UIButton/UIImageView
 */
#pragma mark - 获取UILabel 、UIButton 、UIImageView的类方法汇总
+(UILabel *)getLabel:(CGRect)frame fontSize:(float)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc]init];
    label.frame = frame;
    label.font = [UIFont systemFontOfSize:16];//默认是16
    if (fontSize > 0) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    label.textAlignment = alignment;
    
    label.textColor = textColor;//例如：@"ffffff"
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

+(UIButton *)getButton:(CGRect)frame title:(NSString *)title titleColor:(NSString *)titleColor titleSize:(float)titleSize{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:title forState:UIControlStateNormal];
    if ([titleColor isEmptyString]) {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor colorFromHexString:titleColor] forState:UIControlStateNormal];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    if (titleSize > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleSize];
    }
    return button;
}
+(UIImageView *)getImageView:(CGRect)frame cornerRadius:(float)cornerRadius {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;     ///这个是取中间的一部分。。不压缩的。
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

@end
