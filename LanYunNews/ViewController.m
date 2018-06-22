//
//  ViewController.m
//  LanYunNews
//
//  Created by whf on 17/1/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *lable = [UILabel new];
    lable.text = @"dasdas";
    lable.frame = self.view.bounds;
    
    [self.view addSubview:lable];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
