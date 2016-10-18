//
//  AnimationListCell.h
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/18.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationListCell : UITableViewCell

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithString:(NSString *)string row:(NSInteger)row count:(NSInteger)count;

@end
