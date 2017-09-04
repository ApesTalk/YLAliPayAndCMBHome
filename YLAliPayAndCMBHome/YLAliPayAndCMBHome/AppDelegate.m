//
//  AppDelegate.m
//  YLAliPayAndCMBHome
//
//  Created by Lambert on 2017/8/7.
//  Copyright © 2017年 YL. All rights reserved.
//

#import "AppDelegate.h"
#import "YLNavigationController.h"
#import "YLAlipayHomeController.h"
#import "YLCMBHomeVController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabController = [[UITabBarController alloc]init];
    YLAlipayHomeController *home0 = [[YLAlipayHomeController alloc]init];
    YLNavigationController *nav0 = [[YLNavigationController alloc]initWithRootViewController:home0];
    nav0.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"支付宝" image:nil tag:0];
    YLCMBHomeVController *home1 = [[YLCMBHomeVController alloc]init];
    YLNavigationController *nav1 = [[YLNavigationController alloc]initWithRootViewController:home1];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"招行" image:nil tag:1];
    tabController.viewControllers = @[nav0, nav1];
    self.window.rootViewController = tabController;
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
