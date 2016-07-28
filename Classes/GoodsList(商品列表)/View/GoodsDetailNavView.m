//
//  GoodsDetailNavView.m
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsDetailNavView.h"

@implementation GoodsDetailNavView

- (instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttonNames
{
    self = [super initWithFrame:frame buttons:buttonNames];
    if (self) {
        
        // 添加线
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor redColor];
        [self addSubview:_line];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _line.frame = CGRectMake(self.index * (LineW+Margin)+Margin/2, HEIGHT(self)-2, LineW, 2);
    
}

-(void)clickBtn:(UIButton *)sender
{
    [super clickBtn:sender];
    
    NSInteger index = sender.tag;
    [self lineMoveToIndex:index animation:YES];
    
    if (_btnClick) {
        _btnClick(index);
    }
    
}

- (void)lineMoveToIndex:(NSInteger)index animation:(BOOL)animation
{
    if (!animation) {
        _line.x = index * (LineW+Margin)+Margin/2;
        return;
    }
    
    [UIView animateWithDuration:0.2 animations:^{
       
        _line.x = index * (LineW+Margin)+Margin/2;
        
    }];
    
}

@end
