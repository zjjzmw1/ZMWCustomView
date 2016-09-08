//
//  UILabel+MutableFont.h
//  Vodka
//
//  Created by speedx on 16/8/25.
//  Copyright © 2016年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MutableFont)

-(UILabel *)updateWithText:(NSString *)text specialTextColor:(UIColor *)specialColor specialFont:(UIFont *)specialFont range:(NSRange)range ;

@end
