//
//  BaseViewController.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    [self addSearchBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //
    }
    return self;
}

// 添加导航SearchBar
- (void)addSearchBar {
    UISearchBar *bar = [[UISearchBar alloc] init];
    bar.placeholder = @"请输入关键字进行搜索";
    bar.searchBarStyle = UISearchBarStyleDefault;
    bar.tintColor = [UIColor redColor];
    self.navigationItem.titleView = bar;
    self.searchBar = bar;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_searchBar resignFirstResponder];
}

@end
