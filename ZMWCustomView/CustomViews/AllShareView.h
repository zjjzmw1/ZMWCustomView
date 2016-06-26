//
//  AllShareView.h
//  Vodka
//
//  Created by speedx on 16/5/19.
//  Copyright © 2016年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllShareView : UIView

/// 骑行记录 需要的详情
@property (strong, nonatomic) UIImage           *myImage;

/// 初始化分享控件
- (void)initializationShareView:(UIViewController *)currentViewController;

/// 弹出分享控件
-(void)showShareView;

/**
 *  更新分享控件的分享内容
 *
 *  @param title          标题
 *  @param content        内容
 *  @param urlString      点击后的跳转链接
 *  @param shareImage     图片UImage
 *  @param imageUrlString 图片的url 一般用不到
 */
-(void)updateShareTitle:(NSString *)title shareContent:(NSString *)content shareUrlString:(NSString *)urlString shareImage:(UIImage *)shareImage shareImageUrlString:(NSString *)imageUrlString;


@end
