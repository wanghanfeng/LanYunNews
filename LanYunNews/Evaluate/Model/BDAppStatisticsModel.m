//
//  BDAppStatisticsModel.m
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/10.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import "BDAppStatisticsModel.h"
#import "MJExtension.h"
#import "NSDictionary+BDTranformToString.h"

@implementation BDAppStatisticsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSDictionary *)convertDictionary {
    NSDictionary *dictionary = @{@"usedCount":self.usedCount,@"maxCount":self.maxCount,@"message":self.message,@"appVersion":self.appVersion,@"command":self.command,@"url":self.url,@"neverShowMessageThisVersion":[NSNumber numberWithBool:self.neverShowMessageThisVersion]};
    return dictionary;
}

+ (BDAppStatisticsModel *)readLocalAppStatisticsModel {
    NSString *infoPath = [NSString stringWithFormat:@"%lu",(unsigned long)[BDAppStatisticsIdentifier hash]];
    infoPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:infoPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:infoPath]) {
        BDAppStatisticsModel *appStatisticsModel = [BDAppStatisticsModel mj_objectWithFile:infoPath];
        return appStatisticsModel;
    } else {
        return [[BDAppStatisticsModel alloc] init];
    }
}

+ (void)writeLocalAppStatisticsModel:(BDAppStatisticsModel *)appStatisticsModel {
    NSString *infoPath = [NSString stringWithFormat:@"%lu",(unsigned long)[BDAppStatisticsIdentifier hash]];
    infoPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:infoPath];
    [[appStatisticsModel convertDictionary] writeToFile:infoPath atomically:YES];
    NSLog(@"%@",[[appStatisticsModel convertDictionary] bd_tranformToNSString]);
}

+ (void)clearLocalAppStatisticsModel {
     NSString *infoPath = [NSString stringWithFormat:@"%lu",(unsigned long)[BDAppStatisticsIdentifier hash]];
    [[NSFileManager defaultManager] removeItemAtPath:infoPath error:nil];
}

@end
