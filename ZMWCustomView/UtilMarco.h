//
//  UtilMarco.h
//  ZMWCustomView
//
//  Created by speedx on 16/9/23.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#ifndef UtilMarco_h
#define UtilMarco_h

#import "SizeMarco.h"
#import "ApiMarco.h"
#import "PathMarco.h"

#if DEBUG
///debug模式下-----------------Begin--------------------------
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
///release模式下---------------End--------------------------
#define NSLog(tmt, ...)
#endif

#define kAnimation_Time 0.3f
#define kDegrees_To_Radian(x) (M_PI * (x) / 180.0)
#define kRadian_To_Degrees(radian) (radian*180.0)/(M_PI)


/// -----------------------------字符串、Number 保护-------------------------BEGIN
#define kSafe_Get_String(presence, key) \
([presence objectForKey: key] != nil && [presence objectForKey: key] != [NSNull null]) && [[presence objectForKey: key] isKindOfClass:[NSString class]] && ![[presence objectForKey: key] isEqualToString:@"null"] && ![[presence objectForKey: key] isEqualToString:@"<null>"] ? [presence objectForKey: key] : @"" \

#define kSaft_Get_Number(presence, key)  \
([presence objectForKey: key] != nil && [presence objectForKey: key] != [NSNull null]) ? [presence objectForKey: key] : @0 \
/// -----------------------------字符串、Number 保护-------------------------END


#pragma mark - 单例化一个类 instanceMothed:单例的方法名称

#define instance_interface(className, instanceMothed)   \
\
+(instancetype)instanceMothed;

//实现方法
#define instance_implementation(className, instanceMothed)   \
\
static className *_instance;\
\
+(instancetype)instanceMothed\
{   static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc]init];\
});\
return _instance;\
}\
\
+(id)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
return _instance;\
}




#endif /* UtilMarco_h */
