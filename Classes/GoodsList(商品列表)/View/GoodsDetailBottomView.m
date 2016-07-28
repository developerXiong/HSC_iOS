//
//  GoodsDetailBottomView.m
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsDetailBottomView.h"



@interface GoodsDetailBottomView ()

@property (nonatomic, strong) UIButton *message;

@property (nonatomic, strong) UIButton *addCar;

@property (nonatomic, strong) UIButton *buy;

@end

@implementation GoodsDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpChildViews];
        
    }
    return self;
}

// 设置子视图
-(void)setUpChildViews
{
    _message = [self createButtonWithImage:@"" font:13 titleColor:[UIColor lightGrayColor] backgroundColor:[UIColor whiteColor] title:@"消息"];
    [self addSubview:_message];
    
    _addCar = [self createButtonWithImage:@"" font:18 titleColor:[UIColor whiteColor] backgroundColor:[UIColor orangeColor] title:@"加入购物车"];
    [self addSubview:_addCar];
    
    _buy = [self createButtonWithImage:@"" font:18 titleColor:[UIColor whiteColor] backgroundColor:[UIColor redColor] title:@"立刻购买"];
    [self addSubview:_buy];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w=SCREEN_WIDTH/3, h=BottomH;
    [_message setFrame:CGRectMake(0, 0, w, h)];
    
    [_addCar setFrame:CGRectMake(w, 0, w, h)];
    
    [_buy setFrame:CGRectMake(2*w, 0, w, h)];
    
}

-(UIButton *)createButtonWithImage:(NSString *)image font:(CGFloat)font titleColor:(UIColor *)tColor backgroundColor:(UIColor *)bColor title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:tColor forState:UIControlStateNormal];
    [btn setBackgroundColor:bColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    return btn;
}

@end
