//
//  SettingBaseVC.m
//  LanYunNews
//
//  Created by whf on 17/3/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SettingBaseVC.h"

@interface SettingBaseVC ()

//保存宿主App的导航栏颜色
@property (nonatomic, strong) UIColor *shellNavibackgroundColor;
//保存宿主App的下方横线状态
@property (nonatomic, assign) BOOL naviBarHairlineImageViewIsHidden;

@end

@implementation SettingBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavi];
    
    self.shellNavibackgroundColor = self.navigationController.navigationBar.barTintColor;
    UIImageView *naviBarHairlineImageView = [self getHairlineImageView:self.navigationController.navigationBar];
    self.naviBarHairlineImageViewIsHidden = naviBarHairlineImageView.hidden;
    
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    naviBarHairlineImageView.hidden = YES;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnPressed)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)dealloc {
    NSLog(@"%@---free",NSStringFromClass([self class]));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.navigationController.viewControllers indexOfObject:self] != NSNotFound) {
        return;
    }
//    //恢复
//    self.navigationController.navigationBar.barTintColor = self.shellNavibackgroundColor;
//    UIImageView *naviBarHairlineImageView = [self getHairlineImageView:self.navigationController.navigationBar];
//    naviBarHairlineImageView.hidden = self.naviBarHairlineImageViewIsHidden;
}

- (UIImageView *)getHairlineImageView:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self getHairlineImageView:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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

- (void)leftBtnPressed {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"left pressed!");
    //恢复
    self.navigationController.navigationBar.barTintColor = self.shellNavibackgroundColor;
    UIImageView *naviBarHairlineImageView = [self getHairlineImageView:self.navigationController.navigationBar];
    naviBarHairlineImageView.hidden = self.naviBarHairlineImageViewIsHidden;
}

@end
