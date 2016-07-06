//
//  MyLabelViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/6.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "MyLabelViewController.h"
#import "CustomLabel.h"

@interface MyLabelViewController ()

@property (strong, nonatomic) CustomLabel       *myLabel;

@end

@implementation MyLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myLabel = [[CustomLabel alloc]initWithFrame:CGRectMake(10, 80, 300, 20) fontSize:16 alignment:NSTextAlignmentLeft textColor:[UIColor blueColor]];
    [self.view addSubview:self.myLabel];
    NSString *originalString = @"你是第99名";
    [self.myLabel updateWithText:originalString specialTextColor:[UIColor redColor] range:[originalString rangeOfString:@"99"]];


}

@end
