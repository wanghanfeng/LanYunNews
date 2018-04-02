//
//  Dog.h
//  HighLevelOC
//
//  Created by whf on 17/6/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class People;

@interface Dog : NSObject

@property (nonatomic, strong)People *master;
@property (nonatomic, copy)NSString *name;

- (NSString *)peopleName;
- (NSString *)dogName;

@end
