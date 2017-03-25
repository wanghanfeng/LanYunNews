//
//  MineVC.m
//  LanYunNews
//
//  Created by whf on 17/3/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MineVC.h"
#import "Masonry.h"
#import "MineCell.h"
#import "UserSettingVC.h"

@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)UITableView *mainView;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mainView.delegate = self;
    self.mainView.dataSource = self;
    
    UINib *cellNib1 = [UINib nibWithNibName:@"MineCell" bundle:nil];
    [_mainView registerNib:cellNib1 forCellReuseIdentifier:@"MineCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)mainView{
    if (!_mainView) {
        _mainView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 1, 1) style:UITableViewStylePlain];
        
        [self.view addSubview:_mainView];
        [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top);
            make.right.equalTo(self.view.mas_right);
            make.left.equalTo(self.view.mas_left);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    return _mainView;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content;
    UIImage *image;
    
    switch (indexPath.row) {
        case 0:
            content = @"订阅";
            image = [UIImage imageNamed:@"btn_user_selected"];
            break;
        case 1:
            content = @"收藏";
            image = [UIImage imageNamed:@"btn_user_selected"];
            break;
        case 2:
            content = @"历史";
            image = [UIImage imageNamed:@"btn_user_selected"];
            break;
        case 3:
            content = @"跟帖";
            image = [UIImage imageNamed:@"btn_user_selected"];
            break;
        case 4:
            content = @"意见反馈";
            image = [UIImage imageNamed:@"btn_user_selected"];
            break;
            
        default:
            break;
    }
    
    MineCell *tableCell;
    tableCell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
    tableCell.content.text = content;
    tableCell.imagePlace.image = image;
    
    return tableCell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:{
            UserSettingVC *userSettingVC = [[UserSettingVC alloc] init];
            [self.navigationController pushViewController:userSettingVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}





@end
