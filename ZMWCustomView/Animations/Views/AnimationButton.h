//
//  AnimationButton.h
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/19.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface AnimationButton : UIView

@property (nonatomic,copy) finishBlock translateBlock;

@end
