//
//  GoodsListRightView.h
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//  商品列表的右边视图

#import "BaseView.h"

@protocol GoodsListRightViewDelegate <NSObject>

@optional
-(void)goodsListRightViewDidSelectAddtoCarAtRow:(NSInteger)row;

-(void)goodsListRightViewDidSelectAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface GoodsListRightView : BaseView

@property (nonatomic, weak) id<GoodsListRightViewDelegate>delegate;

@end
