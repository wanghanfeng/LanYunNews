//
//  SecondVC.m
//  LanYunNews
//
//  Created by whf on 17/3/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 44, 44);
    [self.view addSubview:button];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)btnPressed {
    if (self.superVC) {
        [self.superVC rightBtnPressed];
    }
//    NSBundle *bundle = [NSBundle ]
}

@end
