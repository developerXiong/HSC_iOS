//
//  GoodsListLeftView.h
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//  商品列表的左边视图

#import "BaseView.h"

@protocol GoodsListLeftViewDelegate <NSObject>

@optional
-(void)goodsListLeftViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface GoodsListLeftView : BaseView

@property (nonatomic, weak) id<GoodsListLeftViewDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataDict:(NSDictionary *)dataDict;

@end
