//
//  BigImageViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/8.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "BigImageViewController.h"
#import "Tooles.h"
#import "UIView+Utils.h"
#import "BigImageBrowser.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface BigImageViewController ()

@property (strong, nonatomic) UIImageView       *mySmallImageV;

@end

@implementation BigImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    
    self.mySmallImageV = [Tooles getImageView:CGRectMake(10, 80, 80, 80) cornerRadius:0];
    self.mySmallImageV.image = [UIImage imageNamed:@"Default_Image"];
    [self.view addSubview:self.mySmallImageV];
    self.mySmallImageV.userInteractionEnabled = YES;
    // 测试url  : http://zhangmingwei.qiniudn.com/1-130422091545.jpg
    [self.mySmallImageV setTapActionWithBlock:^{
        [[BigImageBrowser defaultManager]showImage:wSelf.mySmallImageV superView:wSelf.view.window];
        [[BigImageBrowser defaultManager].bigImageView sd_setImageWithURL:[NSURL URLWithString:@"http://zhangmingwei.qiniudn.com/1-130422091545.jpg"] placeholderImage:[UIImage imageNamed:@"Default_Image"]];
        [wSelf.mySmallImageV sd_setImageWithURL:[NSURL URLWithString:@"http://zhangmingwei.qiniudn.com/1-130422091545.jpg"]];
    }];
    




}



@end
