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


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView       *tableView;
@property (strong, nonatomic) NSMutableArray    *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义控件大全";
    // 初始化数据
    [self initDataArray];
    // 初始化表格
    [self initTableView];

}
/// 初始化数据
-(void)initDataArray {
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:@"Tooles.h 里面基本控件"];
    [self.dataArray addObject:@"分享控件"];
    [self.dataArray addObject:@"自定义 LabelButton 控件"];
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
    }
    
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
