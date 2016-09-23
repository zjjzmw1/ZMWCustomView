//
//  GaodeDataViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/9/23.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "GaodeDataViewController.h"

@interface GaodeDataViewController ()<MAMapViewDelegate,AMapNaviDriveManagerDelegate>

@property (nonatomic, strong) AMapNaviPoint             *startPoint;
@property (nonatomic, strong) AMapNaviPoint             *endPoint;
@property (nonatomic, strong) MAMapView                 *mapView;
@property (nonatomic, strong) AMapNaviDriveManager      *driveManager;

@end

@implementation GaodeDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航数据展示";

    // 导航路线规划 -- 数据展示
    [self initProperties];
    [self initMapView];
    [self initDriveManager];
    [self singleRoutePlanAction:nil];
}

#pragma mark - 导航路线规划相关

- (void)initProperties
{
    self.startPoint = [AMapNaviPoint locationWithLatitude:39.993135 longitude:116.474175];
    //    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.908791 longitude:116.321257];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.808791 longitude:116.421257];
    
}

- (void)initMapView
{
    if (self.mapView == nil)
    {
        self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64,
                                                                   self.view.bounds.size.width,
                                                                   self.view.bounds.size.height - 64)];
        [self.mapView setDelegate:self];
        [self.view addSubview:self.mapView];
    }
}

- (void)initDriveManager
{
    if (self.driveManager == nil)
    {
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
    }
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
    
    // 可能用到的规划信息：
    /*
    driveManager.naviRouteIDs;      // 多路径规划时的所有路径ID           NSArray<NSNumber *>
    driveManager.naviRoute;         // 当前导航路径的信息                AMapNaviRoute
    driveManager.naviRoute.routeLength; // 导航路径总长度(单位:米)        NSInteger
    driveManager.naviRoute.routeTime;   // 导航路径所需的时间(单位:秒)     NSInteger
    driveManager.naviRoute.routeStartPoint; // 路线方案的起点坐标         AMapNaviPoint
    driveManager.naviRoute.routeEndPoint; // 路线方案的终点坐标           AMapNaviPoint
    driveManager.naviRoute.routeSegments; // 导航路线的所有分段;          NSArray<AMapNaviSegment *>
    driveManager.naviRoute.routeSegmentCount; // 导航路线上分段的总数     NSInteger
    driveManager.naviRoute.wayPoints;         // 路径的途经点坐标           NSArray<AMapNaviPoint *>
    driveManager.naviRoute.wayPointsIndexes;  //  路径的途经点所在segment段的index    NSIndexPath
    driveManager.naviRoute.wayPointCoordIndexes; // 路径的途经点在routeCoordinates上对应的index  NSArray<NSNumber *>
     */
    //算路成功后显示路径
    //    [self showNaviRoutes];
    
    int totalLength = (int)driveManager.naviRoute.routeLength;              // 导航总距离 m
    int totalTime = (int)driveManager.naviRoute.routeTime;                  // 总时间   s
    float startLat = driveManager.naviRoute.routeStartPoint.latitude;       // 起点纬度
    float endLat = driveManager.naviRoute.routeEndPoint.latitude;           // 终点纬度
    NSArray *routeSegments =  driveManager.naviRoute.routeSegments;         // 分段数组
    int segmentCount = (int)driveManager.naviRoute.routeSegmentCount;            // 分段数量
    
    NSLog(@"导航总长度 ： %d米 , 总时间 ： %d秒, 起点纬度： %f, 终点纬度 : %f 分段数组：%@，段数： %d",totalLength,totalTime,startLat,endLat,routeSegments,segmentCount);
    
    NSLog(@"==================================================================");
    for (int i = 0; i < routeSegments.count; i++) {
        AMapNaviSegment *seg = routeSegments[i];
        int segLength = (int)seg.length;    // 当前端的长度，m
        int segTime = (int)seg.time;        // 当前端的时间 s
        AMapNaviIconType type = seg.iconType;   // 方向
        NSArray *segPointArray =seg.coordinates;    // 分段的所有坐标 AMapNaviPoint;
        AMapNaviPoint *segStartP = segPointArray[0];
        float segStartLat = segStartP.latitude;
        NSLog(@"当前段：第%d段,长度：%d米，时间：%d秒，方向：%ld,当前段的点的数组：%@，当前段起点的纬度：%f",i+1,segLength,segTime,(long)type,segPointArray,segStartLat);
    }
    
    NSString *message = [NSString stringWithFormat:@"导航总长度 ： %d米 , 总时间 ： %d秒, 起点纬度： %f, 终点纬度 : %f 分段数组：%@，段数： %d",totalLength,totalTime,startLat,endLat,routeSegments,segmentCount];
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil];
    [alertV show];
    
}

@end
