//
//  HomeViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/6/25.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"

// 所有控制测试视图
#import "ToolesDemoViewController.h"            // Tooles.h 里面 便利的控件初始化
#import "AllShareViewController.h"              // 分享统一控件
#import "LabelButtonViewController.h"           // 自定义 LabelButton控件
#import "EmptyViewController.h"                 // 默认页面
#import "MyTextViewViewController.h"            // 自定义TextView

#import <MapKit/MapKit.h>

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>

@property (strong, nonatomic) UITableView       *tableView;
@property (strong, nonatomic) NSMutableArray    *dataArray;


@property (strong, nonatomic) CLLocationManager *loc; // 必须用属性的方式，用局部变量不行。
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义控件大全";
    // 初始化数据
    [self initDataArray];
    // 初始化表格
    [self initTableView];
    
    // 测试定位功能
    [self testLocationAction];

}

/// 初始化数据
-(void)initDataArray {
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:@"Tooles.h 里面基本控件"];
    [self.dataArray addObject:@"分享控件"];
    [self.dataArray addObject:@"自定义 LabelButton 控件"];
    [self.dataArray addObject:@"统一的默认页面"];
    [self.dataArray addObject:@"自定义textView"];
}

/// 初始化表格
-(void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);//线的位置
    UIView *footerV = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:footerV];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"HomeCell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [HomeCell homeCellWithReuseIdentifier:CellIdentifier andType:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }

    [cell drawCellWithString:[self.dataArray objectAtIndex:indexPath.row] row:indexPath.row count:self.dataArray.count];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseViewController *vc = [[BaseViewController alloc]init];
    
    if (indexPath.row == 0) {
         vc = [[ToolesDemoViewController alloc]init];
    }else if (indexPath.row == 1){
         vc = [[AllShareViewController alloc]init];
    }else if (indexPath.row == 2){
        vc = [[LabelButtonViewController alloc]init];
    }else if (indexPath.row == 3){
        vc = [[EmptyViewController alloc]init];
    }else if (indexPath.row == 4){
        vc = [[MyTextViewViewController alloc]init];
    }
    
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// 测试定位
-(void)testLocationAction {
    self.loc = [[CLLocationManager alloc]init];
    self.loc.delegate = self;
    self.loc.desiredAccuracy = kCLLocationAccuracyBest;
    self.loc.pausesLocationUpdatesAutomatically = NO;
    [self.loc setAllowsBackgroundLocationUpdates:YES];
    [self.loc requestAlwaysAuthorization];
    [self.loc startUpdatingHeading];
    [self.loc startUpdatingLocation];
    [self.loc stopMonitoringSignificantLocationChanges];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.loc stopUpdatingLocation];
    [self.loc stopUpdatingHeading];
}

@end
