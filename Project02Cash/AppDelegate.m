//
//  AppDelegate.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "AppDelegate.h"
#import "Page1ViewController.h"
#import "Page2ViewController.h"
#import "Page3ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    //设置文字选中和不选中的颜色设置
    [[UITabBar appearance]setTintColor:[UIColor colorWithRed:192/255.0 green:38/255.0 blue:40/255.0 alpha:1.00]];
    [[UITabBar appearance]setUnselectedItemTintColor:[UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1.00]];

    
    Page1ViewController *page1VC = [[Page1ViewController alloc]init];
    Page2ViewController *page2VC = [[Page2ViewController alloc]init];
    Page3ViewController *page3VC = [[Page3ViewController alloc]init];
    
    [tabBarController setViewControllers:[NSArray arrayWithObjects:page1VC,page2VC,page3VC, nil]];
    __weak typeof(self)weakSelf = self;
//    NSTimer *timer = [NSTimer timerWithTimeInterval:10.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        __strong typeof(self)strongSelf = weakSelf;
//        [page1VC removeFromParentViewController];
//        Page1ViewController *page1VC = [[Page1ViewController alloc]init];
//        [tabBarController setViewControllers:[NSArray arrayWithObjects:page1VC,page2VC,page3VC, nil]];
//    }];
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    //tabbar字体颜色设置
    [navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)applicationWillResignActive:(UIApplication *)application{}
-(void)applicationDidEnterBackground:(UIApplication *)application{}
-(void)applicationWillEnterForeground:(UIApplication *)application{}
-(void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}


@end
