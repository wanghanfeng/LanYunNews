//
//  MenuV.m
//  LanYunNews
//
//  Created by whf on 17/3/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MenuV.h"
#import "Masonry.h"

@interface MenuV()
@end

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
//    UIView *menuV = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-20, 67)];
    UIView *menuV = [[UIView alloc] init];
    menuV.tag = 2;
    menuV.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.tag = 1;
    [btn1 setTitle:@"点我" forState:UIControlStateNormal];
    [btn1 setTitle:@"你点到了" forState:UIControlStateHighlighted];
    btn1.frame = CGRectMake(5, 10, 60, 40);
    [btn1 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIView *maskV = [[UIView alloc] initWithFrame:self.bounds];
    
//    [menuV addSubview:btn1];
    [self addSubview:maskV];
    [self addSubview:menuV];
    
    [menuV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(-67);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(67);
    }];
    [menuV.superview layoutIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [menuV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.left.mas_equalTo(self.mas_left).offset(10);
            make.right.mas_equalTo(self.mas_right).offset(-10);
            make.height.mas_equalTo(67);
        }];
        [menuV.superview layoutIfNeeded];
    }];

//    [menuV mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.mas_top);
//    }];
//    [menuV.superview layoutIfNeeded];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskTap:)];
    UITapGestureRecognizer *menuVTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuVTap)];
//    [self addGestureRecognizer:tapGestureRecognizer];
//    [menuV addGestureRecognizer:tapGestureRecognizer];
    
    //问题所在：GestureRecognizer 绑定手势事件，并传递给当前View和所有子View
    
    [maskV addGestureRecognizer:tapGestureRecognizer];
    [menuV addGestureRecognizer:menuVTap];
    
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

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"x:%f , y:%f",point.x,point.y);
    return [super hitTest:point withEvent:event];
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

- (void)menuVTap {
    NSLog(@"menuVTap!");
}

- (void)maskTap:(UITapGestureRecognizer *)sender {
//    UIView *menuV = [self viewWithTag:2];
//    if (menuV == sender.view) {
//        return;
//    }
    [self removeFromSuperview];
}
@end
