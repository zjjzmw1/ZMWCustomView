//
//  SizeMarco.h
//  ZMWCustomView
//
//  Created by speedx on 16/9/23.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#ifndef SizeMarco_h
#define SizeMarco_h

#define kNavigation_Bar_Height 64.0f
#define kTabbar_Height                       49.0f
#define kScreen_Height [[UIScreen mainScreen] bounds].size.height
#define kScreen_Width [[UIScreen mainScreen] bounds].size.width

#define kCurrent_System_Version ([[UIDevice currentDevice] systemVersion])

#define kIS_IOS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO
#define kIS_IOS_8 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=8.0)?YES:NO
#define kIs_IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kIs_IPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kIs_IPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kIs_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kIs_IPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define kIs_IPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#endif /* SizeMarco_h */
