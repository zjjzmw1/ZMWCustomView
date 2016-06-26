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

@interface ToolesDemoViewController ()

@property (strong, nonatomic) UILabel       *myLabel;
@property (strong, nonatomic) UIButton      *myButton;
@property (strong, nonatomic) UIImageView   *myImageV;

@end

@implementation ToolesDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建UILabel;
    self.myLabel = [Tooles getLabel:CGRectMake(20, kNavigation_Bar_Height + 10, kScreen_Width, 30) fontSize:16 alignment:NSTextAlignmentLeft textColor:[UIColor blackColor]];
    [self.view addSubview:self.myLabel];
    self.myLabel.text = @"测试文本";
    
    // 创建UIButton;
    self.myButton = [Tooles getButton:CGRectMake(self.myLabel.left, self.myLabel.bottom + 10, 100, 40) title:@"测试按钮" titleColor:[UIColor redColor] titleSize:15];
    [self.view addSubview:self.myButton];
    
    // 创建UIImageView;
    self.myImageV = [Tooles getImageView:CGRectMake(self.myLabel.left, self.myButton.bottom + 10, 50, 50) cornerRadius:0];
    [self.view addSubview:self.myImageV];
    self.myImageV.image = [UIImage imageNamed:@"Default_Image"];



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
