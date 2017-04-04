//
//  UserSettingVC.m
//  LanYunNews
//
//  Created by whf on 17/3/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UserSettingVC.h"
#import "MenuV.h"
#import "SecondVC.h"

@interface UserSettingVC ()
@property (nonatomic,strong)UIImageView *imageV;
@end

@implementation UserSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 44, 44)];
    self.imageV.image = [UIImage imageNamed:@"btn_user_selected"];
    [self.view addSubview:self.imageV];
    
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
    SecondVC *secondVC = [[SecondVC alloc] init];
    secondVC.superVC = self;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)rightBtnPressed{
//    MenuV *menuV = [[MenuV alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:menuV];
    
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 0.8;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = ULLONG_MAX;
    [self.imageV.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
