//
//  AppDelegate.m
//  ZMWCustomView
//
//  Created by xiaoming on 16/6/24.
//  Copyright © 2016年 shandandan. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"      // 跟视图
#import <MapKit/MapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>         // 高德导航测试
#import "ApiMarco.h"

@interface AppDelegate ()


@property (strong, nonatomic) CLLocationManager *locManager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 在这里显示在 General 里面 Hide status bar 勾选上。启动的时候就不会显示了。
    application.statusBarHidden = NO;
    // 测试定位
    [self testLocationAction];
    // 测试高德导航
    [self gaodeNaviAction];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    
    HomeViewController *vc = [[HomeViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navi;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 测试定位
-(void)testLocationAction {
    self.locManager = [[CLLocationManager alloc] init];
    [self.locManager stopMonitoringSignificantLocationChanges];
    [self.locManager stopUpdatingLocation];
    [self.locManager stopMonitoringVisits];
    [self.locManager stopUpdatingHeading];
}

#pragma mark - 测试高德导航
- (void)gaodeNaviAction {
    [AMapServices sharedServices].apiKey = kGaodeKey;
}


@end
