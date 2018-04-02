//
//  ViewController.m
//  HighLevelOC
//
//  Created by whf on 17/6/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

#import "People.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setup];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    People *p1 = [People new];
    Dog *d1 = [Dog new];
    p1.ownDog = d1;
    d1.master = p1;
    p1.name = @"whf";
    d1.name = @"lxm";
    
    NSLog(@"people:%@",p1.peopleName);
    NSLog(@"dog:%@",d1.dogName);
}

- (void)showInfo {
    
}

@end
