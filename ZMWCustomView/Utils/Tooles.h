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
 *  获取UILabel 、UIButton 、UIImageView的类方法汇总
 *
 *  @param frame     控件大小
 *  @param fontSize  字体大小
 *  @param alignment 对齐方式
 *  @param textColor 字体颜色
 *
 *  @return UILabel/UIButton/UIImageView
 */
+(UILabel *)getLabel:(CGRect)frame fontSize:(float)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor;
+(UIButton *)getButton:(CGRect)frame title:(NSString *)title titleColor:(NSString *)titleColor titleSize:(float)titleSize;
+(UIImageView *)getImageView:(CGRect)frame cornerRadius:(float)cornerRadius;

@end
