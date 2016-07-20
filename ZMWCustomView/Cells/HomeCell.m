//
//  MyTableViewCell.m
//  Demo
//
//  Created by xiaoming on 15/11/11.
//  Copyright © 2015年 dandanshan. All rights reserved.
//

#import "HomeCell.h"
#import "Tooles.h"
#import "IOSUtilsConfig.h"
#import "UIView+Utils.h"
#import "UIImage+IOSUtils.h"

@interface HomeCell()

@property (strong, nonatomic) UILabel       *nameLabel;
@property (strong, nonatomic) UIImageView   *iconImageView;
@property (strong, nonatomic) UIImageView   *iconImageView2;
@property (strong, nonatomic) UIImageView   *iconImageView3;



@end

@implementation HomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.nameLabel = [Tooles getLabel:CGRectMake(20, 10, kScreen_Width, 40) fontSize:16 alignment:NSTextAlignmentLeft textColor:[UIColor blackColor]];
        [self.contentView addSubview:self.nameLabel];
        
        self.iconImageView = [Tooles getImageView:CGRectMake(kScreen_Width - 160, 10, 30, 30) cornerRadius:0];
        [self.contentView addSubview:self.iconImageView];
        self.iconImageView2 = [Tooles getImageView:CGRectMake(self.iconImageView.right, 10, 30, 30) cornerRadius:0];
        [self.contentView addSubview:self.iconImageView2];
        self.iconImageView3 = [Tooles getImageView:CGRectMake(self.iconImageView2.right, 10, 30, 30) cornerRadius:0];
        [self.contentView addSubview:self.iconImageView3];

        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (id)homeCellWithReuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    return [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier andType:type];
}

#pragma mark - 自定义的cell赋值方法.
- (void)drawCellWithString:(NSString *)string row:(NSInteger)row count:(NSInteger)count {
    
    self.nameLabel.text = string;
    UIImage *image = [UIImage imageNamed:@"Default_Image"];
    UIImage *resultImage = [image imageWithRoundedCornersAndSize:self.iconImageView.size andCornerRadius:5];
    self.iconImageView.image = resultImage;
    self.iconImageView2.image = resultImage;
    self.iconImageView3.image = resultImage;
    
}

@end
