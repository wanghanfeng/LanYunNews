//
//  AppInfoVC.m
//  LanYunNews
//
//  Created by whf on 17/4/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AppInfoVC.h"

@interface AppInfoVC ()

@end

@implementation AppInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLB = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    titleLB.text = @"App 启动次数:";
    
    UILabel *countLB = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 100, 40)];
    countLB.tag = 1001;
    
    [self.view addSubview:titleLB];
    [self.view addSubview:countLB];
    
    static dispatch_queue_t queue;
    queue = dispatch_queue_create("com.whf", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *fileName = [NSString stringWithFormat:@"%ld",[@"app launch" hash]];
        NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:absolutePath]) {
            NSString *launchCount = [NSString stringWithContentsOfFile:absolutePath encoding:NSUTF8StringEncoding error:nil];
            if (launchCount && launchCount.length) {
                [self setLaunchCount:launchCount];
            }
        }
    });
}

- (void)setLaunchCount:(NSString *)count {
    UILabel *countLB = [self.view viewWithTag:1001];
    if (countLB) {
        countLB.text = count;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
