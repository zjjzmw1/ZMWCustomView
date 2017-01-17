//
//  GaoDeMapViewController.m
//  ZMWCustomView
//
//  Created by zhangmingwei on 2017/1/17.
//  Copyright © 2017年 shandandan. All rights reserved.
//

#import "GaoDeMapViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface GaoDeMapViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView     *mapV;  // 高德地图

@end

@implementation GaoDeMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapV = [[MAMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapV];
    self.mapV.delegate = self;
    
}

- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    [self.mapV removeFromSuperview];
    [self.view addSubview:self.mapV];
    self.mapV.frame = self.view.frame;
    self.mapV.delegate = self;
}

- (void)dealloc {

    [self.mapV removeFromSuperview];
    self.mapV.delegate = nil;
    self.mapV = nil;
}

@end
