//
//  SimpleAnimationViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/18.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "SimpleAnimationViewController.h"
#import "SimpleMasonryViewController.h"     // masonry方式

@interface SimpleAnimationViewController ()

@property (nonatomic, strong) UIView        *positionView;      // 移动View
@property (nonatomic, strong) UIView        *positionView1;     // 移动View1

@end

@implementation SimpleAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAllView];
    __weak typeof(self) wSelf = self;
    [self rightButtonWithName:@"masonry方式" image:nil block:^(UIButton *btn) {
        SimpleMasonryViewController *vc = [[SimpleMasonryViewController alloc] init];
        [wSelf.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animationAction];
}

#pragma mark - 初始化view
- (void)initAllView {
    self.positionView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    self.positionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.positionView];
    // view1
    self.positionView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 50, 50)];
    self.positionView1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.positionView1];
}

#pragma mark - 动画方法
- (void)animationAction {
    // 移动view的动画
    [UIView animateWithDuration:0.3 animations:^{
        self.positionView.frame = CGRectMake(Screen_Width - 50 - 10,10, 50, 50);
    }];
    // 移动view1的动画
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.positionView1.frame = CGRectMake(Screen_Width - 50 - 10,80, 50, 50);
    } completion:^(BOOL finished) {
        
    }];
}





@end
