//
//  CATrasitionBackViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/20.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "CATrasitionBackViewController.h"

@interface CATrasitionBackViewController ()

@property (nonatomic, strong) UIImageView       *imgV;

@end

@implementation CATrasitionBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转场动画";
    self.view.backgroundColor = [UIColor redColor];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageV];
    self.imgV = imageV;

    
    [self animationAction];
}


- (void)animationAction {
    CATransition *animation = [CATransition animation];
    animation.duration = 2;
    animation.fillMode = kCAFillModeForwards;
    animation.type = self.animationString;
    animation.subtype = kCATransitionFromTop;
    [self.imgV.layer addAnimation:animation forKey:nil];
    self.imgV.image = [UIImage imageNamed:@"Default_Image"];

}

@end
