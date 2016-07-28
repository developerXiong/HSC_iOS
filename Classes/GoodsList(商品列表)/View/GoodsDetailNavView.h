//
//  GoodsDetailNavView.h
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//  商品详情的导航栏

#import "BaseButtonView.h"

#define Margin 30       // 值越大，线越窄
#define LineW WIDTH(self)/self.buttonNames.count-Margin

typedef void(^BtnClick)(NSInteger index);

@interface GoodsDetailNavView : BaseButtonView

@property (nonatomic, strong) BtnClick btnClick;
// 最下边的线
@property (nonatomic, strong) UIView *line;

// 移动线的位置
- (void)lineMoveToIndex:(NSInteger)index animation:(BOOL)animation;

@end
