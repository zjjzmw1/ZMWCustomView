//
//  LabelButtonView.h
//  ZMWCustomView
//
//  Created by speedx on 16/6/30.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopButtomLabelView : UIView

/// 上面的 label
@property (strong, nonatomic) UILabel               *topLabel;
/// 下面的 label
@property (strong, nonatomic) UILabel               *bottomLabel;

/**
 *  TopButtomLabelView  : 上面 1 个 label 下面 1 个 label
 *
 *  @param topTitle        上面label 文字
 *  @param bottomTitle     下面label 文字
 */
-(void)updateTwoLabelWithTopTitle:(NSString *)topTitle bottomTitle:(NSString *)bottomTitle;

@end
