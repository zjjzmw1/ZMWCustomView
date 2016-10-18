//
//  CustomAlertViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/27.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "CustomAlertViewController.h"
#import "CustomAlertView.h"
#import "UtilMarco.h"
#import "Tooles.h"

@interface CustomAlertViewController ()

@property (strong, nonatomic) CustomAlertView       *alertView;

@end

@implementation CustomAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) wSelf = self;
     UIButton *button1 = [Tooles getButton:CGRectMake(10, 100, 100, 40) title:@"测试按钮" titleColor:[UIColor redColor] titleSize:15];
    [self.view addSubview:button1];
    __block int type = 0;
    [[button1 rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *button) {
        if (type < 2) {
            type ++;
        }else{
            type = 0;
        }
        [wSelf showAlertWithType:type];
    }];
    
}

-(void)showAlertWithType:(int)type {
    if (type == 1) {
        self.alertView = [[CustomAlertView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
        [self.view addSubview:self.alertView];
        
        [self.alertView initializationViewNomal:self image:[UIImage imageNamed:@"share_to_qq"] title:@"车辆尚未激活保修" message:@"车辆后续的售后服务和优惠信息都将通过激活的账号提供，请使用常用账号激活保修" name1:@"产品型号" detail1:@"xiangdddf" name2:@"中控编号" detail2:@"BS2341422123" leftButtonTitle:@"切换账号" rightButtonTitle:@"激活保修" block:^(UIButton *btn) {
            if (btn.tag == 1) {
                NSLog(@"点击了左边按钮");
            }else{
                NSLog(@"点击了右边按钮");
            }
        }];
    }else{
        CustomAlertView *alertView2 = [[CustomAlertView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
        [self.view addSubview:alertView2];
        
        [alertView2 initializationView:self image:[UIImage imageNamed:@"share_to_qq"] title:@"车辆尚未激活保修" message:@"车辆后续的售后服务和优惠信息都将通过激活的账号提供，请使用常用账号激活保修" leftButtonTitle:@"切换账号" rightButtonTitle:@"激活保修" block:^(UIButton *btn) {
            if (btn.tag == 1) {
                NSLog(@"点击了左边按钮");
            }else{
                NSLog(@"点击了右边按钮");
            }
        }];

    }
}



@end
