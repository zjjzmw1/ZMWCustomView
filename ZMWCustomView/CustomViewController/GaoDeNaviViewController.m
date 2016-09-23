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
#import <Masonry.h>

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GaoDeNaviViewController ()<AMapNaviDriveViewDelegate,AMapNaviDriveManagerDelegate,AMapNaviDriveDataRepresentable>

@property (nonatomic, strong) AMapNaviPoint             *startPoint;
@property (nonatomic, strong) AMapNaviPoint             *endPoint;
@property (nonatomic, strong) AMapNaviDriveView         *driveView;
@property (nonatomic, strong) AMapNaviDriveManager      *driveManager;

@property (nonatomic, strong) UILabel                   *testLabel;     // 暂时导航返回的数据

@end

@implementation GaoDeNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高德导航调研";
    
    // 设置起点、终点坐标
    [self initProperties];
    // 导航地图view
    [self initDriveView];
    // 导航manager 开始导航
    [self initDriveManager];
    
    self.testLabel = [[UILabel alloc] init];
    self.testLabel.backgroundColor = [UIColor lightGrayColor];
    self.testLabel.alpha = 0.6;
    self.testLabel.textColor = [UIColor redColor];
    [self.view addSubview:self.testLabel];
    __weak typeof(self) wSelf = self;
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(wSelf.view);
        make.left.right.equalTo(wSelf.view);
        make.height.mas_equalTo(60);
    }];
    
    [self rightButtonWithName:@"导航数据展示" image:nil block:^(UIButton *btn) {
        GaodeDataViewController *vc = [[GaodeDataViewController alloc] init];
        [wSelf.navigationController pushViewController:vc animated:YES];
    }];

}

#pragma mark - 实时导航相关
/**
 设置起点终点
 */
- (void)initProperties
{
    self.startPoint = [AMapNaviPoint locationWithLatitude:39.993135 longitude:116.474175];
    //    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.908791 longitude:116.321257];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.808791 longitude:116.421257];
    
}

/**
 导航地图View
 */
- (void)initDriveView
{
    __weak typeof(self) wSelf = self;
    self.driveView = [[AMapNaviDriveView alloc] init];
    [self.view addSubview:self.driveView];
    [self.driveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(wSelf.view).with.insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    self.driveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.driveView setDelegate:self];
}


/**
 导航Manager
 */
- (void)initDriveManager
{
    self.driveManager = [[AMapNaviDriveManager alloc] init];
    [self.driveManager setDelegate:self];
    [self.driveManager addDataRepresentative:self];
    self.driveManager.updateCameraInfo = NO;    //  是否播放摄像头信息
    //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
    [self.driveManager addDataRepresentative:self.driveView];
    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                endPoints:@[self.endPoint]
                                                wayPoints:nil
                                          drivingStrategy:17];
    
}

/**
 *  驾车路径规划成功后的回调函数
 */
- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"onCalculateRouteSuccess");
    self.testLabel.text = [NSString stringWithFormat:@"导航成功总距离 %ld 米",driveManager.naviRoute.routeLength];
    //算路成功后开始GPS导航
    [self.driveManager startGPSNavi];
    // 模拟导航
    //    [self.driveManager startEmulatorNavi];
    
}

/**
 *  驾车路径规划失败后的回调函数
 *
 *  @param error 错误信息,error.code参照AMapNaviCalcRouteState
 */
- (void)driveManager:(AMapNaviDriveManager *)driveManager onCalculateRouteFailure:(NSError *)error {
    NSLog(@"失败的回调");
    self.testLabel.text = [NSString stringWithFormat:@"导航失败：%@",error.description];
}

/**
 *  出现偏航需要重新计算路径时的回调函数
 */
- (void)driveManagerNeedRecalculateRouteForYaw:(AMapNaviDriveManager *)driveManager {
    NSLog(@"您已经偏离导航");
    self.testLabel.text = @"您已经偏离导航";
    // 重新规划
    [self.driveManager recalculateDriveRouteWithDrivingStrategy:17];
}

/**
 *  导航到达目的地后的回调函数
 */
- (void)driveManagerOnArrivedDestination:(AMapNaviDriveManager *)driveManager {
    NSLog(@"成功抵达");
    self.testLabel.text = @"成功抵达";
}

/**
 *  导航播报信息回调函数
 *
 *  @param soundString 播报文字
 *  @param soundStringType 播报类型,参考AMapNaviSoundType
 */
- (void)driveManager:(AMapNaviDriveManager *)driveManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType {
    NSLog(@"soundS===%@",soundString);
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:soundString];
    utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
    [av speakUtterance:utterance];
}

/**
 *  导航信息更新回调
 *
 *  @param naviInfo 导航信息,参考 AMapNaviInfo 类
 */
- (void)driveManager:(AMapNaviDriveManager *)driveManager updateNaviInfo:(nullable AMapNaviInfo *)naviInfo {
    NSLog(@"剩余 %ld 米 方向：%ld ,当前路段名字：%@ ",naviInfo.segmentRemainDistance,(long)naviInfo.iconType,naviInfo.currentRoadName);
    NSString *directionString = @"直线";
    switch (naviInfo.iconType) {
        case AMapNaviIconTypeLeft:
        case AMapNaviIconTypeLeftFront:
            directionString = @"左转";
            break;
        case AMapNaviIconTypeRight:
        case AMapNaviIconTypeRightFront:
            directionString = @"右转";
            break;
        case AMapNaviIconTypeLeftBack:
        case AMapNaviIconTypeRightBack:
        case AMapNaviIconTypeLeftAndAround:
            directionString = @"掉头";
            break;
        default:
            directionString = @"直行";
            break;
    }
    self.testLabel.text = [NSString stringWithFormat:@"剩余 %ld 米 方向：%@ ",naviInfo.segmentRemainDistance,directionString];
}

@end
