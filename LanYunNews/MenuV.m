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
    menuV.tag = 2;
    menuV.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.tag = 1;
    [btn1 setTitle:@"点我" forState:UIControlStateNormal];
    [btn1 setTitle:@"你点到了" forState:UIControlStateHighlighted];
    btn1.frame = CGRectMake(5, 10, 60, 40);
    [menuV addSubview:btn1];
    [self addSubview:menuV];
    [btn1 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskTap:)];
    [self addGestureRecognizer:tapGestureRecognizer];
    [menuV addGestureRecognizer:tapGestureRecognizer];
    
    [self printResponder:self];
    [self printResponder:menuV];
    [self printResponder:btn1];
}

- (void)printResponder:(id)sender {
    if ([sender isKindOfClass:[UIResponder class]]) {
        Class class = [sender class];
        BOOL isFirstResponder = ((UIResponder *)sender).isFirstResponder;
        NSLog(@"%@ isFirstResponder : %@",NSStringFromClass(class),isFirstResponder?@"Yes":@"No");
        BOOL userInteractionEnabled = ((UIView *)sender).userInteractionEnabled;
        NSLog(@"%@ userInteractionEnabled : %@",NSStringFromClass(class),userInteractionEnabled?@"Yes":@"No");
        return;
    }
}

- (void)btnPressed:(id)sender {
    UIButton *btn = [self viewWithTag:1];
    if (btn == sender) {
        NSLog(@"%@",btn.titleLabel.text);
    }
//    else {
//        [self removeFromSuperview];
//    }
}

- (void)maskTap:(UITapGestureRecognizer *)sender {
    UIView *menuV = [self viewWithTag:2];
    if (menuV == sender.view) {
        return;
    }
    [self removeFromSuperview];
}
@end
