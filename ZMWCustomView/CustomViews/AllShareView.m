//
//  AllShareView.m
//  Vodka
//
//  Created by speedx on 16/5/19.
//  Copyright © 2016年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "AllShareView.h"
#import "ReactiveCocoa.h"
#import "UIView+Utils.h"
#import "ProgressHUD.h"
#import "Tooles.h"
#import "UIColor+IOSUtils.h"
#import "UtilMarco.h"
#import "NSString+IOSUtils.h"

// 分享相关 SDK
//#import "ShareWeChatUtil.h"
//#import <ShareSDK/ShareSDK.h>
//#import <FBSDKShareKit/FBSDKShareKit.h>
//#import <FBSDKShareKit/FBSDKSharingContent.h>
//#import <FBSDKCoreKit/FBSDKAccessToken.h>
//#import <TwitterKit/TwitterKit.h>

@interface AllShareView ()
/// 蒙层View
@property (nonatomic, strong) UIView            *maskView;
/// 分享图标View
@property (nonatomic, strong) UIView            *shareView;
/// 分享的第三方图标和名字
@property (nonatomic, strong) NSArray           *shareTitlesArray;

// --------------------------分享需要填写的title、content、image等 --------------------------------
/// 分享的title
@property (strong, nonatomic) NSString          *myShareTitle;
/// 分享的内容
@property (strong, nonatomic) NSString          *myShareContent;
/// 分享的点击的url跳转
@property (strong, nonatomic) NSString          *myShareUrlString;
/// 分享的图片Image
@property (strong, nonatomic) UIImage           *myShareImage;
/// 分享的图片的url （有的时候需要图片的url）
@property (strong, nonatomic) NSString          *myShareImageUrlString;

@end

@implementation AllShareView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.maskView = [[UIView alloc]initWithFrame:frame];
        [self addSubview:self.maskView];
        __weak typeof(self) wSelf = self;
        [self.maskView setTapActionWithBlock:^{
            [wSelf hide];
        }];
        self.maskView.backgroundColor = [UIColor blackColor];
        
        
        // 初始化分享控件  twitter Facebook ------ 默认的分享第三方种类
        self.shareTitlesArray = @[ @{@"title":NSLocalizedString(@"微信好友", nil), @"imagename":@"share_to_wechat"},
                                   @{@"title":NSLocalizedString(@"朋友圈", nil), @"imagename":@"share_to_timeline"},
                                   @{@"title":NSLocalizedString(@"QQ", nil), @"imagename":@"share_to_qq"},@{@"title":NSLocalizedString(@"新浪微博", nil), @"imagename":@"share_to_sina"},@{@"title":NSLocalizedString(@"Facebook", nil), @"imagename":@"share_to_facebook"},@{@"title":NSLocalizedString(@"Twitter", nil), @"imagename":@"share_to_twitter"}
                                   ];
    }
    return self;
}

- (void)initializationShareView:(UIViewController *)currentViewController{
    __weak typeof(self) wSelf = self;
//    __weak typeof(currentViewController) currentVC = currentViewController;
    self.hidden = YES;
    
    self.shareView = [[UIView alloc] init];
    [self.shareView setBackgroundColor:[UIColor colorFromHexString:@"363636"]];
    [self.shareView setUserInteractionEnabled:YES];
    [self addSubview:self.shareView];
    self.shareView.frame = CGRectMake(0, kScreen_Height - 200, kScreen_Width, 200);
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.backgroundColor = [UIColor clearColor];
    titleL.textColor = [UIColor whiteColor];
    titleL.font = [UIFont systemFontOfSize:14];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.text = NSLocalizedString(@"把这个消息告诉小伙伴吧", nil) ;
    [self.shareView addSubview:titleL];
    titleL.frame = CGRectMake(0, 15, kScreen_Width, 30);
    
    CGFloat scrollViewWidth = kScreen_Width + 100;
    UIScrollView *shareScrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0 + 50, scrollViewWidth, 100)];
    shareScrollView.backgroundColor = [UIColor clearColor];
    // 是否滚动
    shareScrollView.scrollEnabled = YES;
    shareScrollView.showsHorizontalScrollIndicator = NO;
    shareScrollView.contentSize = CGSizeMake(scrollViewWidth + 100, 100);
    // 是否同时运动,lock
    shareScrollView.directionalLockEnabled = YES;
    [self.shareView addSubview:shareScrollView];
    
    for (int i = 0; i < self.shareTitlesArray.count; i++) {
        NSDictionary* dict = self.shareTitlesArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor clearColor]];
        [button setImage:[UIImage imageNamed:dict[@"imagename"]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:dict[@"imagename"]] forState:UIControlStateNormal];
        [button setTitle:dict[@"title"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:0];
        button.tag = i;
        [shareScrollView addSubview:button];
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            
            [wSelf hide];
            wSelf.shareView.frame = CGRectMake(0, kScreen_Height - 200, kScreen_Width, 200);
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                wSelf.shareView.frame = CGRectMake(0, kScreen_Height, kScreen_Width, 200);
            } completion:^(BOOL finished) {
                
            }];
            
            UIButton* sender = (UIButton*)x;
            
            if([sender.currentTitle isEqualToString:NSLocalizedString(@"微信好友", nil)]){
//                [ShareWeChatUtil shareActivityToWechat:[UIImage imageNamed:@"message_system_icon"] title:wSelf.myShareTitle description:wSelf.myShareContent url:self.myShareUrlString scene:WXSceneSession];
            }
            else if ([sender.currentTitle isEqualToString:NSLocalizedString(@"朋友圈", nil)]){
//                [ShareWeChatUtil shareActivityToWechat:[UIImage imageNamed:@"message_system_icon"] title:wSelf.myShareTitle description:wSelf.myShareContent url:wSelf.myShareUrlString scene:WXSceneTimeline];
            }
            else if ([sender.currentTitle isEqualToString:NSLocalizedString(@"QQ", nil)]){
                if (![[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
                    [ProgressHUD showError:NSLocalizedString(@"请安装QQ客户端", nil)];
                }
                // qq分享
//                NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//                [shareParams SSDKSetupShareParamsByText:wSelf.myShareContent
//                                                 images:[NSArray arrayWithObject:[UIImage imageNamed:@"message_system_icon"]]
//                                                    url:[NSURL URLWithString:wSelf.myShareUrlString]
//                                                  title:wSelf.myShareTitle
//                                                   type:SSDKContentTypeAuto];
//                
//                [ShareSDK share:SSDKPlatformTypeQQ parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//                    
//                }];
            }
            else if ([sender.currentTitle isEqualToString:NSLocalizedString(@"新浪微博", nil)]){// 微博分享
//                NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//                [shareParams SSDKSetupShareParamsByText:[NSString stringWithFormat:@"%@ %@ %@",wSelf.myShareContent,NSLocalizedString(@"点我点我", nil),NSLocalizedString(@"立即加入", nil)]
//                                                 images:[NSArray arrayWithObject:[UIImage imageNamed:@"message_system_icon"]]
//                                                    url:[NSURL URLWithString:wSelf.myShareUrlString]
//                                                  title:wSelf.myShareTitle
//                                                   type:SSDKContentTypeWebPage];
//                
//                // 没有这句，直接弹出分享成功了，用户不能输入自己的内容了
//                [shareParams SSDKEnableUseClientShare];
//                [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//                    if (state == SSDKResponseStateSuccess) {
//                        NSLog(@"分享成功");
//                        [ProgressHUD showSuccess:NSLocalizedString(@"分享成功", nil)];
//                        
//                    }
//                    [Tooles removeSSDWindowAction];
//                    
//                }];
            }
            else if ([sender.currentTitle isEqualToString:NSLocalizedString(@"Facebook", nil)]){
//                if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"fbauth2:"]]) {
                    /// 分享一个连接，但是不能跳转到app
//                    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc]init];
//                    content.contentURL = [NSURL URLWithString:wSelf.myShareUrlString];
//                    content.contentTitle = wSelf.myShareTitle;
//                    
//                    [[FBSDKShareDialog showFromViewController:currentVC.parentViewController
//                                                 withContent:content
//                                                    delegate:nil] setMode:FBSDKShareDialogModeNative];
//                    
//                }else{
//                    [ProgressHUD show:NSLocalizedString(@"请先安装Facebook客户端", nil) wait:NO delay:2.0f];
//                }
                
            }
            else if ([sender.currentTitle isEqualToString:NSLocalizedString(@"Twitter", nil)]){ //twitter
//                [ProgressHUD show:@"" wait:YES];
//                [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
//                    [ProgressHUD dismiss];
//                    if (error == nil) {
//                        TWTRComposer *com = [[TWTRComposer alloc]init];
//                        [com setURL:[NSURL URLWithString:wSelf.myShareUrlString]];
//                        [com setText:wSelf.myShareContent];
//                        [com showFromViewController:currentVC completion:^(TWTRComposerResult result) {
//                            if (result == TWTRComposerResultDone) {
//                                [ProgressHUD showSuccess:NSLocalizedString(@"分享成功", nil)];
//                            }else{
//                                [ProgressHUD showError:NSLocalizedString(@"分享失败", nil)];
//                            }
//                        }];
//                    }
//                }];
                
            }
        }];
        
        /// 分享按钮的位置
        button.frame = CGRectMake(shareScrollView.left + scrollViewWidth*i / self.shareTitlesArray.count, 35, scrollViewWidth/self.shareTitlesArray.count, 35);
        
        UILabel *nameL = [[UILabel alloc] init];
        nameL.text = dict[@"title"];
        nameL.textColor = [UIColor whiteColor];
        nameL.font = [UIFont systemFontOfSize:12];
        nameL.textAlignment = NSTextAlignmentCenter;
        nameL.backgroundColor = [UIColor clearColor];
        [shareScrollView addSubview:nameL];
        nameL.frame = CGRectMake(0, button.bottom + 5, button.width*2, 20);
        nameL.center = CGPointMake(button.centerX, nameL.centerY);
    }
}

/**
 *  弹出分享控件
 */
-(void)showShareView{
    //分享
    __weak typeof(self) wSelf = self;
    self.hidden = NO;
    self.shareView.alpha = 0;
    self.maskView.alpha = 0;
    self.shareView.frame = CGRectMake(0, kScreen_Height, kScreen_Width, 200);
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        wSelf.shareView.alpha = 1;
        wSelf.maskView.alpha = 0.6f;
        wSelf.shareView.frame = CGRectMake(0, kScreen_Height - 200, kScreen_Width, 200);
    } completion:^(BOOL finished) {
        
    }];
}
/**
 *  隐藏分享控件
 */
- (void)hide{
    __weak typeof(self) wSelf = self;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        wSelf.maskView.alpha = 0.0f;
        wSelf.shareView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        wSelf.hidden = YES;
    }];
}

/**
 *  更新分享控件的分享内容
 *
 *  @param title          标题
 *  @param content        内容
 *  @param urlString      点击后的跳转链接
 *  @param shareImage     图片UImage
 *  @param imageUrlString 图片的url 一般用不到
 */
-(void)updateShareTitle:(NSString *)title shareContent:(NSString *)content shareUrlString:(NSString *)urlString shareImage:(UIImage *)shareImage shareImageUrlString:(NSString *)imageUrlString{
    if (![title isEmptyString]) {
        self.myShareTitle = title;
    }
    if (![content isEmptyString]) {
        self.myShareContent = content;
    }
    if (![urlString isEmptyString]) {
        self.myShareUrlString = urlString;
    }
    if (![imageUrlString isEmptyString]) {
        self.myShareImageUrlString = imageUrlString;
    }
    if (shareImage != nil) {// UIImage
        self.myShareImage = shareImage;
    }
}

@end
