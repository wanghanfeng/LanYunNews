//
//  People.h
//  HighLevelOC
//
//  Created by whf on 17/6/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@interface People : NSObject

@property (nonatomic, weak)Dog *ownDog;
@property (nonatomic, copy)NSString *name;

- (NSString *)peopleName;
- (NSString *)dogName;

@end
