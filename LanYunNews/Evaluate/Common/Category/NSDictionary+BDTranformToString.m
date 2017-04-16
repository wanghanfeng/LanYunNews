//
//  NSDictionary+BDTranformToString.m
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/11.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import "NSDictionary+BDTranformToString.h"

@implementation NSDictionary (BDTranformToString)

- (NSString *)bd_tranformToNSString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (string && !error) {
        return string;
    }
    return nil;
}

@end
