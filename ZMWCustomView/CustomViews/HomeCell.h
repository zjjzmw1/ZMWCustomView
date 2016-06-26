//
//  MyTableViewCell.h
//  Demo
//
//  Created by xiaoming on 15/11/11.
//  Copyright © 2015年 dandanshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell

#pragma mark - 初始化的cell.
+ (id)homeCellWithReuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type;

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithString:(NSString *)string row:(NSInteger)row count:(NSInteger)count;


@end
