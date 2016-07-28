//
//  BaseCell.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _leftImage = [[UIImageView alloc] init];
        [self addSubview:_leftImage];
        
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        [self addSubview:_title];
        
        _subTitle = [[UILabel alloc] init];
        _subTitle.font = [UIFont systemFontOfSize:14];
        _subTitle.textColor = [UIColor redColor];
        [self addSubview:_subTitle];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x=5, y=5, h=self.height-10, w=h;
    _leftImage.frame = CGRectMake(x, y, w, h);
    
    CGFloat tx = MAXX(_leftImage)+10, ty=y,tw = self.width-tx-10, th = 20;
    _title.frame = CGRectMake(tx, ty, tw, th);
    
    _subTitle.frame = CGRectMake(tx, MAXY(_title)+10, tw, th);
    
    
}

@end
