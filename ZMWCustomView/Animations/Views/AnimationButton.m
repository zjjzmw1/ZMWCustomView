//
//  AnimationButton.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/19.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "AnimationButton.h"

@interface AnimationButton()

//渲染层
@property (nonatomic,strong) CAShapeLayer *maskLayer;           // 填充layer

@property (nonatomic,strong) CAShapeLayer *shapeLayer;          // 边框layer

@property (nonatomic,strong) CAShapeLayer *loadingLayer;        // loading

@property (nonatomic,strong) CAShapeLayer *clickCicrleLayer;

@property (nonatomic,strong) UIButton *button;                  // 按钮

@end

@implementation AnimationButton

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        // 边框,border 一会儿发生动画变化
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.bounds;
        _shapeLayer.path = [self drawBezierPath:frame.size.height/2].CGPath;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;    // 填充色
        _shapeLayer.strokeColor = [UIColor whiteColor].CGColor; // 边框色
        _shapeLayer.lineWidth = 2;
        [self.layer addSublayer:_shapeLayer];
        // 按钮的填充的颜色
        _maskLayer = [CAShapeLayer layer];
        _maskLayer.opacity = 0; // 先设置为透明
        _maskLayer.fillColor = [UIColor whiteColor].CGColor;
        _maskLayer.path = [self drawBezierPath:self.frame.size.width/2].CGPath;
        [self.layer addSublayer:self.maskLayer];
        // 按钮
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = self.bounds;
        [_button setTitle:@"点我" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [self addSubview:_button];
        [_button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - 点击按钮事件
-(void)clickBtn{
    [self clickAnimation];
}

#pragma mark - 动画1 : 点击出现白色圆形动画
-(void)clickAnimation{
    // 画圆并放大动画
    CAShapeLayer *clickCicrleLayer = [CAShapeLayer layer];
    clickCicrleLayer.frame = CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, 0, 0);
    clickCicrleLayer.fillColor = [UIColor whiteColor].CGColor;
    clickCicrleLayer.path = [self drawclickCircleBezierPath:0].CGPath;
    [self.layer addSublayer:clickCicrleLayer];
    //放大变色圆形 path
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = 0.5;
    basicAnimation.toValue = (__bridge id _Nullable)([self drawclickCircleBezierPath:10].CGPath);
    basicAnimation.removedOnCompletion = NO;
    [clickCicrleLayer addAnimation:basicAnimation forKey:@"clickCicrleAnimation"];// 这个字符串没用
    _clickCicrleLayer = clickCicrleLayer;
    
    //执行下一个动画
    [self performSelector:@selector(clickNextAnimation) withObject:self afterDelay:basicAnimation.duration];
}

#pragma mark - 第二个动画
-(void)clickNextAnimation{
    //圆形变圆弧
    _clickCicrleLayer.fillColor = [UIColor clearColor].CGColor;
    _clickCicrleLayer.strokeColor = [UIColor whiteColor].CGColor;
    _clickCicrleLayer.lineWidth = 10;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    //圆弧变大
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = 0.5;
    basicAnimation.toValue = (__bridge id _Nullable)([self drawclickCircleBezierPath:(self.bounds.size.height - 10*2)].CGPath);
    //变透明
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation1.beginTime = 0.10;
    basicAnimation1.duration = 0.5;
    basicAnimation1.toValue = @0; // 最后完全透明
    animationGroup.duration = basicAnimation1.beginTime + basicAnimation1.duration;
    animationGroup.animations = @[basicAnimation,basicAnimation1];
    
    [_clickCicrleLayer addAnimation:animationGroup forKey:@"clickCicrleAnimation1"];
    // 第三个动画
    [self performSelector:@selector(startMaskAnimation) withObject:self afterDelay:animationGroup.duration];
}

#pragma mark - 第三个动画: 半透明的登录按钮的背景
-(void)startMaskAnimation{
    _maskLayer.opacity = 0.5;
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = 0.25;
    basicAnimation.toValue = (__bridge id _Nullable)([self drawBezierPath:self.frame.size.height/2].CGPath);
    [_maskLayer addAnimation:basicAnimation forKey:@"maskAnimation"];
    [self performSelector:@selector(dismissAnimation) withObject:self afterDelay:basicAnimation.duration+0.2];
}

#pragma mark - 第四个动画: 登录按钮合拢并消失（透明）
-(void)dismissAnimation{
    [self removeSubViews];
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = 0.2;
    basicAnimation.toValue = (__bridge id _Nullable)([self drawBezierPath:self.frame.size.width/2].CGPath);
    // 合并完不会有闪一下的效果----不加这两句，又返回到之前的效果了。刚合并完，又恢复到起始的效果了。
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation1.beginTime = 0.10;
    basicAnimation1.duration = 0.2;
    basicAnimation1.toValue = @0;
    basicAnimation1.removedOnCompletion = NO;
    basicAnimation1.fillMode = kCAFillModeForwards;
    
    animationGroup.animations = @[basicAnimation,basicAnimation1];
    animationGroup.duration = basicAnimation1.beginTime+basicAnimation1.duration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    [_shapeLayer addAnimation:animationGroup forKey:@"dismissAnimation"];
    // loading动画
    [self performSelector:@selector(loadingAnimation) withObject:self afterDelay:animationGroup.duration];
}

#pragma mark - 第五个动画，loading
-(void)loadingAnimation{
    _loadingLayer = [CAShapeLayer layer];
    _loadingLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    _loadingLayer.fillColor = [UIColor clearColor].CGColor;
    _loadingLayer.strokeColor = [UIColor whiteColor].CGColor;
    _loadingLayer.lineWidth = 2;
    _loadingLayer.path = [self drawLoadingBezierPath].CGPath;
    [self.layer addSublayer:_loadingLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(M_PI*2);
    basicAnimation.duration = 0.5;
    basicAnimation.repeatCount = LONG_MAX;
    [_loadingLayer addAnimation:basicAnimation forKey:@"loadingAnimation"];
    // 删除layer调整下个页面
    [self performSelector:@selector(removeAllAnimation) withObject:self afterDelay:2];
}

#pragma mark - 最后删除所有的动画
-(void)removeAllAnimation{
    [self removeSubViews];
    if(self.translateBlock){
        self.translateBlock();
    }
}

-(void)removeSubViews{
    [_button removeFromSuperview];
    [_maskLayer removeFromSuperlayer];
    [_loadingLayer removeFromSuperlayer];
    [_clickCicrleLayer removeFromSuperlayer];
}

#pragma mark - 画圆弧类的图形(贝塞尔曲线)  半径、左圆弧和右圆弧
-(UIBezierPath *)drawBezierPath:(CGFloat)x{
    CGFloat radius = self.bounds.size.height/2 - 3;     // 圆弧半径
    CGFloat right = self.bounds.size.width-x;
    CGFloat left = x;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //右边圆弧 x轴右边是0度  都是顺时针 （负90度----90度）
    [bezierPath addArcWithCenter:CGPointMake(right, self.bounds.size.height/2) radius:radius startAngle:-M_PI/2 endAngle:M_PI/2 clockwise:YES];
    //左边圆弧 都是顺时针 （90度 --- 负90度）
    [bezierPath addArcWithCenter:CGPointMake(left, self.bounds.size.height/2) radius:radius startAngle:M_PI/2 endAngle:-M_PI/2 clockwise:YES];
    //闭合弧线
    [bezierPath closePath];
    return bezierPath;
}

#pragma mark - loading动画
-(UIBezierPath *)drawLoadingBezierPath{
    CGFloat radius = self.bounds.size.height/2 - 3;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(0,0) radius:radius startAngle:M_PI/2 endAngle:M_PI/2+M_PI/2 clockwise:YES];
    return bezierPath;
}

#pragma mark - 通用的画圆方法，很多地方都用着一个
-(UIBezierPath *)drawclickCircleBezierPath:(CGFloat)radius{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    /**
     *  center: 弧线中心点的坐标
     radius: 弧线所在圆的半径
     startAngle: 弧线开始的角度值
     endAngle: 弧线结束的角度值
     clockwise: 是否顺时针画弧线
     *
     */
    [bezierPath addArcWithCenter:CGPointMake(0,0) radius:radius startAngle:0-2 endAngle:M_PI*2+2 clockwise:YES];
    return bezierPath;
}

@end
