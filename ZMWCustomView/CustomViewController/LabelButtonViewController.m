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

@end

@implementation LabelButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.labelButton = [[LabelButtonView alloc]initWithFrame:CGRectMake(10, 80, 100, 60)];
    self.labelButton.layer.borderColor = [UIColor redColor].CGColor;
    self.labelButton.layer.borderWidth = 0;
    [self.view addSubview:self.labelButton];
    [self.labelButton updateButtonLabelLabelWithButtonImage:[UIImage imageNamed:@"test_Little_image"] buttonFontSize:15 buttonTitle:nil buttonTitleColor:nil topTitle:@"里程" topLabelFontSize:16 topTextColor:[UIColor blackColor] bottomTitle:@"15km" bottomLabelFontSize:13 bottomTextColor:[UIColor redColor] spacingHeight:3.0f];
    self.labelButton.topSpacingHeight = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
