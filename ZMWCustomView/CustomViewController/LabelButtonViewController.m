//
//  LabelButtonViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/6/30.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "LabelButtonViewController.h"
#import "LabelButtonView.h"
#import "UIView+Utils.h"

@interface LabelButtonViewController ()

/// 自定义的labelButton
@property (strong, nonatomic) LabelButtonView       *labelButton;

@property (strong, nonatomic) LabelButtonView       *labelButton2;
@property (strong, nonatomic) LabelButtonView       *labelButton3;

@end

@implementation LabelButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /// 上面一个按钮。下面两个label
    self.labelButton = [[LabelButtonView alloc]initWithFrame:CGRectMake(10, 80, 100, 60)];
    self.labelButton.layer.borderColor = [UIColor redColor].CGColor;
    self.labelButton.layer.borderWidth = 1;
    [self.view addSubview:self.labelButton];
    self.labelButton.topSpacingHeight = 2;
    [self.labelButton updateButtonLabelLabelWithButtonImage:[UIImage imageNamed:@"test_Little_image"] buttonFontSize:15 buttonTitle:nil buttonTitleColor:nil topTitle:@"里程" topLabelFontSize:16 topTextColor:[UIColor blackColor] bottomTitle:@"15km" bottomLabelFontSize:13 bottomTextColor:[UIColor redColor] spacingHeight:3.0f];
    
    /// 上面一个button  下面一个label
    self.labelButton2 = [[LabelButtonView alloc]initWithFrame:CGRectMake(self.labelButton.left, self.labelButton.bottom + 30, 100, 60)];
    self.labelButton2.layer.borderColor = [UIColor redColor].CGColor;
    self.labelButton2.layer.borderWidth = 1;
    [self.view addSubview:self.labelButton2];
    [self.labelButton2 updateButtonLabelWithButtonImage:[UIImage imageNamed:@"test_Little_image"] buttonFontSize:15 buttonTitle:nil buttonTitleColor:nil topTitle:@"距离" topLabelFontSize:15 topTextColor:[UIColor redColor] spacingHeight:4];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
