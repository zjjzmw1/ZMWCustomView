//
//  LabelButtonView.m
//  ZMWCustomView
//
//  Created by speedx on 16/6/30.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "TopButtomLabelView.h"
#import "UIView+Utils.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import "UIColor+CodeFragments.h"

@implementation TopButtomLabelView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 上面的 label
        self.topLabel = [[UILabel alloc] init];
        self.topLabel.backgroundColor = [UIColor clearColor];
        self.topLabel.font = [UIFont systemFontOfSize:17];
        self.topLabel.textAlignment = NSTextAlignmentCenter;
        self.topLabel.textColor = [UIColor colorFromHexString:@"0x212121"];
        [self addSubview:self.topLabel];
        
        // 下面的 label
        self.bottomLabel = [[UILabel alloc] init];
        self.bottomLabel.backgroundColor = [UIColor clearColor];
        self.bottomLabel.font = [UIFont systemFontOfSize:12];
        self.bottomLabel.textAlignment = NSTextAlignmentCenter;
        self.bottomLabel.textColor = [UIColor colorFromHexString:@"0x212121"];
        [self addSubview:self.bottomLabel];
        
        __weak typeof(self) wSelf = self;
        [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wSelf);
            make.right.equalTo(wSelf);
            make.top.equalTo(wSelf);
            make.height.equalTo(wSelf.bottomLabel.mas_height).with.multipliedBy(1);
        }];

        [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wSelf);
            make.right.equalTo(wSelf);
            make.top.equalTo(wSelf.topLabel.mas_bottom);
            make.height.equalTo(wSelf.topLabel.mas_height).with.multipliedBy(1);
        }];
    }
    return self;
}

/**
 *  TopButtomLabelView  : 上面 1 个 label 下面 1 个 label
 *
 *  @param topTitle        上面label 文字
 *  @param bottomTitle     下面label 文字
 */
-(void)updateTwoLabelWithTopTitle:(NSString *)topTitle bottomTitle:(NSString *)bottomTitle {
    
    self.topLabel.text = topTitle;
    self.bottomLabel.text = bottomTitle;
}

@end
