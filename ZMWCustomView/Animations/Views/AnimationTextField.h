//
//  AnimationTextField.h
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/19.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationTextField : UIView

@property (nonatomic, strong) UILabel       *annLabel;      // 注释的文字
@property (nonatomic, strong) UITextField   *textField;     // 输入框
@property (nonatomic, strong) UIView        *lineView;      // 下划线
@property (nonatomic, strong) CALayer       *lineLayer;     // 下划线的layer

@end
