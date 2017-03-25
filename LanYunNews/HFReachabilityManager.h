//
//  HFReachabilityManager.h
//  LanYunNews
//
//  Created by whf on 17/1/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Reachability.h"

@interface HFReachabilityManager : NSObject {
    Reachability *internetReach;
}

@property (nonatomic, strong) Reachability *internetReach;

+ (HFReachabilityManager *)sharedReachabilityManager;

- (NetworkStatus)currentReachabilityStatus;

@end
