//
//  LabelLabelViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "LabelLabelViewController.h"
#import "LabelLabel.h"
#import "IOSUtilsConfig.h"

@interface LabelLabelViewController ()

@end

@implementation LabelLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    LabelLabel *labelLabel = [[LabelLabel alloc]initWithFrame:CGRectMake(10, 100, kScreen_Width - 20, 50)];
    [self.view addSubview:labelLabel];
    [labelLabel updateTwoLabelWithleftTitle:@"姓名：" leftLabelFontSize:18 leftTextColor:[UIColor blackColor] rightTitle:@"xiaoming" rightLabelFontSize:16 rightTextColor:[UIColor redColor]];
    
    labelLabel.backgroundColor = [UIColor lightGrayColor];
}

@end
