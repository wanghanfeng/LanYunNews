//
//  BDAlertController.h
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/11.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilities.h"

@interface BDAlertController : UIAlertController

+ (void)showInViewController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message okHandlerBlock:(void (^)(void))okHandlerBlock cancelHandlerBlock:(void (^)(void))cancelHandlerBlock;

@end
