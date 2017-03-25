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
    
//    AFHTTPSessionManager *AFseManager = [AFHTTPSessionManager manager];
//    
//    AFseManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    AFseManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
        

//    [AFseManager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *content = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSDictionary *jsonCode = [NSString parseJSONStringToNSDictionary:content];
//        NSLog(@"AF success: ----------%@",[jsonCode valueForKey:@"code"]);
//        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
//        //        获得相应头
//        NSDictionary *allHeaders = response.allHeaderFields;
//        //        取到cookie得参数
//        NSLog(@"%@",[[allHeaders valueForKey:@"Set-Cookie"] substringToIndex:43]);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"AF fail: ----------%@",error);
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
