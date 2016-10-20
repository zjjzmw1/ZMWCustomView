//
//  CATrasitionViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/20.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "CATrasitionViewController.h"
#import "Tooles.h"
#import "CATrasitionBackViewController.h"

@interface CATrasitionViewController ()

@property (nonatomic, strong) UILabel           *typeLabel;     // 动画类型的label
@property (nonatomic, strong) NSMutableArray    *typeArray;     // 动画类型的数组
@property (nonatomic, assign) int               typeFlag;
@end

@implementation CATrasitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转场动画";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.typeArray = [NSMutableArray arrayWithCapacity:10];
    [self.typeArray addObject:@"cube"];
    [self.typeArray addObject:@"moveIn"];
    [self.typeArray addObject:@"reveal"];
    [self.typeArray addObject:@"fade"];
    [self.typeArray addObject:@"pageCurl"];
    [self.typeArray addObject:@"pageUnCurl"];
    [self.typeArray addObject:@"suckEffect"];
    [self.typeArray addObject:@"rippleEffect"];
    [self.typeArray addObject:@"oglFlip"];

    
    self.typeLabel = [Tooles getLabelMasonryFont:[UIFont systemFontOfSize:17] alignment:NSTextAlignmentCenter textColor:[UIColor blackColor]];
    self.typeLabel.frame = CGRectMake(0, 200, Screen_Width, 50);
    [self.view addSubview:self.typeLabel];
    self.typeLabel.text = self.typeArray[0];
    
    __weak typeof(self) wSelf = self;
    [self rightButtonWithName:@"push" image:nil block:^(UIButton *btn) {
        [wSelf toNextVC];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.typeFlag < self.typeArray.count - 1) {
        self.typeFlag ++ ;
    } else {
        self.typeFlag = 0;
    }
    self.typeLabel.text = self.typeArray[self.typeFlag];
}

#pragma mark - 跳转到下一页
- (void)toNextVC {
//    CATransition *animation = [CATransition animation];
//    animation.duration = 2;
//    animation.fillMode = kCAFillModeForwards;
//    animation.type = self.typeArray[self.typeFlag];
//    animation.subtype = kCATransitionFromTop;
    CATrasitionBackViewController *vc = [[CATrasitionBackViewController alloc] init];
//    [vc.view.layer addAnimation:animation forKey:nil];
    vc.animationString = self.typeArray[self.typeFlag];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
