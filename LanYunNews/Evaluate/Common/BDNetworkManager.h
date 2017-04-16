//
//  BDNetworkManager.h
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/11.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDNetworkManager : NSObject

typedef NS_ENUM(NSUInteger, responseType) {
    ResponseTypeJSON,
    ResponseTypeXML,
    ResponseTypeDATA,
};

+ (instancetype)sharedInstance;
- (NSURLSessionDataTask *)getRequestWithURL:(NSString *)urlString responseType:(responseType)responseType completionBlock:(void (^)(BOOL success, id result))block;

@end
