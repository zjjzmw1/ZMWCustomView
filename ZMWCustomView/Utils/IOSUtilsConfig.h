//
//  IOSUtilsConfig.h
//  zhangmingwei
//
//  Created by xiaoming on 14-3-11.
//  Copyright (c) 2014年 zhangmingwei. All rights reserved.


#if DEBUG
///debug模式下-----------------Begin--------------------------
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define kBase_URL @"https://www.baidu.com/testApi"
#else
///release模式下---------------End--------------------------
#define NSLog(tmt, ...)
#define kBase_URL @"https://www.baidu.com.api"
#endif

/*-----------------------------------常用的方法--------------------------------------------*/
#define kNavigation_Bar_Height 64.0f
#define kTabbar_Height                       49.0f
#define kScreen_Height [[UIScreen mainScreen] bounds].size.height
#define kScreen_Width [[UIScreen mainScreen] bounds].size.width

#define kAnimation_Time 0.3f
#define kCurrent_System_Version ([[UIDevice currentDevice] systemVersion])
#define kDegrees_To_Radian(x) (M_PI * (x) / 180.0)
#define kRadian_To_Degrees(radian) (radian*180.0)/(M_PI)
#define kIS_IOS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO
#define kIS_IOS_8 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=8.0)?YES:NO
#define kIs_IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kIs_IPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kIs_IPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kIs_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kIs_IPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define kIs_IPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

