//
//  LabelButtonView.h
//  ZMWCustomView
//
//  Created by speedx on 16/6/30.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LabelButtonViewType) {   // 目前默认这三个，以后遇见了可以再添加
    kTwoLabel           =   0,      // 上下两个Label
    kButtonLabel        =   1,      // 上面一个Button 下面一个 label
    kButtonLabelLabel   =   2       // 上面一个Button 下面两个 label
};

@interface LabelButtonView : UIView

/// 上面的 label
@property (strong, nonatomic) UILabel               *topLabel;
/// 下面的 label
@property (strong, nonatomic) UILabel               *bottomLabel;
/// 唯一的 button
@property (strong, nonatomic) UIButton              *button;

/// 控件类型
@property(nonatomic, assign)  LabelButtonViewType   viewType;
/// 三个控件中间的间隔高度
@property (assign, nonatomic) float                 spacingHeight;
/// 距离上面的距离
@property (assign, nonatomic) float                 topSpacingHeight;

/**
 *  LabelButtonView  : 上面 1 个Button 下面 2 个 label
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
-(void)updateButtonLabelLabelWithButtonImage:(UIImage *)buttonImage buttonFontSize:(float)buttonSize buttonTitle:(NSString *)buttonTitle buttonTitleColor:(UIColor *)buttonTitleColor topTitle:(NSString *)topTitle topLabelFontSize:(float)topFontSize  topTextColor:(UIColor *)topTextColor bottomTitle:(NSString *)bottomTitle bottomLabelFontSize:(float)bottomFontSize  bottomTextColor:(UIColor *)bottomTextColor  spacingHeight:(float)spacingH;

@end
