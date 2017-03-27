//
//  AppDelegate.m
//  故事版
//
//  Created by dw on 16/9/20.
//  Copyright © 2016年 dw. All rights reserved.
//

#import "AppDelegate.h"
#import "Rooter.h"
#import "Player.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    NSMutableArray *players;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    players=[[NSMutableArray alloc]init];
    Rooter *root=[[Rooter alloc]init];
    
    Player *player=[[Player alloc]init];
    player.name=@"1";
    player.game=@"消消乐";
    UIImage *image11=[UIImage imageNamed:[NSString stringWithFormat:@"1StarsSamll.png"]];
    player.image=image11;
    [players addObject:player];
    
    player=[[Player alloc]init];
    player.name=@"2";
    player.game=@"泡泡龙";
    UIImage *image22=[UIImage imageNamed:[NSString stringWithFormat:@"1StarsSamll.png"]];
    player.image=image22;
    [players addObject:player];
    
    player=[[Player alloc]init];
    player.name=@"3";
    player.game=@"邓唯唯";
    UIImage *image33=[UIImage imageNamed:[NSString stringWithFormat:@"1StarsSamll.png"]];
    player.image=image33;
    [players addObject:player];
    root.players=players;
    
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:root];
    nav.title=@"Player";
    
    
    UIViewController *uiview=[[UIViewController alloc]init];
    uiview.title=@"Gesture";
    
    UITabBarController *tab=[[UITabBarController alloc] init];
    NSArray *array=[NSArray arrayWithObjects:nav,uiview,nil];
    tab.viewControllers =array;
    self.window.rootViewController=tab;
    self.window.backgroundColor=[UIColor whiteColor];
    // Override point for customization after application launch.
 
  

    return YES;
}
-(void)dealloc
{
    players=nil;
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
