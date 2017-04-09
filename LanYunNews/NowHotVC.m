//
//  NowHotVC.m
//  LanYunNews
//
//  Created by whf on 17/1/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NowHotVC.h"

#import "MJRefresh.h"
#import "Masonry.h"
#import "HFNK.h"
#import "NSString+JSON.h"
#import "ItemTableCell.h"
#import "NewsDetailViewController.h"
#import "ScorllBar.h"


@interface NowHotVC ()<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic)  UITableView *NewItemTB;
@property (strong, nonatomic)  ScorllBar *scrollBar;

@property (strong, nonatomic) NSDictionary *jsonData;
@property (strong, nonatomic) NSArray *newsData;
@property (strong, nonatomic) NSString *newsType;

@end

@implementation NowHotVC

-(instancetype)init{
    self = [super init];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //默认科技
    _newsType = @"keji";
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.NewItemTB.delegate = self;
    self.NewItemTB.dataSource = self;
    
    
    self.NewItemTB.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshData:_newsType];
    }];
//    _NewItemTB.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        [self getMoreData];
//    }];
    
    
    
    UINib *cellNib1 = [UINib nibWithNibName:@"ItemTableCell" bundle:nil];
    [_NewItemTB registerNib:cellNib1 forCellReuseIdentifier:@"ItemTableCell"];
    
    [self.NewItemTB.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (ScorllBar *)scrollBar{
    if (!_scrollBar) {
        _scrollBar = [ScorllBar new];
        _scrollBar.superVC = self;
        [self.view addSubview:_scrollBar];
        [_scrollBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top);
            make.right.equalTo(self.view.mas_right);
            make.left.equalTo(self.view.mas_left);
            make.height.equalTo(@30);
        }];
    }
    return _scrollBar;
}
- (UITableView *)NewItemTB{
    if (!_NewItemTB) {
        
        _NewItemTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 1, 1) style:UITableViewStylePlain];
        NSInteger tabBarHeight = self.tabBarController.tabBar.bounds.size.height;
        [self.view addSubview:_NewItemTB];
        [_NewItemTB mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.scrollBar.mas_bottom);
            make.top.equalTo(self.scrollBar.mas_bottom);
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom).offset(-tabBarHeight);
        }];
        
    }
    return _NewItemTB;
}

-(void)setNewsType:(NSString *)type{
    _newsType = type;
    [self.NewItemTB.mj_header beginRefreshing];
}

- (void)refreshData:(NSString *)type{
    _newsType = type;
    //      设置服务器地址
    NSString *url = @"https://v.juhe.cn/toutiao/index";
    NSDictionary *parameter = @{@"type":_newsType,@"key":@"9b36e7f06020e794a3547c5718bc114c"};
    
    [HFNK getWithUrl:url parameter:parameter httpHeader:NULL responseType:ResponseTypeJSON success:^(id result) {
        _jsonData = result;
        
        _newsData = [[_jsonData valueForKey:@"result"] valueForKey:@"data"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_NewItemTB reloadData];
        });
        [self.NewItemTB.mj_header endRefreshing];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
        [self.NewItemTB.mj_header endRefreshing];
    }];
}

- (void)getMoreData{
    
}

#pragma mark - delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsData.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    NSString *title,*imgURL;
    
    title = [_newsData[indexPath.row] valueForKey:@"title"];
    imgURL = [_newsData[indexPath.row] valueForKey:@"thumbnail_pic_s"];
    
    ItemTableCell *tableCell;
    tableCell = [tableView dequeueReusableCellWithIdentifier:@"ItemTableCell"];
    [tableCell setTitle:title];
    [tableCell setTilteImg:imgURL];
    return tableCell;
}



//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 12;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return -100;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 87;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsDetailViewController *newsDetailViewController;
    newsDetailViewController = [[NewsDetailViewController alloc] init];
    
    [newsDetailViewController setNewsURL:[_newsData[indexPath.row] valueForKey:@"url"]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:newsDetailViewController animated:YES];
    
//    UITabBarController *tabBarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    UINavigationController *nav = (UINavigationController *)tabBarVC.selectedViewController;
//    [nav pushViewController:newsDetailViewController animated:YES];
    
}


//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
//        [cell setPreservesSuperviewLayoutMargins:NO];
//    }
//    
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}




@end
