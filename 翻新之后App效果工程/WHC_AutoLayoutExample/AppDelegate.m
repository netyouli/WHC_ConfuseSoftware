//
//  AppDelegate.m
//  Github <https://github.com/netyouli/WHC_AutoLayoutKit>
//
//  Created by 吴海超 on 16/2/17.
//  Copyright © 2016年 吴海超. All rights reserved.
//

//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import "AppDelegate.h"
#import "UnflappableHeinousController.h"

@interface AppDelegate ()


 /// my attr start
@property(nonatomic, assign)Boolean  talent;
@property(nonatomic, assign)int  endures_warship;
@property(nonatomic, copy)NSString *  dormitory_qualm_cabin;
@property(nonatomic, copy)NSArray *  gabble_munition;
@property(nonatomic, assign)float  immature_festal;
@property(nonatomic, assign)long  exigent_vocation_disclosure;
@property(nonatomic, copy)NSString *  reporter;
@property(nonatomic, assign)int  responsive_dictator_wage;
@property(nonatomic, strong)UITableView *  misdirect;
@property(nonatomic, assign)double  locust_penurious;
@property(nonatomic, assign)CGFloat  provided_effective_injure;
@property(nonatomic, strong)UITableView *  important_dimension_peck;
@property(nonatomic, strong)UIScrollView *  conservatism_snowdrift;
@property(nonatomic, assign)int  parking;
@property(nonatomic, assign)float  choice_timid;
@property(nonatomic, strong)UITableView *  centimeter;
@property(nonatomic, strong)UIView *  half_baked_broil_unthreatening;
@property(nonatomic, assign)int  aluminum_fleeting_nonsensical;
@property(nonatomic, copy)NSArray *  cruel_homogeneity_sidereal;
@property(nonatomic, assign)NSInteger  unaffected_liberate_addle;

/// my attr end
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController * rootNC = [[UINavigationController alloc] initWithRootViewController:[UnflappableHeinousController new]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UINavigationBar appearance].barTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = rootNC;
    [_window makeKeyAndVisible];
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
