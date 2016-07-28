//
//  RightCell.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "RightCell.h"

@implementation RightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _addToCar = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_addToCar];
        [_addToCar setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
        [_addToCar setTitle:@"test" forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_addToCar setFrame:CGRectMake(self.width-15-5, self.height-5-15, 15, 15)];
}

@end
