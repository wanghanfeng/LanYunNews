//
//  HFSegmentView.m
//  xStore
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HFSegmentView.h"

#define windowContentWidth  ([[UIScreen mainScreen] bounds].size.width)
#define MAX_TitleNumInWindow 4

@interface HFSegmentView()

@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) UIButton *titleBtn;
@property (nonatomic,strong) UIScrollView *bgScrollView;
@property (nonatomic,strong) UIView *selectLine;
@property (nonatomic,assign) CGFloat btn_w;

@end

@implementation HFSegmentView

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray clickBlick:(btnClickBlock)block{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.shadowColor=[UIColor blackColor].CGColor;
        self.layer.shadowOffset=CGSizeMake(2, 2);
        self.layer.shadowRadius=2;
        self.layer.shadowOpacity=.2;
        
        _btn_w=0.0;
        
        if (titleArray.count<MAX_TitleNumInWindow+1) {
////            设置切换视图按钮的宽度
//            _btn_w=windowContentWidth/titleArray.count;
            _btn_w=windowContentWidth/MAX_TitleNumInWindow;
            
        }else{
            _btn_w=windowContentWidth/MAX_TitleNumInWindow;
        }
        _titles=titleArray;
        _defaultIndex=1;
        _titleFont=[UIFont systemFontOfSize:15*zoom];
        _btns=[[NSMutableArray alloc] initWithCapacity:0];
        _titleNomalColor=[UIColor colorFromHexRGB:@"aeaeae"];
        _titleSelectColor=[UIColor colorFromHexRGB:@"fc9228"];
        _bgScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, windowContentWidth, self.frame.size.height)];
        _bgScrollView.backgroundColor=[UIColor whiteColor];
        _bgScrollView.showsHorizontalScrollIndicator=NO;
        _bgScrollView.contentSize=CGSizeMake(_btn_w*titleArray.count, self.frame.size.height);
        [self addSubview:_bgScrollView];
        
        _selectLine=[[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, _btn_w, 2)];
        _selectLine.backgroundColor=_titleSelectColor;
        [_bgScrollView addSubview:_selectLine];
        
        for (int i=0; i<titleArray.count; i++) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(_btn_w*i, 0, _btn_w, self.frame.size.height-2);
            btn.tag=i+1;
        
            UIImage *btnImage;
            if (i == 0) {
//                买家
                btnImage = [UIImage imageNamed:@"买手图标选中"];
            }else{
//                卖家
                btnImage = [UIImage imageNamed:@"买家图标"];
            }
            [btn setImage:btnImage forState:UIControlStateNormal];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 15)];
            
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:_titleNomalColor forState:UIControlStateNormal];
            [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.titleLabel.font=_titleFont;
            [_bgScrollView addSubview:btn];
            [_btns addObject:btn];
            if (i==0) {
                _titleBtn=btn;
                btn.selected=YES;
            }
            self.block=block;
            
        }
    }
    
    return self;
}

-(void)btnClick:(UIButton *)btn{
    
    UIImage *btnImageOld;
    UIImage *btnImageNew;
    
    if (self.block) {
        self.block(btn.tag);
    }
    
//    设置按钮的图标变化
    if (btn.tag == 1) {
        btnImageOld = [UIImage imageNamed:@"买手图标选中"];
        btnImageNew = [UIImage imageNamed:@"买家图标"];
        
        [btn setImage:btnImageOld forState:UIControlStateNormal];
        UIButton *myButton = (UIButton *)[self viewWithTag:2];
        [myButton setImage:btnImageNew forState:UIControlStateNormal];
    }else{
        btnImageOld = [UIImage imageNamed:@"买手图标"];
        btnImageNew = [UIImage imageNamed:@"买家图标选中"];
        
        [btn setImage:btnImageNew forState:UIControlStateNormal];
        UIButton *myButton = (UIButton *)[self viewWithTag:1];
        [myButton setImage:btnImageOld forState:UIControlStateNormal];
    }
    
    
    if (btn.tag==_defaultIndex) {
        return;
    }else{
        _titleBtn.selected=!_titleBtn.selected;
        _titleBtn=btn;
        _titleBtn.selected=YES;
        _defaultIndex=btn.tag;
    }
    
//    //计算偏移量
//    CGFloat offsetX=btn.frame.origin.x - 2*_btn_w;
//    if (offsetX<0) {
//        offsetX=0;
//    }
//    CGFloat maxOffsetX= _bgScrollView.contentSize.width-windowContentWidth;
//    if (offsetX>maxOffsetX) {
//        offsetX=maxOffsetX;
//    }
    
    [UIView animateWithDuration:.2 animations:^{
        
//        [_bgScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        _selectLine.frame=CGRectMake(btn.frame.origin.x, self.frame.size.height-2, btn.frame.size.width, 2);
        
    } completion:^(BOOL finished) {
        
    }];
    
}



-(void)setTitleNomalColor:(UIColor *)titleNomalColor{
    _titleNomalColor=titleNomalColor;
    [self updateView];
}

-(void)setTitleSelectColor:(UIColor *)titleSelectColor{
    _titleSelectColor=titleSelectColor;
    [self updateView];
}

-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont=titleFont;
    [self updateView];
}

-(void)setDefaultIndex:(NSInteger)defaultIndex{
    _defaultIndex=defaultIndex;
    [self updateView];
}

-(void)updateView{
    for (UIButton *btn in _btns) {
        [btn setTitleColor:_titleNomalColor forState:UIControlStateNormal];
        [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font=_titleFont;
        _selectLine.backgroundColor=_titleSelectColor;
        
        if (btn.tag-1==_defaultIndex-1) {
            _titleBtn=btn;
            btn.selected=YES;
//            _selectLine.frame=CGRectMake(btn.frame.origin.x, self.frame.size.height-2, btn.frame.size.width, 2);
            [UIView animateWithDuration:.2 animations:^{
                _selectLine.frame=CGRectMake(btn.frame.origin.x, self.frame.size.height-2, btn.frame.size.width, 2);
            } completion:^(BOOL finished) {}];
            
            
        }else{
            btn.selected=NO;
        }
        
        //    设置按钮的图标变化
        UIImage *btnImageOld;
        UIImage *btnImageNew;
        if (btn.tag == 1) {
            btnImageOld = [UIImage imageNamed:@"买手图标选中"];
            btnImageNew = [UIImage imageNamed:@"买家图标"];
            
            [btn setImage:btnImageOld forState:UIControlStateSelected];
            UIButton *myButton = (UIButton *)[self viewWithTag:2];
            [myButton setImage:btnImageNew forState:UIControlStateNormal];
        }else{
            btnImageOld = [UIImage imageNamed:@"买手图标"];
            btnImageNew = [UIImage imageNamed:@"买家图标选中"];
            
            [btn setImage:btnImageNew forState:UIControlStateSelected];
            UIButton *myButton = (UIButton *)[self viewWithTag:1];
            [myButton setImage:btnImageOld forState:UIControlStateNormal];
        }
        
    }
}


@end
