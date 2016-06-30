//
//  LabelButtonView.m
//  ZMWCustomView
//
//  Created by speedx on 16/6/30.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "LabelButtonView.h"
#import "UIView+Utils.h"

@implementation LabelButtonView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 上面的 label
        self.topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/3.0f)];
        self.topLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.topLabel];
        
        // 下面的 label
        self.bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.topLabel.bottom, frame.size.width, frame.size.height/3.0f)];
        self.bottomLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.bottomLabel];
        
        // 唯一的 button
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(0, self.bottomLabel.bottom, frame.size.width, frame.size.height/3.0f);
        self.button.backgroundColor = [UIColor clearColor];
        [self addSubview:self.button];
        
        
    }
    return self;
}

/**
 *  LabelButtonView  : 上面一个Button 下面两个 label
 *
 *  @param buttonImage      button image
 *  @param buttonSize       button 字体大小
 *  @param buttonTitle      button title
 *  @param buttonTitleColor button 字体颜色
 *  @param topTitle         topLabel 文字
 *  @param topFontSize      topLabel 字体大小
 *  @param topAlignment     topLabel 文字对齐方式
 *  @param topTextColor     topLabel 文字颜色
 *  @param bottomTitle      bottomLabel 文字
 *  @param bottomFontSize   bottomLabel 字体大小
 *  @param bottomAlignment  bottomLabel 文字对齐方式
 *  @param bottomTextColor  bottomLabel 字体颜色
 */
-(void)updateButtonLabelLabelWithButtonImage:(UIImage *)buttonImage buttonFontSize:(float)buttonSize buttonTitle:(NSString *)buttonTitle buttonTitleColor:(UIColor *)buttonTitleColor topTitle:(NSString *)topTitle topLabelFontSize:(float)topFontSize  topAlignment:(NSTextAlignment)topAlignment topTextColor:(UIColor *)topTextColor bottomTitle:(NSString *)bottomTitle bottomLabelFontSize:(float)bottomFontSize  bottomAlignment:(NSTextAlignment)bottomAlignment bottomTextColor:(UIColor *)bottomTextColor {
    // 按钮
    self.button.frame = CGRectMake(0, 0, self.width, self.height/3.0);
    if (buttonImage) {
        [self.button setImage:buttonImage forState:UIControlStateNormal];
        self.button.frame = CGRectMake(self.width/2.0f - buttonImage.size.width/2.0f, 0, buttonImage.size.width, buttonImage.size.height);
    }
    self.button.titleLabel.font = [UIFont systemFontOfSize:buttonSize];
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
    [self.button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    // topLabel
    self.topLabel.frame = CGRectMake(0, self.button.bottom, self.width, (self.height - self.button.bottom)/2.0f);
    self.topLabel.font = [UIFont systemFontOfSize:topFontSize];
    self.topLabel.textAlignment = topAlignment;
    self.topLabel.textColor = topTextColor;
    self.topLabel.text = topTitle;
    // bottomLabel
    self.bottomLabel.frame = CGRectMake(0, self.topLabel.bottom, self.width, self.topLabel.height);
    self.bottomLabel.font = [UIFont systemFontOfSize:bottomFontSize];
    self.bottomLabel.textAlignment = bottomAlignment;
    self.bottomLabel.textColor = bottomTextColor;
    self.bottomLabel.text = bottomTitle;
    
}












@end
