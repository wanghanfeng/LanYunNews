//
//  AppDelegate.m
//  LanYunNews
//
//  Created by whf on 17/1/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TableBarVC.h"
#import "BDAppStatistics.h"

@interface AppDelegate ()
@property (nonatomic , strong)TableBarVC *rootVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _rootVC = [TableBarVC new];
    self.window.rootViewController = _rootVC;
    
    dispatch_queue_t queue;
    queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *fileName = [NSString stringWithFormat:@"%ld",[@"app launch" hash]];
        NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:absolutePath]) {
            NSString *launchCount = [NSString stringWithContentsOfFile:absolutePath encoding:NSUTF8StringEncoding error:nil];
            if (launchCount && launchCount.length) {
                NSInteger count = [launchCount integerValue];
                count ++;
                launchCount = [NSString stringWithFormat:@"%ld",count];
                NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:absolutePath];
                [fh writeData:[launchCount dataUsingEncoding:NSUTF8StringEncoding]];
                [fh closeFile];
            }
        } else {
            [fileManager createFileAtPath:absolutePath contents:[@"0" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
        }
    });
    
    [[BDAppStatistics sharedInstance] setAppID:@"123456"];
    [[BDAppStatistics sharedInstance] recordAppUseCountWithURL:@"http://v.juhe.cn/toutiao/index" navigationController:_rootVC.viewControllers[0]];
    
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
