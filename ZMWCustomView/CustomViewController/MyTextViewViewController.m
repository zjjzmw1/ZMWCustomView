//
//  MyTextViewViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/4.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "MyTextViewViewController.h"
#import "CustomTextView.h"

@interface MyTextViewViewController ()

/// 自定义的textView
@property (strong, nonatomic) CustomTextView    *myTextView;

@end

@implementation MyTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.myTextView = [[CustomTextView alloc]initWithFrame:CGRectMake(20, 190, 300, 200)];
    self.myTextView.placeholder = @"请输入默认文字";
    [self.view addSubview:self.myTextView];
    
//    self.myTextView.showsVerticalScrollIndicator = NO; // 是否隐藏滚动条竖的

}

@end
