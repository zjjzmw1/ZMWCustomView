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
    ///凡是继承UIScrollView的控件都会受到UIViewController的这个automaticallyAdjustsScrollViewInsets属性的影响 默认为YES 当有navigationbar的时候,UITextView的表现就是上面空白设为NO,UITextView就正常了
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.myTextView = [[CustomTextView alloc]initWithFrame:CGRectMake(20, 190, 300, 200)];
    self.myTextView.placeholder = @"请输入默认文字";
    [self.view addSubview:self.myTextView];
    
}

@end
