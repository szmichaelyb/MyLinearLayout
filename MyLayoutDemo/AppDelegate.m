//
//  AppDelegate.m
//  MyLayout
//
//  Created by oybq on 15/6/13.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MyLayout.h"


@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)opts
{
    /// 默认的布局视图的padding是会叠加安全区的值的，因此你可以在这里设置为UIRectEdgeNone，让所有布局视图的padding不叠加安全区。
    /// MyBaseLayout.appearance.insetsPaddingFromSafeArea = UIRectEdgeNone;
    /// this place add the ui template size dime
    [MyDimeScale setUITemplateSize:CGSizeMake(375, 667)];
        
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
        
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
        
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)app {}
- (void)applicationDidEnterBackground:(UIApplication *)app {}
- (void)applicationWillEnterForeground:(UIApplication *)app {}
- (void)applicationDidBecomeActive:(UIApplication *)app {}
- (void)applicationWillTerminate:(UIApplication *)app {}

@end
