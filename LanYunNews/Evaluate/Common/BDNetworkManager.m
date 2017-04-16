//
//  BDNetworkManager.m
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/11.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import "BDNetworkManager.h"
#import "AFNetworking.h"

@interface BDNetworkManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation BDNetworkManager

+ (instancetype)sharedInstance {
    static BDNetworkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BDNetworkManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [[self class] acceptableContentTypes];
        
    }
    return self;
}

+ (NSSet *)acceptableContentTypes {
    return [NSSet setWithArray:@[@"application/json",
                                 @"text/html",
                                 @"text/json",
                                 @"text/plain",
                                 @"text/javascript",
                                 @"text/xml",
                                 @"image/*"]];
}

- (NSURLSessionDataTask *)getRequestWithURL:(NSString *)urlString responseType:(responseType)responseType completionBlock:(void (^)(BOOL success, id result))block {
    //判断返回类型
    switch (responseType) {
        case ResponseTypeJSON:
            self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ResponseTypeXML:
            self.manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case ResponseTypeDATA:
            self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    NSURLSessionDataTask *task = [self.manager GET:urlString
                                        parameters:nil
                                          progress:^(NSProgress * _Nonnull downloadProgress) {
                                              
                                          } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                              if (block) {
                                                  block(YES,responseObject);
                                              }
                                          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                              if (block) {
                                                  block(NO, error);
                                              }
                                          }];
    return task;
}

@end
