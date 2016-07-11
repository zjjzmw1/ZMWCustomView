//
//  TestCollectionViewCell.m
//  ZMWCustomView
//
//  Created by speedx on 16/7/11.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "TestCollectionViewCell.h"
#import "UIView+Utils.h"

@implementation TestCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, self.contentView.height)];
    [self.contentView addSubview:self.imageView];
    
    self.layer.masksToBounds = YES;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;      ///这个是取中间的一部分。。不压缩的。
    
    self.contentView.backgroundColor = [UIColor redColor];
    return self;
}



@end
