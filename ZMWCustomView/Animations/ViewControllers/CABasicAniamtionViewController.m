//
//  CABasicAniamtionViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/19.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "CABasicAniamtionViewController.h"
#import "BezierAnimationViewController.h"       // 下个页面
#import "AnimationButton.h"                     // 自定义动画按钮

@interface CABasicAniamtionViewController ()

@end

@implementation CABasicAniamtionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.view.layer addSublayer: [self backgroundLayer]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initAllView]; // 进入下个页面的时候按钮remove了,所以在这里面添加
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 初始化所有view
- (void)initAllView {
    AnimationButton *login = [[AnimationButton alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    login.center = CGPointMake(self.view.center.x, Screen_Height - 200);
    [self.view addSubview:login];
    __block AnimationButton *button = login;
    __weak typeof(self) wSelf = self;
    login.translateBlock = ^{
        NSLog(@"跳转了哦");
        button.bounds = CGRectMake(0, 0, 44, 44); // 更改大小而不是位置。
        button.layer.cornerRadius = 22;
        BezierAnimationViewController *vc = [[BezierAnimationViewController alloc] init];
        [wSelf presentViewController:vc animated:YES completion:nil];
    };
}

#pragma mark - 渐变的背景色
-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0.65); // 0.5,0 代表top为0 x为中间， 左上角是 0，0
    gradientLayer.endPoint = CGPointMake(0.5, 1);
//    gradientLayer.locations = @[@0.65,@1];// 把这句注释了，修改startPoint 为 0.5，0.65可以起到同样的作用。
    return gradientLayer;
}


@end
