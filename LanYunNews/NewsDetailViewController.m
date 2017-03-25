//
//  NewsDetailViewController.m
//  LanYunNews
//
//  Created by whf on 17/1/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIButton *btn;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"dasdas";
    UIButton *btnn = [UIButton buttonWithType:UIButtonTypeSystem];
    btnn.frame = CGRectMake(0, 0, 30, 30);
//    [btnn setTitle:@"wanghanfeng" forState:UIControlStateNormal]; 
    self.navigationItem.titleView = btnn;
    
//    UIViewController *tabBarVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//    tabBarVC.tabBar.hidden = YES;
    
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    
//    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    rootVC.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    

    self.hidesBottomBarWhenPushed = YES;
    
    _btn = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn.frame = CGRectMake(0, 100, 50, 30);
    [_btn setTitle:@"点我" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc
{
    NSLog(@"**********************%s*************",__func__);
}

- (void)setNewsURL:(NSString *)URL{
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    //    NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    
    self.webView.backgroundColor = [UIColor clearColor];
    // UIWebView 滚动的比较慢，这里设置为正常速度
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    NSURL *htmlURL = [NSURL URLWithString:URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

#pragma mark - webDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}


@end
