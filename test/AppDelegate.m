//
//  AppDelegate.m
//  test
//
//  Created by sven on 16/10/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "AppDelegate.h"
#import "SVFirstViewController.h"
#import "SVSecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    SVFirstViewController *vc1 = [[SVFirstViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    UITabBarItem *item1 = [[UITabBarItem alloc]init];
    item1.title = @"tab1";
    item1.image = [UIImage imageNamed:@"iPhone_患者端首页_医院_未选中"];
    
    nav1.tabBarItem = item1;//
    
    SVSecondViewController *vc2 = [[SVSecondViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    UITabBarItem *item2 = [[UITabBarItem alloc]init];
    item2.title = @"tab2";
    item2.image = [UIImage imageNamed:@"iPhone_患者端首页_医院_未选中"];
    
    nav2.tabBarItem = item2;
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    self.window.rootViewController = tab;
    tab.viewControllers = @[nav1, nav2];
    
    [self.window makeKeyAndVisible];
    
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

@end
