//
//  UIView+Extension.h
//  超人不会飞
//
//  Created by  xp on 16/4/28.
//  Copyright © 2016年 Krier. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  在分类中声明属性@property,只会生成方法的声明,不会生成方法的实现和带有_下划线的成员变量
 */
@interface UIView (Extension)
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;
@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;
@property(nonatomic,assign) CGSize size;
@property(nonatomic,assign) CGPoint origin;



@end
