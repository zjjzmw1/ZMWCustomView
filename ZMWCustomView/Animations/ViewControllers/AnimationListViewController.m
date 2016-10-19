//
//  AnimationListViewController.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/18.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "AnimationListViewController.h"
#import "AnimationListCell.h"

#import "SimpleAnimationViewController.h"       // 简单动画
#import "CABasicAniamtionViewController.h"      // CABasic相关动画


@interface AnimationListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView       *tableView;
@property (strong, nonatomic) NSMutableArray    *dataArray;

@end

@implementation AnimationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画大全";
    // 初始化数据
    [self initDataArray];
    // 初始化表格
    [self initTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(void)initDataArray {
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:@"简单动画"];
    [self.dataArray addObject:@"CABasic相关动画"];
}

-(void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    // 注册cell
    [self.tableView registerClass:[AnimationListCell class] forCellReuseIdentifier:@"AnimationListCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // 中间线的颜色、样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor lightGrayColor];
    // 中间线的位置
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    // 内容少于一屏的时候，去掉多余的中间的线。
    UIView *footerV = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:footerV];
}

#pragma mark - Table view data source
// 可以去掉 表格设置 UITableViewStyleGrouped 后 默认的 上面的留白
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

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
    
    AnimationListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimationListCell" forIndexPath:indexPath];
    [cell drawCellWithString:[self.dataArray objectAtIndex:indexPath.row] row:indexPath.row count:self.dataArray.count];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseViewController *vc = [[BaseViewController alloc]init];

    if (indexPath.row == 0) {
        vc = [[SimpleAnimationViewController alloc] init];
    } else if (indexPath.row == 1) {
        vc = [[CABasicAniamtionViewController alloc] init];
    }
    
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
