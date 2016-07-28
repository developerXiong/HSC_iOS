//
//  BaseButtonView.m
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "BaseButtonView.h"

@interface BaseButtonView ()

@end

@implementation BaseButtonView

-(instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttonNames
{
    if (self=[super initWithFrame:frame]) {
        
        // 把所有按钮名称赋给全局变量，根据名称来创建按钮
        _buttonNames = [NSArray array];
        _buttonNames = buttonNames;
    
        // 初始化
        [self initailze];
        // 创建按钮
        [self createButton];
        
    }
    return self;
}

-(void)initailze
{
    self.font = [UIFont systemFontOfSize:15];
    self.color = [UIColor blackColor];
    self.selectColor = [UIColor redColor];
    self.index = 0;
}

-(void)createButton
{
    NSInteger count = _buttonNames.count;
    
    for (int i=0; i<count; i++) {
        
        NSString *title = [_buttonNames[i] description];
        CGFloat w=WIDTH(self)/count, h=HEIGHT(self), x=i*w, y=0;
        UIButton *btn = [QuickCreateKJ createButtonFrame:CGRectMake(x, y, w, h) BackImageName:@"" Title:title TitleColor:self.color Font:self.font Target:self Action:@selector(clickBtn:)];
        [btn setTitleColor:self.selectColor forState:UIControlStateSelected];
        btn.tag = i;
        btn.selected = NO;               // 所有按钮设为非选中状态
        if (i==self.index) {             // 如果是第一个按钮，按钮设为选中状态(可以设置成偏好设置)
            btn.selected = YES;
        }
        [self addSubview:btn];
    }
    
}

-(void)clickBtn:(UIButton *)sender
{
    
    // 取出当前视图的所有子视图，找出所有按钮，与当前点击的按钮相比
    // 如果一样，则按钮变为红色选中状态；如果不一样，则按钮变为黑色未选中状态
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            if ([btn isEqual:sender]) {
                btn.selected = YES;
            }else {
                btn.selected = NO;
            }
        }
    }
    
    // 实现代理
    if ([_delegate respondsToSelector:@selector(baseButtonViewClickBtnAtIndex:)]) {
        [_delegate baseButtonViewClickBtnAtIndex:sender.tag];
    }
}

// 选择哪个按钮
-(void)setIndex:(NSInteger)index
{
    _index = index;
    [self changeButtonProperty:^(UIButton *btn) {
       
        if (btn.tag==index) {
            btn.selected = YES;
        }else {
            btn.selected = NO;
        }
        
    }];
    
}
-(void)setFont:(UIFont *)font
{
    _font = font;
    [self changeButtonProperty:^(UIButton *btn) {
        btn.titleLabel.font = font;
    }];
}
-(void)setColor:(UIColor *)color
{
    _color = color;
//    [self changeButtonWithfont:_font color:_color selectColor:_selectColor index:_index];
    [self changeButtonProperty:^(UIButton *btn) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }];
    
}
-(void)setSelectColor:(UIColor *)selectColor
{
    _selectColor = selectColor;
    [self changeButtonProperty:^(UIButton *btn) {
        [btn setTitleColor:selectColor forState:UIControlStateSelected];
    }];
}

//  在调用自定义视图的初始化方法之后，按钮已经被创建，此时再改变，字体、颜色等属性
//  对控件并没有什么影响，所以通过改变控件的属性来实现改变自定义视图的属性的目的
-(void)changeButtonProperty:(Change)change
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            if (change) {
                change(btn);
            }
        }
    }
}

@end
