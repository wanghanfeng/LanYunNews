//
//  HFReachabilityManager.m
//  LanYunNews
//
//  Created by whf on 17/1/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HFReachabilityManager.h"



@implementation HFReachabilityManager

@synthesize internetReach;

static HFReachabilityManager *_reachabilityManager = nil;

- (void)reachabilityChanged:(NSNotification*)note {
    
    Reachability* curReach = [note object];
    //	NSParameterAssert([curReach isKindOfClass:[Reachability class]]); // TReachability? wtf? since YummyDiary v1.1.0 13-04-27
    NSParameterAssert([curReach respondsToSelector:@selector(currentReachabilityStatus)]);
    
}

+ (id)alloc {
    @synchronized([HFReachabilityManager class]) {
        NSAssert(_reachabilityManager == nil, @"Attempted to allocate a second instance of a singleton.");
        _reachabilityManager = [super alloc];
        return _reachabilityManager;
    }
    return nil;
}

- (id)init {
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        
        self.internetReach = [Reachability reachabilityForInternetConnection];
        [internetReach startNotifier];
    }
    return self;
}

+ (HFReachabilityManager *)sharedReachabilityManager {
    @synchronized([HFReachabilityManager class]) {
        if (!_reachabilityManager) {
            [[self alloc] init];
        }
        return _reachabilityManager;
    }
    return nil;
}

- (NetworkStatus)currentReachabilityStatus {
    return internetReach.currentReachabilityStatus;
}


@end
