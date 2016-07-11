//
//  TestCollectionViewController.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/11.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "IOSUtilsConfig.h"
#import "TestCollectionViewCell.h"
#import "XLPlainFlowLayout.h"                           // section 置顶悬浮上面

#define kSpacing            10                          // cell 直接的间隔
#define kHeaderIdentifier   @"kHeaderIndentifier"       // 表头的宏。

@interface TestCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView          *collectionView;
@property (strong, nonatomic) UICollectionReusableView  *sectionHeaderView;
@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化表格
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // section 悬浮上面的方法。
    XLPlainFlowLayout *layout = [[XLPlainFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(3, 3, 3, 3);
    layout.naviHeight = 0;
    

    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64 , kScreen_Width, kScreen_Height - 64) collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"TestCollectionViewCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // scrollView 去掉最上面的空白。
    self.automaticallyAdjustsScrollViewInsets = NO;
    // section 头..... 但是这个不置顶。 功能类似tableView 的 headerView 其实是section
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];

    // 设置表头 ！！！！！！！！！！！！！！
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    UIImageView *imagev = [[UIImageView alloc]initWithFrame:CGRectMake(0, -50, kScreen_Width, 50)];
    imagev.backgroundColor = [UIColor yellowColor];
    [self.collectionView addSubview: imagev];
    
}

#pragma mark - UICollectionView 代理方法 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return 50;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 40);
}

// cell section 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kSpacing, kSpacing, kSpacing, kSpacing);//分别为上、左、下、右
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestCollectionViewCell" forIndexPath:indexPath];

    cell.imageView.image = [UIImage imageNamed:@"Default_Image"];
    
    return cell;
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - 表头 设置   ------------------ BEGIN ---------------------------
-(UIView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    self.sectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
    self.sectionHeaderView.backgroundColor = [UIColor blueColor];
    return self.sectionHeaderView;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreen_Width,30);
}
#pragma mark - 表头 设置   ------------------ END  ---------------------------

@end
