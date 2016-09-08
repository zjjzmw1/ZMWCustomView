//
//  UILabel+MutableFont.m
//  Vodka
//
//  Created by speedx on 16/8/25.
//  Copyright © 2016年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "UILabel+MutableFont.h"

@implementation UILabel (MutableFont)

-(UILabel *)updateWithText:(NSString *)text specialTextColor:(UIColor *)specialColor specialFont:(UIFont *)specialFont range:(NSRange)range {
    
    /// 特殊文字的颜色.
    NSDictionary *dict = @{ NSForegroundColorAttributeName:specialColor,NSFontAttributeName:specialFont};
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:text];
    [attrString addAttributes:dict range:range];
    
    self.attributedText = attrString;
    
    return self;
}

@end
