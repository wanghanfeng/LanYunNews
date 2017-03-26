//
//  UserSettingVC.m
//  LanYunNews
//
//  Created by whf on 17/3/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UserSettingVC.h"
#import "MenuV.h"

@interface UserSettingVC ()

@end

@implementation UserSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)rightBtnPressed{
    MenuV *menuV = [[MenuV alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:menuV];
}

@end
