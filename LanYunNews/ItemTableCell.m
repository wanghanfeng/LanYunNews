//
//  ItemTableCell.m
//  LanYunNews
//
//  Created by whf on 17/1/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ItemTableCell.h"

#import "SDWebImage/UIImageView+WebCache.h"

@interface ItemTableCell()

@property (strong, nonatomic) IBOutlet UILabel *titleLB;
@property (strong, nonatomic) IBOutlet UIImageView *titleImg;


@end

@implementation ItemTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)title{
    _titleLB.text = title;
}

- (void)setTilteImg:(NSString *)imgURL{
    [_titleImg sd_setImageWithURL:imgURL placeholderImage:nil];
}

@end
