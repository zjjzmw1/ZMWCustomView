//
//  AllShareViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/6/26.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "AllShareViewController.h"
#import "AllShareView.h"

@interface AllShareViewController ()

/// 分享统一的View
@property (strong, nonatomic) AllShareView *allShareView;

@end

@implementation AllShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化分享按钮
    self.allShareView = [[AllShareView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.allShareView];
    [self.allShareView initializationShareView:self];
    
    __weak typeof(self) wSelf = self;
    // 分享按钮
    [self rightButtonWithName:@"分享" image:nil block:^(UIButton *btn) {
        [wSelf showShareView];
    }];


}
/// 弹出分享的方法
-(void)showShareView {
    NSString *myShareTitle = [NSString stringWithFormat:@"分享的title"];
    NSString *myShareString = [NSString stringWithFormat:@"分享的内容"];
    NSString *myShareUrl = [NSString stringWithFormat:@"http://www.baidu.com"];//点击后的跳转链接
    //分享内容
    [self.allShareView updateShareTitle:myShareTitle shareContent:myShareString shareUrlString:myShareUrl shareImage:[UIImage imageNamed:@"Default_Image"] shareImageUrlString:nil];
    [self.allShareView showShareView];
    [self.view bringSubviewToFront:self.allShareView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
