//
//  GoodsListRightView.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsListRightView.h"

#import "RightCell.h"

@implementation GoodsListRightView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        
        
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[RightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = 0;
        
    }
    
    cell.leftImage.image = [UIImage imageNamed:@"1.jpg"];
    cell.title.text = @"卫龙亲嘴烧牛肉味22g2包";
    cell.subTitle.text = @"¥125.0/箱";
    cell.addToCar.tag = indexPath.row;
    [cell.addToCar addTarget:self action:@selector(addToCar:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// 点击购物车
-(void)addToCar:(UIButton *)sender
{
    HSLog(@"click right view %ld",sender.tag);
    if ([_delegate respondsToSelector:@selector(goodsListRightViewDidSelectAddtoCarAtRow:)]) {
        [_delegate goodsListRightViewDidSelectAddtoCarAtRow:sender.tag];
    }
}
// 点击单元格
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(goodsListRightViewDidSelectAtIndexPath:)]) {
        [_delegate goodsListRightViewDidSelectAtIndexPath:indexPath];
    }
}

@end
