//
//  Tooles.h
//  Vodka
//
//  Created by 小明 on 15-12-26.
//  Copyright (c) 2014年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>         //各种方便的block封装

@interface Tooles : NSObject

/**
 *  获取 UILabel 便利方法
 *
 *  @param frame     label frame
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *  @param textColor 字体颜色
 *
 *  @return UILabel
 */
+(UILabel *)getLabel:(CGRect)frame fontSize:(float)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor;

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
+(UIButton *)getButton:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleSize:(float)titleSize;

/**
 *  获取 UIImageView 便利方法
 *
 *  @param frame        图片frame
 *  @param cornerRadius 圆角大小 - 为0的时候没有圆角
 *
 *  @return UIImageView
 */
+(UIImageView *)getImageView:(CGRect)frame cornerRadius:(float)cornerRadius;

@end
