//
//  BaseButtonView.h
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//  横向添加几个等宽按钮（字体默认15，颜色默认黑色）， 被点击的按钮变色（默认为蓝色）
//  

#import <UIKit/UIKit.h>

@protocol BaseButtonViewDelegate <NSObject>

@optional
// 点击哪个按钮的代理方法
-(void)baseButtonViewClickBtnAtIndex:(NSInteger)index;

@end

typedef void(^Change)(UIButton *btn);

@interface BaseButtonView : UIView

@property (nonatomic, weak) id<BaseButtonViewDelegate>delegate;

// 所有按钮的名称
@property (nonatomic, strong) NSArray *buttonNames;

// 按钮的字体
@property (nonatomic, strong) UIFont *font;
// 按钮的字体颜色
@property (nonatomic, strong) UIColor *color;
// 按钮选中的字体颜色
@property (nonatomic, strong) UIColor *selectColor;
// 选中哪一个按钮
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) Change change;

-(instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttonNames;

-(void)changeButtonProperty:(Change)change;
// 按钮点击事件
-(void)clickBtn:(UIButton *)sender;

@end
