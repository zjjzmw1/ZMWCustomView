//
//  BaseViewController.h
//  Vodka
//
//  Created by Mark C.J. on 15-1-13.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EmptyView.h"                   ///空视图.

@interface BaseViewController : UIViewController

@property (strong, nonatomic) EmptyView *emptyView;                //没有内容的时候的view.


- (void)leftButtonWithName:(NSString *)name image:(NSString *)imageString;

- (void)rightButtonWithName:(NSString *)name image:(NSString *)imageString block:(void(^)(UIButton *btn))block;

-(void)leftAction:(UIButton *)button;
-(void)rightAction:(UIButton *)button;

#pragma mark - 下个页面的返回按钮的文字
-(void)nextBackTitle:(NSString *)title;
@end
