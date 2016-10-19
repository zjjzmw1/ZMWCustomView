//
//  AnimationTextField.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/19.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "AnimationTextField.h"

#define kAnnHeight      6.0      // 注释文字上面的时候的高度
#define kLineHeight     1.0      // 下划线的高度
#define kSpacing        1.0      // 控件间的空隙

@interface AnimationTextField()<UITextFieldDelegate>

@property (nonatomic,assign) BOOL moved;    // 移动过

@end

@implementation AnimationTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 注释文字
        _annLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kAnnHeight + kSpacing, self.frame.size.width, self.frame.size.height - kAnnHeight - kLineHeight - kSpacing * 2)];
        _annLabel.font = [UIFont systemFontOfSize:15.f];
        _annLabel.textColor = [UIColor blackColor];
        [self addSubview:_annLabel];
        // 输入框
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, kAnnHeight + kSpacing, self.frame.size.width, self.frame.size.height - kAnnHeight - kLineHeight - kSpacing * 2)];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.font = [UIFont systemFontOfSize:15.f];
        _textField.textColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.tintColor = [UIColor redColor];
        [self addSubview:_textField];
        // 下划线
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - kLineHeight, self.frame.size.width, kLineHeight)];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_lineView];
        // 下划线的layer
        _lineLayer = [CALayer layer];
        _lineLayer.frame = CGRectMake(0, 0, 0, kLineHeight);
        _lineLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [_lineView.layer addSublayer:_lineLayer];
        // 输入框文字变化的监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(obserValue:) name:UITextFieldTextDidChangeNotification object:_textField];
    }
    return self;
}

#pragma mark - textField 文字变化的监听
-(void)obserValue:(NSNotification *)obj{
    if(_textField.text.length != 0 && !_moved){ // 有文字输入了
        [self moveAnimation]; // 移动到上面
    }else if(_textField.text.length == 0 && _moved){ // 没有文字输入并且之前有文字输入
        [self backAnimation]; // 还原到下面
    }
}

#pragma mark - 注释移动到上面
-(void)moveAnimation {
    _annLabel.font = [UIFont systemFontOfSize:10.f];
    [UIView animateWithDuration:0.15 animations:^{
        _annLabel.alpha = 1;
        _moved = YES;
        _annLabel.frame = CGRectMake(0, 0, self.frame.size.width, kAnnHeight);
        _lineLayer.frame = CGRectMake(0, 0, self.frame.size.width, kLineHeight);
    }];
}

#pragma mark - 注释还原到和textField重合
-(void)backAnimation {
    _annLabel.font = [UIFont systemFontOfSize:15.f];
    [UIView animateWithDuration:0.15 animations:^{
        _moved = NO;
        _annLabel.frame = CGRectMake(0, kAnnHeight + kSpacing, self.frame.size.width, self.frame.size.height - kAnnHeight - kLineHeight - kSpacing * 2);
        _lineLayer.frame = CGRectMake(0, 0, 0, kLineHeight);
    }];
}

@end
