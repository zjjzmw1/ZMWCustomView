//
//  AnimationListCell.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/18.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "AnimationListCell.h"
#import "Tooles.h"
#import "UtilMarco.h"
#import "UIView+Utils.h"
#import "UIImage+IOSUtils.h"

@interface AnimationListCell()

@property (strong, nonatomic) UILabel       *nameLabel;

@end

@implementation AnimationListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [Tooles getLabel:CGRectMake(20, 10, kScreen_Width, 40) fontSize:16 alignment:NSTextAlignmentLeft textColor:[UIColor blackColor]];
        [self.contentView addSubview:self.nameLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithString:(NSString *)string row:(NSInteger)row count:(NSInteger)count {
    
    self.nameLabel.text = string;
}
@end
