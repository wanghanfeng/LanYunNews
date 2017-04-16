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
#import "AppInfoVC.h"

#define HFLog(str, ...) NSLog(@" --- %s --- , --- %@ --- , --- %@ --- ",__func__,NSStringFromSelector(_cmd),[NSString stringWithFormat:(str),##__VA_ARGS__])

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
            content = @"App启动次数";
            image = [UIImage imageNamed:@"btn_user_selected"];
            break;
        case 4:
            content = @"清理缓存";
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
        case 0: {
            UserSettingVC *userSettingVC = [[UserSettingVC alloc] init];
            [self.navigationController pushViewController:userSettingVC animated:YES];
        }
            break;
        
        case 3: {
            AppInfoVC *appInfoVC = [[AppInfoVC alloc] init];
            [self.navigationController pushViewController:appInfoVC animated:YES];
            break;
        }
        
        case 4: {
            NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            HFLog(path);
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *error;
            NSArray *allFiles = [fileManager contentsOfDirectoryAtPath:path error:&error];
            for (NSString *file in allFiles) {
                NSString *filePath = [path stringByAppendingPathComponent:file];
                if ([fileManager isDeletableFileAtPath:filePath]) {
                    [fileManager removeItemAtPath:filePath error:&error];
                    if (error) {
                        NSLog(@"%@", error);
                    }
                }
            }
            if (!error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功" message:@"清理完成" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [alert show];
            }
        }
        default:
            break;
    }
    
}





@end
