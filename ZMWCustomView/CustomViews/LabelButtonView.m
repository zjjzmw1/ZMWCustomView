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
 *  LabelButtonView  : 上面 1 个Button 下面 2 个 label ----------  kButtonLabelLabel
 *
 *  @param buttonImage      button image
 *  @param buttonSize       button 字体大小
 *  @param buttonTitle      button title
 *  @param buttonTitleColor button 字体颜色
 *  @param topTitle         topLabel 文字
 *  @param topFontSize      topLabel 字体大小
 *  @param topTextColor     topLabel 文字颜色
 *  @param bottomTitle      bottomLabel 文字
 *  @param bottomFontSize   bottomLabel 字体大小
 *  @param bottomTextColor  bottomLabel 字体颜色
 */
-(void)updateButtonLabelLabelWithButtonImage:(UIImage *)buttonImage buttonFontSize:(float)buttonSize buttonTitle:(NSString *)buttonTitle buttonTitleColor:(UIColor *)buttonTitleColor topTitle:(NSString *)topTitle topLabelFontSize:(float)topFontSize  topTextColor:(UIColor *)topTextColor bottomTitle:(NSString *)bottomTitle bottomLabelFontSize:(float)bottomFontSize  bottomTextColor:(UIColor *)bottomTextColor  spacingHeight:(float)spacingH{
    // 按钮
    self.button.frame = CGRectMake(0, 0 + self.topSpacingHeight, self.width, 0);
    if (buttonImage) {
        [self.button setImage:buttonImage forState:UIControlStateNormal];
        self.button.frame = CGRectMake(self.width/2.0f - buttonImage.size.width/2.0f,  + self.topSpacingHeight, buttonImage.size.width, buttonImage.size.height);
    }
    self.button.titleLabel.font = [UIFont systemFontOfSize:buttonSize];
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
    [self.button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    // topLabel
    self.topLabel.frame = CGRectMake(0, self.button.bottom + spacingH, self.width, (self.height - self.button.bottom)/2.0f);
    self.topLabel.font = [UIFont systemFontOfSize:topFontSize];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.textColor = topTextColor;
    self.topLabel.text = topTitle;
    self.topLabel.numberOfLines = 0;
    [self.topLabel sizeToFit];
    self.topLabel.frame = CGRectMake(0, self.button.bottom + spacingH, self.width, self.topLabel.size.height);
    // bottomLabel
    self.bottomLabel.frame = CGRectMake(0, self.topLabel.bottom + spacingH, self.width, self.topLabel.height);
    self.bottomLabel.font = [UIFont systemFontOfSize:bottomFontSize];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.textColor = bottomTextColor;
    self.bottomLabel.text = bottomTitle;
    self.bottomLabel.numberOfLines = 0;
    [self.bottomLabel sizeToFit];
    self.bottomLabel.frame =  CGRectMake(0, self.topLabel.bottom + spacingH, self.width, self.bottomLabel.height);

    if (self.bottomLabel.top + self.bottomLabel.height > self.height) {
        self.frame = CGRectMake(self.left, self.top,self.width, self.bottomLabel.top + self.bottomLabel.height + spacingH);
    }
}


/**
 *  LabelButtonView  : 上面 1 个Button 下面 1 个 label  ----------  kButtonLabel
 *
 *  @param buttonImage      按钮 图片
 *  @param buttonSize       按钮字体大小
 *  @param buttonTitle      按钮 title
 *  @param buttonTitleColor 按钮 title color
 *  @param topTitle         label title
 *  @param topFontSize      label 字体大小
 *  @param topTextColor     label 字体颜色
 *  @param spacingH         按钮和label 间隔的距离
 */
-(void)updateButtonLabelWithButtonImage:(UIImage *)buttonImage buttonFontSize:(float)buttonSize buttonTitle:(NSString *)buttonTitle buttonTitleColor:(UIColor *)buttonTitleColor topTitle:(NSString *)topTitle topLabelFontSize:(float)topFontSize  topTextColor:(UIColor *)topTextColor spacingHeight:(float)spacingH {
    
    self.bottomLabel.hidden = YES;
    // 按钮
    self.button.frame = CGRectMake(0, 0 + self.topSpacingHeight, self.width, 0);
    if (buttonImage) {
        [self.button setImage:buttonImage forState:UIControlStateNormal];
        self.button.frame = CGRectMake(self.width/2.0f - buttonImage.size.width/2.0f,  + self.topSpacingHeight, buttonImage.size.width, buttonImage.size.height);
    }
    self.button.titleLabel.font = [UIFont systemFontOfSize:buttonSize];
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
    [self.button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    // topLabel
    self.topLabel.frame = CGRectMake(0, self.button.bottom + spacingH, self.width, (self.height - self.button.bottom)/2.0f);
    self.topLabel.font = [UIFont systemFontOfSize:topFontSize];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.textColor = topTextColor;
    self.topLabel.text = topTitle;
    self.topLabel.numberOfLines = 0;
    [self.topLabel sizeToFit];
    self.topLabel.frame = CGRectMake(0, self.button.bottom + spacingH, self.width, self.topLabel.size.height);
    
    if (self.topLabel.top + self.topLabel.height > self.height) {
        self.frame = CGRectMake(self.left, self.top,self.width, self.topLabel.top + self.topLabel.height + spacingH);
    }
    
}

/**
 *  LabelButtonView  : 上面 1 个 label 下面 1 个 label  ----------  kTwoLabel
 *
 *  @param topTitle        上面label 文字
 *  @param topFontSize     上面label 文字大小
 *  @param topTextColor    上面label 文字颜色
 *  @param bottomTitle     下面label 文字
 *  @param bottomFontSize  下面label 文字大小
 *  @param bottomTextColor 下面label 文字颜色
 *  @param spacingH        上面label 和 下面label 间隔的距离
 */
-(void)updateTwoLabelWithTopTitle:(NSString *)topTitle topLabelFontSize:(float)topFontSize  topTextColor:(UIColor *)topTextColor bottomTitle:(NSString *)bottomTitle bottomLabelFontSize:(float)bottomFontSize  bottomTextColor:(UIColor *)bottomTextColor spacingHeight:(float)spacingH {
    
    // topLabel
    self.topLabel.frame = CGRectMake(0, spacingH, self.width, (self.height - self.button.bottom)/2.0f);
    self.topLabel.font = [UIFont systemFontOfSize:topFontSize];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.textColor = topTextColor;
    self.topLabel.text = topTitle;
    self.topLabel.numberOfLines = 0;
    [self.topLabel sizeToFit];
    self.topLabel.frame = CGRectMake(0,spacingH, self.width, self.topLabel.size.height);
    
    // bottomLabel
    self.bottomLabel.frame = CGRectMake(0, self.topLabel.bottom + spacingH, self.width, self.topLabel.height);
    self.bottomLabel.font = [UIFont systemFontOfSize:bottomFontSize];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.textColor = bottomTextColor;
    self.bottomLabel.text = bottomTitle;
    self.bottomLabel.numberOfLines = 0;
    [self.bottomLabel sizeToFit];
    self.bottomLabel.frame =  CGRectMake(0, self.topLabel.bottom + spacingH, self.width, self.bottomLabel.height);
    
    if (self.bottomLabel.top + self.bottomLabel.height > self.height) {
        self.frame = CGRectMake(self.left, self.top,self.width, self.bottomLabel.top + self.bottomLabel.height + spacingH);
    }
}








@end
