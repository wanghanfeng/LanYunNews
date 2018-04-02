//
//  Dog.m
//  HighLevelOC
//
//  Created by whf on 17/6/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Dog.h"
#import "People.h"

@implementation Dog

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString *)peopleName {
    return [self.master peopleName];
}

- (NSString *)dogName {
    return self.name;
}

@end
