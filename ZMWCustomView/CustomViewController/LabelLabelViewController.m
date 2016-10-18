//
//  LabelLabelViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/28.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "LabelLabelViewController.h"
#import "LabelLabel.h"
#import "LabelLabelMasonry.h"
#import "UtilMarco.h"
#import <Masonry.h>

@interface LabelLabelViewController ()

@end

@implementation LabelLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // frame 方式
    LabelLabel *labelLabel = [[LabelLabel alloc]initWithFrame:CGRectMake(10, 100, Screen_Width - 20, 50)];
    [self.view addSubview:labelLabel];
    [labelLabel updateTwoLabelWithleftTitle:@"行吗打算发地方暗室sdf sad fasdf sadf逢灯萨芬的：" leftLabelFont:[UIFont boldSystemFontOfSize:15] leftTextColor:[UIColor blackColor] rightTitle:@"23ese" rightLabelFont:[UIFont systemFontOfSize:14] rightTextColor:[UIColor blackColor]];
    labelLabel.backgroundColor = [UIColor lightGrayColor];
    
    
    // masonry 方式
    __weak typeof(self) wSelf = self;
    LabelLabelMasonry *twoLabel = [[LabelLabelMasonry alloc]init];
    [self.view addSubview:twoLabel];
    [twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wSelf.view).offset(10);
        make.right.equalTo(wSelf.view).offset(-10);
        make.top.equalTo(wSelf.view.mas_bottom).offset(-50);
        make.bottom.equalTo(wSelf.view).offset(-10);
    }];
    twoLabel.backgroundColor = [UIColor lightGrayColor];
    [twoLabel updateTwoLabelWithleftTitle:@"行吗打算发地方sd fsad fsad fsdfsadfw 暗室逢灯萨芬的：" leftLabelFont:[UIFont boldSystemFontOfSize:15] leftTextColor:[UIColor redColor] rightTitle:@"sdffsadf" rightLabelFont:[UIFont systemFontOfSize:15] rightTextColor:[UIColor blueColor]];
}

@end
