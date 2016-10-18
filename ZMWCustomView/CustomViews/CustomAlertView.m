//
//  CustomAlertView.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/26.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "CustomAlertView.h"
#import "ReactiveCocoa.h"
#import "UIView+Utils.h"
#import "ProgressHUD.h"
#import "Tooles.h"
#import "UIColor+IOSUtils.h"
#import "UtilMarco.h"
#import "NSString+IOSUtils.h"
#import "Tooles.h"

@implementation CustomAlertView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.maskView = [[UIView alloc]initWithFrame:frame];
        [self addSubview:self.maskView];
        [self.maskView setTapActionWithBlock:^{
//            [wSelf hide];
        }];
        self.maskView.backgroundColor = [UIColor blackColor];
    }
    return self;
}

/**
 *  自定义AlertView弹出框
 *
 *  @param currentViewController 调用弹出框的viewController
 *  @param image                 图片
 *  @param title                 标题
 *  @param message               内容
 *  @param leftTitle             左边按钮文字
 *  @param rightTitle            右边按钮文字
 *  @param block                 点击事件block
 */
- (void) initializationView:(UIViewController *)currentViewController image:(UIImage *)image title:(NSString *)title message:(NSString *)message leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle block:(void(^)(UIButton *btn))block {
    [self initializationViewNomal:currentViewController image:image title:title message:message name1:nil detail1:nil name2:nil detail2:nil leftButtonTitle:leftTitle rightButtonTitle:rightTitle block:^(UIButton *btn) {
        block(btn);
    }];
}

/**
 *  自定义AlertView弹出框
 *
 *  @param currentViewController 调用弹出框的viewController
 *  @param image                 图片
 *  @param title                 标题
 *  @param message               内容
 *  @param name1                 附加名字1
 *  @param detail1               附加内容1
 *  @param name2                 附加名字2
 *  @param detail2               附加内容2
 *  @param leftTitle             左边按钮文字
 *  @param rightTitle            右边按钮文字
 *  @param block                 点击事件block
 */
- (void) initializationViewNomal:(UIViewController *)currentViewController image:(UIImage *)image title:(NSString *)title message:(NSString *)message name1:(NSString *)name1 detail1:(NSString *)detail1 name2:(NSString *)name2 detail2:(NSString *)detail2 leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle block:(void(^)(UIButton *btn))block {
    __weak typeof(self) wSelf = self;
    self.hidden = YES;
    // 弹出框
    self.alertView = [[UIView alloc] init];
    [self addSubview:self.alertView];
    [self.alertView setBackgroundColor:[UIColor whiteColor]];
    [self.alertView setUserInteractionEnabled:YES];
    self.alertView.frame = CGRectMake(25, 120, Screen_Width - 25*2, 200);
    self.alertView.layer.cornerRadius = 13;
    self.alertView.layer.masksToBounds = YES;
    // 自定义label和button的view
    self.labelButtonView = [[LabelButtonView alloc]initWithFrame:CGRectMake(10, 10, self.alertView.width - 10*2, 100)];
    self.labelButtonView.spacingHeight = 15;
    [self.alertView addSubview:self.labelButtonView];
    [self.labelButtonView updateButtonLabelLabelWithButtonImage:image buttonFontSize:15 buttonTitle:nil buttonTitleColor:nil topTitle:title topLabelFontSize:17 topTextColor:[UIColor blackColor] bottomTitle:message bottomLabelFontSize:14 bottomTextColor:[UIColor colorFromHexString:@"#111111"] spacingHeight:10];
    // namelabel1
    self.nameLabel1 = [Tooles getLabel:CGRectMake(self.labelButtonView.left, self.labelButtonView.bottom + 10, self.labelButtonView.width/2.0f, 20) fontSize:12 alignment:NSTextAlignmentLeft textColor:[UIColor colorFromHexString:@"#999999"]];
    [self.alertView addSubview:self.nameLabel1];
    self.nameLabel1.text = name1;
    // detailLabel1
    self.detailLabel1 = [Tooles getLabel:CGRectMake(self.labelButtonView.width/2.0, self.nameLabel1.top, self.labelButtonView.width/2.0f, 20) fontSize:12 alignment:NSTextAlignmentRight textColor:[UIColor blackColor]];
    [self.alertView addSubview:self.detailLabel1];
    self.detailLabel1.text = detail1;
    // namelabel2
    self.nameLabel2 = [Tooles getLabel:CGRectMake(self.labelButtonView.left, self.nameLabel1.bottom + 15, self.labelButtonView.width/2.0f, 20) fontSize:12 alignment:NSTextAlignmentLeft textColor:[UIColor colorFromHexString:@"#999999"]];
    [self.alertView addSubview:self.nameLabel2];
    self.nameLabel2.text = name2;
    // detailLabel2
    self.detailLabel2 = [Tooles getLabel:CGRectMake(self.labelButtonView.width/2.0, self.nameLabel2.top, self.labelButtonView.width/2.0f, 20) fontSize:12 alignment:NSTextAlignmentRight textColor:[UIColor blackColor]];
    [self.alertView addSubview:self.detailLabel2];
    self.detailLabel2.text = detail2;
    
    if ([name1 isEqualToString:@""] || name1 == nil) {
        self.nameLabel1.frame = CGRectMake(self.labelButtonView.left, self.labelButtonView.bottom + 10, self.labelButtonView.width/2.0f, 0);
        self.detailLabel1.frame = CGRectMake(self.labelButtonView.width/2.0, self.nameLabel1.top, self.labelButtonView.width/2.0f, 0);
    }
    if ([name2 isEqualToString:@""] || name2 == nil) {
        self.nameLabel2.frame = CGRectMake(self.labelButtonView.left, self.nameLabel1.bottom + 15, self.labelButtonView.width/2.0f, 0);
        self.detailLabel2.frame = CGRectMake(self.labelButtonView.width/2.0, self.nameLabel2.top, self.labelButtonView.width/2.0f, 0);
    }
    
    // 横线、取消、竖线、确定
    self.lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.nameLabel2.bottom + 20, self.alertView.width, 1)];
    if ([name1 isEqualToString:@""] || name1 == nil) {
        self.lineImageView.frame = CGRectMake(0, self.nameLabel2.bottom + 0, self.alertView.width, 1);
    }
    [self.alertView addSubview:self.lineImageView];
    self.lineImageView.backgroundColor = [UIColor colorFromHexString:@"#cccccc"];
    self.leftButton = [Tooles getButton:CGRectMake(0, self.lineImageView.bottom, self.alertView.width/2.0f - 0.5, 44) title:leftTitle titleColor:[UIColor colorFromHexString:@"#e61f29"] titleSize:15];
    self.leftButton.tag = 1;
    [[self.leftButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *btn) {
        /// 点击左边按钮
        [wSelf hide];
        block(wSelf.leftButton);
    }];
    [self.alertView addSubview:self.leftButton];
    self.verticalLineImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(self.leftButton.right, self.leftButton.top, 1, self.leftButton.height)];
    [self.alertView addSubview:self.verticalLineImageView];
    self.verticalLineImageView.backgroundColor = [UIColor colorFromHexString:@"#cccccc"];
    self.rightButton = [Tooles getButton:CGRectMake(self.verticalLineImageView.right, self.lineImageView.bottom, self.alertView.width/2.0f - 0.5, 44) title:rightTitle titleColor:[UIColor colorFromHexString:@"#e61f29"] titleSize:15];
    [self.alertView addSubview:self.rightButton];
    self.rightButton.tag = 2;
    [[self.rightButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        /// 点击右边按钮
        [wSelf hide];
        block(wSelf.rightButton);
    }];
    
    self.alertView.frame = CGRectMake(25, 120, Screen_Width - 25*2, self.leftButton.bottom);
    self.hidden = NO;
    self.alertView.alpha = 0;
    self.maskView.alpha = 0;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        wSelf.alertView.alpha = 1;
        wSelf.maskView.alpha = 0.6f;
    } completion:^(BOOL finished) {
        
    }];
}

/**
 *  隐藏控件
 */
- (void)hide{
    __weak typeof(self) wSelf = self;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        wSelf.maskView.alpha = 0.0f;
        wSelf.alertView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        wSelf.hidden = YES;
        [wSelf.maskView removeFromSuperview];
        [wSelf.alertView removeFromSuperview];
        [wSelf removeFromSuperview];
    }];
}

@end
