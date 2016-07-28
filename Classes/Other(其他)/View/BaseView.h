//
//  BaseView.h
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//  基础View，带tableView

#import <UIKit/UIKit.h>

@interface BaseView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
