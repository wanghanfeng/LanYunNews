//
//  BDWebViewController.m
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/11.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#import "BDWebViewController.h"

@interface BDWebViewController ()

@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, copy)NSString *urlString;

@end

@implementation BDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    [self openURL:self.urlString];
}

- (void)openURL:(NSString *)urlString {
    self.urlString = urlString;
    NSURL *url = [NSURL URLWithString:urlString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
