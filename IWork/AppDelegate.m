//
//  AppDelegate.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "AppDelegate.h"
#import "ApplyViewController.h"
#import "CommunicateViewController.h"
#import "TodayViewController.h"
#import "DynamicViewController.h"
#import "MineViewController.h"
@interface AppDelegate ()
{
    UITabBarController * _tabVC;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    _tabVC = [[UITabBarController alloc] init];
    self.window.rootViewController = _tabVC;
    [self addTabbar];
    _tabVC.selectedIndex = 2;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark addTabBar
-(void)addTabbar
{
    ApplyViewController *applyVC=[[ApplyViewController alloc]init];
    applyVC.tabBarItem.title=@"应用中心";
    //applyVC.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
    //applyVC.tabBarItem.badgeValue=@"123";
    
    CommunicateViewController *communicateVC=[[CommunicateViewController alloc]init];
    communicateVC.tabBarItem.title=@"沟通";
    //         communicateVC.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
    
    TodayViewController *todayVC=[[TodayViewController alloc]init];
    todayVC.tabBarItem.title=@"";
    //         todayVC.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    
    DynamicViewController *dynamicVC=[[DynamicViewController alloc]init];
    UINavigationController *dynamicNav = [[UINavigationController alloc]initWithRootViewController:dynamicVC];
     dynamicNav.navigationBarHidden = YES;
    dynamicNav.tabBarItem.title=@"动态";
    //        dynamicVC.tabBarItem.image=[UIImage imageNamed:@"tab_me_nor"];
    MineViewController *myVC=[[MineViewController alloc]init];
    UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:myVC];
    myNav.navigationBarHidden = YES;
    myNav.title = @"我的";
    //        myVC.tabBarItem.image=[UIImage imageNamed:@"tab_me_nor"];
    _tabVC.viewControllers = @[applyVC,communicateVC,todayVC,dynamicNav,myNav];
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"IWork"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
