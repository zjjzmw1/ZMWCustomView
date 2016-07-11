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

@interface HomeCell()

@property (strong, nonatomic) UILabel       *nameLabel;

@end

@implementation HomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andType:(NSString *)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.nameLabel = [Tooles getLabel:CGRectMake(20, 10, kScreen_Width, 40) fontSize:16 alignment:NSTextAlignmentLeft textColor:[UIColor blackColor]];
        [self.contentView addSubview:self.nameLabel];
        
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
}

@end
