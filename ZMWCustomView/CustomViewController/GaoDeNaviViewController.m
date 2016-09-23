//
//  GaoDeNaviViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/9/23.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "GaoDeNaviViewController.h"
#import "SizeMarco.h"
#import "GaodeDataViewController.h"

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapNaviKit/AMapNaviKit.h>

@interface GaoDeNaviViewController ()<AMapNaviDriveViewDelegate,AMapNaviDriveManagerDelegate>


@property (nonatomic, strong) AMapNaviPoint             *startPoint;
@property (nonatomic, strong) AMapNaviPoint             *endPoint;
@property (nonatomic, strong) AMapNaviDriveView         *driveView;
@property (nonatomic, strong) AMapNaviDriveManager      *driveManager;

@end

@implementation GaoDeNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高德导航调研";
    
    // 实时导航
    [self initProperties];
    [self initDriveView];
    [self initDriveManager];
    [self singleRoutePlanAction:nil];
    
    __weak typeof(self) wSelf = self;
    [self rightButtonWithName:@"导航数据展示" image:nil block:^(UIButton *btn) {
        GaodeDataViewController *vc = [[GaodeDataViewController alloc] init];
        [wSelf.navigationController pushViewController:vc animated:YES];
    }];
    
}


#pragma mark - 实时导航相关

- (void)initProperties
{
    self.startPoint = [AMapNaviPoint locationWithLatitude:39.993135 longitude:116.474175];
//    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.908791 longitude:116.321257];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.808791 longitude:116.421257];

}

- (void)singleRoutePlanAction:(id)sender
{
    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                endPoints:@[self.endPoint]
                                                wayPoints:nil
                                          drivingStrategy:17];
}

- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    //算路成功后开始GPS导航
    [self.driveManager startGPSNavi];
}

- (void)initDriveView
{
    if (self.driveView == nil)
    {
        self.driveView = [[AMapNaviDriveView alloc] initWithFrame:CGRectMake(0, kNavigation_Bar_Height, kScreen_Width, kScreen_Height - kNavigation_Bar_Height)];
        self.driveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.driveView setDelegate:self];
        
        [self.view addSubview:self.driveView];
    }
}

- (void)initDriveManager
{
    if (self.driveManager == nil)
    {
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
        [self.driveManager addDataRepresentative:self.driveView];
    }
}

@end
