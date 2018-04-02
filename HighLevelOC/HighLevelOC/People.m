//
//  People.m
//  HighLevelOC
//
//  Created by whf on 17/6/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "People.h"
#import "Dog.h"

@implementation People

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString *)peopleName {
    return self.name;
}

- (NSString *)dogName {
    return [self.ownDog dogName];
}

@end
