//
//  SettingBaseVC.m
//  LanYunNews
//
//  Created by whf on 17/3/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SettingBaseVC.h"

@interface SettingBaseVC ()

@end

@implementation SettingBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavi];
}

- (void)dealloc {
    NSLog(@"%@---free",NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setNavi {
    UINavigationItem *navigationItem = self.navigationItem;
    [navigationItem setRightBarButtonItem:[self rightBtn]];
}

- (UIBarButtonItem *)rightBtn {
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_user_selected"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnPressed)];
    return rightBtn;
}

- (void)rightBtnPressed {
    NSLog(@"pressed！");
}

@end
