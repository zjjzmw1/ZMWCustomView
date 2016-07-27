//
//  CustomAlertView.h
//  ZMWCustomView
//
//  Created by speedx on 16/7/26.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelButtonView.h"         // 自定义的labe，button中和的View

@interface CustomAlertView : UIView

/// 蒙层View
@property (nonatomic, strong) UIView            *maskView;
/// 自定义alertView
@property (strong, nonatomic) UIView            *alertView;
/// 自定义label和button的view
@property (strong, nonatomic) LabelButtonView   *labelButtonView;
/// 列表name1
@property (strong, nonatomic) UILabel           *nameLabel1;
/// 列表detail1
@property (strong, nonatomic) UILabel           *detailLabel1;
/// 列表name2
@property (strong, nonatomic) UILabel           *nameLabel2;
/// 列表detail2
@property (strong, nonatomic) UILabel           *detailLabel2;
/// 横线
@property (strong, nonatomic) UIImageView       *lineImageView;
/// 左边按钮 - 可以没有下面的竖线和右边按钮
@property (strong, nonatomic) UIButton          *leftButton;
/// 中间竖线
@property (strong, nonatomic) UIImageView       *verticalLineImageView;
/// 右边按钮
@property (strong, nonatomic) UIButton          *rightButton;


- (void) initializationViewNomal:(UIViewController *)currentViewController image:(UIImage *)image title:(NSString *)title message:(NSString *)message name1:(NSString *)name1 detail1:(NSString *)detail1 name2:(NSString *)name2 detail2:(NSString *)detail2 leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle block:(void(^)(UIButton *btn))block ;

- (void) initializationView:(UIViewController *)currentViewController image:(UIImage *)image title:(NSString *)title message:(NSString *)message leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle block:(void(^)(UIButton *btn))block ;

@end
