//
//  BDAppStatistics.h
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/10.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BDAppStatistics : NSObject

@property (nonatomic, copy)NSString *appID;

+ (instancetype)sharedInstance;
- (void)recordAppUseCountWithURL:(NSString *)urlString navigationController:(UINavigationController *)navigationController;
@end
