//
//  BDAppStatisticsModel.h
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/10.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const BDAppStatisticsIdentifier = @"BDAppStatisticsIdentifier";

@interface BDAppStatisticsModel : NSObject

@property (nonatomic, copy)NSString *usedCount;
@property (nonatomic, copy)NSString *maxCount;
@property (nonatomic, copy)NSString *message;
@property (nonatomic, copy)NSString *appVersion;
@property (nonatomic, copy)NSString *command;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, assign)BOOL neverShowMessageThisVersion;

+ (BDAppStatisticsModel *)readLocalAppStatisticsModel;
+ (void)writeLocalAppStatisticsModel:(BDAppStatisticsModel *)appStatisticsModel;
+ (void)clearLocalAppStatisticsModel;
- (NSDictionary *)convertDictionary;

@end
