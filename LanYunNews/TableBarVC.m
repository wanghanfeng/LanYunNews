//
//  TableBarVC.m
//  LanYunNews
//
//  Created by whf on 17/2/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TableBarVC.h"
#import "NaviVC.h"
#import "ViewController.h"
#import "NowHotVC.h"
#import "MineVC.h"



@interface TableBarVC ()
@property(strong, nonatomic) NaviVC *firstNaviVC;
@property(strong, nonatomic) NaviVC *secondNaviVC;
@end

@implementation TableBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NowHotVC *homeVC = [NowHotVC new];
    _firstNaviVC = [[NaviVC alloc] initWithRootViewController:homeVC];
    MineVC *mineVC = [MineVC new];
//    _secondNaviVC = [[NaviVC alloc] initWithRootViewController:mineVC];
    _secondNaviVC = [[NaviVC alloc] initWithRootViewController:mineVC];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    NSArray *viewControllsArr = [[NSArray alloc] initWithObjects:_firstNaviVC,_secondNaviVC, nil];
    
    [self setViewControllers:viewControllsArr animated:NO];
//    self.tabBar.items
    UIImage *homeNormal = [UIImage imageNamed:@"btn_home_normal"];
    UIImage *homeSelected = [UIImage imageNamed:@"btn_home_selected"];
    UIImage *userNormal = [UIImage imageNamed:@"btn_user_normal"];
    UIImage *userSelected = [UIImage imageNamed:@"btn_user_selected"];
    
    UITabBarItem *firstBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:homeNormal tag:1];
    firstBarItem.selectedImage = homeSelected;
    UITabBarItem *secondBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:userNormal tag:2];
    secondBarItem.selectedImage = userSelected;
    _firstNaviVC.tabBarItem = firstBarItem;
    _secondNaviVC.tabBarItem = secondBarItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
