//
//  ScorllBar.h
//  LanYunNews
//
//  Created by whf on 17/2/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NowHotVC.h"

@interface ScorllBar : UIScrollView

@property(nonatomic,weak)  NowHotVC *superVC;
- (void)setItems:(NSArray *) items;

@end
