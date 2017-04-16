//
//  BDAppStatistics.m
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/10.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import "BDAppStatistics.h"
#import "BDAppStatisticsModel.h"
#import "BDAlertController.h"
#import "BDWebViewController.h"
#import "BDNetworkManager.h"
#import "MJExtension.h"
#import "Utilities.h"

static const NSString *gradeCommand = @"gradeCommand";
static const NSString *openUrlCommand = @"openUrlCommand";
static const NSString *clearCommand = @"clearCommand";

@interface BDAppStatistics()
@property (nonatomic, strong)UINavigationController *navigationController;
@end

@implementation BDAppStatistics

+ (instancetype)sharedInstance {
    static BDAppStatistics *appStatistics = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appStatistics = [[BDAppStatistics alloc] init];
    });
    return appStatistics;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)recordAppUseCountWithURL:(NSString *)urlString navigationController:(UINavigationController *)navigationController{
    self.navigationController = navigationController;
    NSDictionary *appInfoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [appInfoDic objectForKey:@"CFBundleShortVersionString"];
    
    PREP_BLOCK
    [[BDNetworkManager sharedInstance] getRequestWithURL:urlString responseType:ResponseTypeJSON completionBlock:^(BOOL success, id result) {
        BEGIN_BLOCK
        if (success) {
            NSError *error;
            NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:[self randomGenerateJSONData] options:NSJSONReadingMutableContainers error:&error];
            if (error) {
                NSLog(@"%@",error);
            } else {
                BDAppStatisticsModel *appStatisticsModel = [BDAppStatisticsModel readLocalAppStatisticsModel];
                if (appStatisticsModel.usedCount == nil) {
                    //初次使用
                    appStatisticsModel.usedCount = @"1";
                    appStatisticsModel.appVersion = appVersion;
                    appStatisticsModel.message = infoDic[@"message"];
                    appStatisticsModel.command = infoDic[@"command"];
                    appStatisticsModel.url = infoDic[@"url"];
                    appStatisticsModel.maxCount = infoDic[@"maxCount"];
                } else {
                    //更新json数据
                    NSInteger usedCount = [appStatisticsModel.usedCount integerValue] + 1;
                    appStatisticsModel.usedCount = [NSString stringWithFormat:@"%ld",(long)usedCount];
                    appStatisticsModel.message = infoDic[@"message"];
                    appStatisticsModel.command = infoDic[@"command"];
                    appStatisticsModel.url = infoDic[@"url"];
                    appStatisticsModel.maxCount = infoDic[@"maxCount"];
                }
                //app安装新版本
                if ([appStatisticsModel.appVersion isEqualToString:appVersion]) {
                } else {
                    appStatisticsModel.usedCount = @"0";
                    appStatisticsModel.neverShowMessageThisVersion = NO;
                    appStatisticsModel.appVersion = appVersion;
                }
                //提示框
                if ([appStatisticsModel.usedCount integerValue] >= [appStatisticsModel.maxCount integerValue] && !appStatisticsModel.neverShowMessageThisVersion) {
                    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
                    [BDAlertController showInViewController:rootVC title:@"提示" message:appStatisticsModel.message okHandlerBlock:^{
                        [self okBtnPressed];
                    } cancelHandlerBlock:^{
                        [self cancelBtnPressed];
                    }];
                }
                [BDAppStatisticsModel writeLocalAppStatisticsModel:appStatisticsModel];
            }
        } else {
            //网络请求失败 读取本地缓存
            BDAppStatisticsModel *appStatisticsModel = [BDAppStatisticsModel readLocalAppStatisticsModel];
            if (appStatisticsModel) {
                NSInteger usedCount = [appStatisticsModel.usedCount integerValue] + 1;
                appStatisticsModel.usedCount = [NSString stringWithFormat:@"%ld",(long)usedCount];
                if ([appStatisticsModel.appVersion isEqualToString:appVersion]) {
                } else {
                    appStatisticsModel.neverShowMessageThisVersion = NO;
                    appStatisticsModel.appVersion = appVersion;
                }
                if ([appStatisticsModel.usedCount integerValue] >= [appStatisticsModel.maxCount integerValue] && !appStatisticsModel.neverShowMessageThisVersion) {
                    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
                    [BDAlertController showInViewController:rootVC title:@"提示" message:appStatisticsModel.message okHandlerBlock:^{
                        [self okBtnPressed];
                    } cancelHandlerBlock:^{
                        [self cancelBtnPressed];
                    }];
                }
                [BDAppStatisticsModel writeLocalAppStatisticsModel:appStatisticsModel];
            }
        }
        END_BLOCK
    }];
}

- (NSData *)randomGenerateJSONData {
    NSDictionary *jsonDic = @{@"message":@"感谢您的使用，欢迎您对我们产品进行评价",@"command":openUrlCommand,@"url":@"https://www.baidu.com",@"maxCount":@"2"};
    return [jsonDic mj_JSONData];
}

- (void)handleCommand:(NSString *)command {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([command isEqualToString:gradeCommand]) {
            [self runGradeCommand];
        } else if ([command isEqualToString:openUrlCommand]) {
            [self runOpenUrlCommand];
        } else if ([command isEqualToString:clearCommand]) {
            [self runClearCommand];
        }
    });
}

- (void)runGradeCommand {
    //跳转到评价页面
    NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", self.appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
    NSLog(@"runGradeCommand");
}

- (void)runOpenUrlCommand {
    BDAppStatisticsModel *appStatisticsModel = [BDAppStatisticsModel readLocalAppStatisticsModel];
    BDWebViewController *webVC = [[BDWebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
    [webVC openURL:appStatisticsModel.url];
    NSLog(@"runOpenUrlCommand");
}

- (void)runClearCommand {
    [BDAppStatisticsModel clearLocalAppStatisticsModel];
    NSLog(@"runClearCommand");
}

- (void)cancelBtnPressed {
    BDAppStatisticsModel *appStatisticsModel = [BDAppStatisticsModel readLocalAppStatisticsModel];
    appStatisticsModel.neverShowMessageThisVersion = YES;
    [BDAppStatisticsModel writeLocalAppStatisticsModel:appStatisticsModel];
    
}

- (void)okBtnPressed {
    BDAppStatisticsModel *appStatisticsModel = [BDAppStatisticsModel readLocalAppStatisticsModel];
    [self handleCommand:appStatisticsModel.command];
}

@end
