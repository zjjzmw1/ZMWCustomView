//
//  ApiMarco.h
//  ZMWCustomView
//
//  Created by speedx on 16/9/23.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#ifndef ApiMarco_h
#define ApiMarco_h

#if DEBUG
///debug模式下-----------------Begin--------------------------
#define kBase_URL       @"https://www.baidu.com/testApi"
#else
///release模式下---------------End--------------------------
#define kBase_URL       @"https://www.baidu.com.api"
#endif

// 高德导航的key
#define kGaodeKey       @"053b2a88943340fdbd39c86a37790f9d"

#endif /* ApiMarco_h */
