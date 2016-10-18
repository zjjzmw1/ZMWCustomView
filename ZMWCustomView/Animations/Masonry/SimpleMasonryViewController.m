//
//  SimpleMasonryViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/18.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "SimpleMasonryViewController.h"
#import <Masonry.h>
#import "ZMWCustomView-Swift.h"

@interface SimpleMasonryViewController ()

@property (nonatomic, strong) UIView        *positionView;       // 移动View
@property (nonatomic, strong) UIView        *positionView1;      // 移动View1

@end

@implementation SimpleMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAllView];
    __weak typeof(self) wSelf = self;
    [self rightButtonWithName:@"swift方式" image:nil block:^(UIButton *btn) {
        SimpleSwiftViewController *vc = [[SimpleSwiftViewController alloc] init];
        [wSelf.navigationController pushViewController: vc animated:YES];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animationAction];
}

#pragma mark - 初始化view
- (void)initAllView {
    __weak typeof(self) wSelf = self;
    self.positionView = [[UIView alloc] init];
    [self.view addSubview:self.positionView];
    self.positionView.backgroundColor = [UIColor redColor];
    [self.positionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wSelf.view).offset(10);
        make.top.equalTo(wSelf.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    // view1
    self.positionView1 = [[UIView alloc] init];
    [self.view addSubview:self.positionView1];
    self.positionView1.backgroundColor = [UIColor blueColor];
    [self.positionView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wSelf.view).offset(10);
        make.top.equalTo(wSelf.view).offset(80);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
}

#pragma mark - 动画方法
- (void)animationAction {
    __weak typeof(self) wSelf = self;
    // 移动view的动画
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.positionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(wSelf.view).offset(-10);
            make.top.equalTo(wSelf.view).offset(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        [self.view layoutIfNeeded];
    }];
    // 延迟移动view1
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionTransitionNone animations:^{
        [self.positionView1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(wSelf.view).offset(-10);
            make.top.equalTo(wSelf.view).offset(80);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
