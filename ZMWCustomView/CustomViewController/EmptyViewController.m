//
//  EmptyViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/4.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "EmptyViewController.h"
#import "UtilMarco.h"

#import "EmptyView.h"               // 默认空页面

@interface EmptyViewController ()

/// 默认的空页面
@property (strong, nonatomic) EmptyView     *myEmptView;

@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) wSelf = self;
    
    [self rightButtonWithName:@"提交" image:nil block:^(UIButton *btn) {
        if (wSelf.myEmptView.hidden) {
            wSelf.myEmptView.hidden = NO;
        }else{
            wSelf.myEmptView.hidden = YES;
        }
    }];
    
    
    self.myEmptView = [[EmptyView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64)];
    [self.myEmptView image:[UIImage imageNamed:@"share_to_qq"] labelTitle:@"请检查您的网络"];
    [self.view addSubview:self.myEmptView];


}



@end
