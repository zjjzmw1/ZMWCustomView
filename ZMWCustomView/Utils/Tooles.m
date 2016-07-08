//
//  Tooles.m
//  Vodka
//
//  Created by 小明 on 15-12-26.
//  Copyright (c) 2014年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//
/*
    speedx项目：UILabel alloc  384 个地方。 平均每个地方 8 行代码 用marsony 的话 再加 5 行。
    自己封装的 getLabel 3 行代码     总计 减少 ： (8-3)*380 = 1900 行 代码。
    UIButton alloc 38 个地方 平均每个地方 平均 7 行代码 
    自己封装的 getButton 2 行代码    总结减少 ： （7-2）*38  = 190 行 代码 
    UIImageView alloc 254 个地方 平均每个地方 平均 5 行代码
    自己封装的 getImageView 3 行代码    总结减少 ： （5-3）*254  = 508 行 代码
 
 
 */

#import "Tooles.h"
#import "UIColor+IOSUtils.h"
#import "NSString+IOSUtils.h"

@implementation Tooles

/**
 *  获取UILabel 便利方法
 *
 *  @param frame     控件大小
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *  @param textColor 字体颜色
 *
 *  @return UILabel
 */
+(UILabel *)getLabel:(CGRect)frame fontSize:(float)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc]init];
    label.frame = frame;
    label.font = [UIFont systemFontOfSize:16];//默认是16
    if (fontSize > 0) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    label.textAlignment = alignment;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

/**
 *  获取 UIButton 便利方法
 *
 *  @param frame      按钮frame
 *  @param title      按钮文字
 *  @param titleColor 文字颜色
 *  @param titleSize  字体大小
 *
 *  @return UIButton
 */
+(UIButton *)getButton:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleSize:(float)titleSize{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:title forState:UIControlStateNormal];
    if (!titleColor) {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    if (titleSize > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleSize];
    }
    return button;
}

/**
 *  获取 UIImageView 便利方法
 *
 *  @param frame        图片frame
 *  @param cornerRadius 圆角大小 - 为0的时候没有圆角
 *
 *  @return UIImageView
 */
+(UIImageView *)getImageView:(CGRect)frame cornerRadius:(float)cornerRadius {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.layer.cornerRadius = cornerRadius;
    if (cornerRadius > 0) {
        imageView.layer.masksToBounds = YES;
    }
    imageView.contentMode = UIViewContentModeScaleAspectFill;     ///这个是取中间的一部分。。不压缩的。
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

/**
 *  获取 带 image title 的按钮
 *
 *  @param frame      按钮大小
 *  @param title      按钮标题
 *  @param image      按钮图片
 *  @param titleColor 按钮字体颜色
 *  @param titleSize  按钮字体大小
 *  @param kSpacing   按钮字体和图片的间距
 *  @param type       图片和title的位置 ：0：图片左 整体居中 1：图片左 整体居左 2: 图片左 整体居右 ---- 3:图片右 整体居中 4：图片右 整体居左 5：图片右 整体居右
 *
 *  @return UIButton
 */
+(UIButton *)getButtonWithImageAndTitle:(CGRect)frame title:(NSString *)title image:(UIImage *)image titleColor:(UIColor *)titleColor titleSize:(float)titleSize kSpacing:(float)kSpacing alignmentType:(int)type {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    if (titleSize > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleSize];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        
        float imageWidth = image.size.width;
        float titleWidth = 0;
        if (title && ![title isEqualToString:@""]) {
            NSDictionary *attrs = @{NSFontAttributeName:button.titleLabel.font};
            titleWidth = [[button currentTitle]sizeWithAttributes:attrs].width;
        }
        if (type == 0) { // 图片左 整体居中
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, -kSpacing/2.0f, 0, 0)];
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, kSpacing/2.0f, 0, 0)];
        }else if (type == 1){ // 图片左 整体居左
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, kSpacing, 0, 0)];
        }else if (type == 2){ // 图片左 整体居右
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, kSpacing)];
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        }else if (type == 3){ // 图片右 整体居中
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -titleWidth-kSpacing, 0, 0)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, imageWidth*2+titleWidth+kSpacing, 0, 0)];
        }else if (type == 4){ // 图片右 整体居左
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth, 0, 0)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, titleWidth+kSpacing, 0, 0)];
        }else if (type == 5){ // 图片右 整体居右
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0,imageWidth + kSpacing)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - titleWidth)];
        }
    }
    
    return button;
}

@end
