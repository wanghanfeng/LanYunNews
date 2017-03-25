//
//  ScorllBar.m
//  LanYunNews
//
//  Created by whf on 17/2/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ScorllBar.h"

//static float width = 60;

@implementation ScorllBar{
    float width,height;
    NSArray *typeName;
    NSArray *typeEName;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.scrollEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        height = 30;
        width = 60;
    }
    typeName = [[NSArray alloc] initWithObjects:@"头条",@"社会",@"国内",@"国际",@"科技",@"时尚",nil];
    typeEName = [[NSArray alloc] initWithObjects:@"top",@"shehui",@"guonei",@"guoji",@"keji",@"shishang",nil];
    NSArray *items = [NSArray arrayWithArray:typeName];
    [self setItems:items];
    return self;
}



- (void)setItems:(NSArray *)items{
    if (!items || items.count<1) {
        return;
    }
    NSArray *itemsArr = items.copy;
    for (int i=0; i<itemsArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:items[i] forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor redColor];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(width*i, 0, width, height);
        button.tag = i;
        [button addTarget:self action:@selector(itemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    self.contentSize = CGSizeMake(itemsArr.count*width, height);
}

- (void)itemDidClicked:(UIButton *)button{
    NSString *title = button.titleLabel.text;
    NSLog(@"%@", title);
    
    [_superVC setNewsType:typeEName[button.tag]];
}

@end
