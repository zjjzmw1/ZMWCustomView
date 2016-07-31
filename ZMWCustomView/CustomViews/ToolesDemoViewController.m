//
//  ToolesDemoViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/6/26.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "ToolesDemoViewController.h"
#import "IOSUtilsConfig.h"
#import "Tooles.h"
#import "UIView+Utils.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ToolesDemoViewController ()

@property (strong, nonatomic) UILabel       *myLabel;
@property (strong, nonatomic) UILabel       *myLabelMasonry;
@property (strong, nonatomic) UIButton      *myButton;
@property (strong, nonatomic) UIImageView   *myImageV;
@property (strong, nonatomic) UIButton      *myImageTitleButton;    // 带image和title的按钮

@end

@implementation ToolesDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    // 创建UILabel;--------------------------------------------------------------
    self.myLabel = [Tooles getLabel:CGRectMake(20, kNavigation_Bar_Height + 10, kScreen_Width, 30) fontSize:16 alignment:NSTextAlignmentLeft textColor:[UIColor blackColor]];
    [self.view addSubview:self.myLabel];
    self.myLabel.text = @"测试文本";
    
    self.myLabelMasonry = [Tooles getLabelMasonryFont:[UIFont systemFontOfSize:17] alignment:NSTextAlignmentLeft textColor:[UIColor redColor]];
    [self.view addSubview:self.myLabelMasonry];
    self.myLabelMasonry.text = @"测试文本Masonry";
    self.myLabelMasonry.backgroundColor = [UIColor blueColor];
    [self.myLabelMasonry mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wSelf.myLabel.mas_left).offset(10);
        make.top.equalTo(wSelf.myLabel.mas_bottom).offset(200);
    }];
    
    // 创建UIButton; ----------------------------------------------------------
    self.myButton = [Tooles getButton:CGRectMake(self.myLabel.left, self.myLabel.bottom + 5, 100, 40) title:@"测试按钮" titleColor:[UIColor redColor] titleSize:15];
    [self.view addSubview:self.myButton];
    __block int type = 0;
    [[self.myButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *button) {
        if (type < 5) {
            type ++;
        }else{
            type = 0;
        }
        [wSelf initWithImageTitleButtonWithType:type];
    }];

    // 创建UIImageView;----------------------------------------------------------
    self.myImageV = [Tooles getImageView:CGRectMake(self.myLabel.left, self.myButton.bottom + 10, 50, 50) cornerRadius:0];
    [self.view addSubview:self.myImageV];
    self.myImageV.image = [UIImage imageNamed:@"Default_Image"];

    // 创建 带 title image 的按钮 --------------------------------------------------------
    [self initWithImageTitleButtonWithType:type];

}

// 创建 带 title image 的按钮 --------------------------------------------------------
-(void)initWithImageTitleButtonWithType:(int)type{
    [self.myImageTitleButton removeFromSuperview];
    self.myImageTitleButton = [Tooles getButtonWithImageAndTitle:CGRectMake(self.myImageV.left, self.myImageV.bottom + 10, 120, 40) title:@"按钮" image:[UIImage imageNamed:@"test_Little_image"] titleColor:[UIColor redColor] titleSize:15 kSpacing:5 alignmentType:type];
    [self.view addSubview:self.myImageTitleButton];
    // 方便测试
    self.myImageTitleButton.layer.borderColor = [UIColor redColor].CGColor;
    self.myImageTitleButton.layer.borderWidth = 1.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
