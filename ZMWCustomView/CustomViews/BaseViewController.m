//
//  BaseViewController.m
//  Vodka
//
//  Created by Mark C.J. on 15-1-13.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "BaseViewController.h"
#import "IOSUtilsConfig.h"
#import "UIColor+IOSUtils.h"
#import "UIView+Utils.h"
#import "NSString+IOSUtils.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface BaseViewController () {
    
}

@end

@implementation BaseViewController


-(instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self baseNextPageTitleButton:@"返回"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_emptyView == nil) {//尽量在后面加加入，不容易被子视图的view覆盖了
        self.emptyView = [[EmptyView alloc]initWithFrame:CGRectMake(0, self.view.top, kScreen_Width, kScreen_Height - kNavigation_Bar_Height)];
        [self.view addSubview:self.emptyView];
        self.emptyView.backgroundColor = [UIColor colorFromHexString:@"#181818"];
        self.emptyView.hidden = YES;///暂时隐藏。
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - 左边的按钮
- (void)leftButtonWithName:(NSString *)name image:(NSString *)imageString{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 70, 44)];
//    button.backgroundColor = [UIColor blueColor];
    if (![imageString isEmptyString]) {
//        [button setImage:[UIImage imageNamed:@"navigator_btn_back"] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:@"navigator_btn_back"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateHighlighted];
    }
    
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitle:name forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [button addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    
//    [button setContentEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 50)];
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -18;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftItem];
    
}
#pragma mark 左边按钮的点击方法
-(void)leftAction:(UIButton *)button {
    
}

#pragma mark - 左边的按钮
- (void)rightButtonWithName:(NSString *)name image:(NSString *)imageString block:(void(^)(UIButton *btn))block{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 70, 44)];
//    button.backgroundColor = [UIColor blueColor];

    if (![imageString isEmptyString]) {
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateHighlighted];
    }
    
    [button setTitle:name forState:UIControlStateNormal];
//    [button setTitle:name forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -18;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
   
    if (block == nil) {
        return;
    }
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *btn) {
        block(button);
    }];

    //传统的封装按钮的点击事件
    //    [button addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 左边按钮的点击方法
-(void)rightAction:(UIButton *)button{
    
}

#pragma mark - 下个页面的返回按钮------（传空格就是只有一个箭头）。
-(void)baseNextPageTitleButton:(NSString *)nextPageTitleString {
    NSString *titleString = nil;
    if (nextPageTitleString == nil || [nextPageTitleString isEqualToString:@""]) {//传空 ，默认返回。
        titleString = NSLocalizedString(@"返回", nil);
    }else{
        titleString = nextPageTitleString;
    }
    //下一级界面返回按钮
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = titleString;
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
}
@end
