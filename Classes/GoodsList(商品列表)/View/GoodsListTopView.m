//
//  GoodsListTopView.m
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsListTopView.h"

@implementation GoodsListTopView

- (instancetype)initWithFrame:(CGRect)frame buttons:(NSArray *)buttonNames
{
    self = [super initWithFrame:frame buttons:buttonNames];
    if (self) {
        
        // 加一条线
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT(self)-0.5, WIDTH(self), 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        
    }
    return self;
}



@end
