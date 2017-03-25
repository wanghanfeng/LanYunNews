//
//  MenuV.m
//  LanYunNews
//
//  Created by whf on 17/3/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MenuV.h"

@implementation MenuV

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:.65f alpha:.3f];
        [self addMenu];
    }
    return self;
}

- (void)addMenu{
    UIView *menuV = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-20, 67)];
    menuV.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.tag = 1;
    [btn1 setTitle:@"点我" forState:UIControlStateNormal];
    [btn1 setTitle:@"你点到了" forState:UIControlStateSelected];
    btn1.frame = CGRectMake(5, 10, 40, 40);
    [btn1 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnPressed:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)btnPressed:(id)sender {
    UIButton *btn = [self viewWithTag:1];
    if (btn == sender) {
        NSLog(@"%@",btn.titleLabel.text);
    }
}

@end
