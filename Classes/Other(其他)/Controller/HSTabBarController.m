//
//  HSTabBarController.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "HSTabBarController.h"

#import "HSNavigationController.h"

#import "GoodsListViewController.h"     // 商品列表
#import "ShopViewController.h"          // 商城
#import "ShopCarViewController.h"       // 购物车
#import "MineViewController.h"          // 我的

@interface HSTabBarController ()

@end

@implementation HSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildVc:[[ShopViewController alloc]init] title:@"商城" image:@"Home_Grey" selectedImage:@"Home_Red"];
    
    [self addChildVc:[[GoodsListViewController alloc]init] title:@"商品列表" image:@"tab_mofang_normal" selectedImage:@"tab_mofang_selected"];
    
    [self addChildVc:[[ShopCarViewController alloc]init] title:@"购物车" image:@"main_index_cart_normal" selectedImage:@"main_index_cart_pressed"];
    
    [self addChildVc:[[MineViewController alloc]init] title:@"我的" image:@"tab_my_normal" selectedImage:@"tab_my_selected"];
    
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    HSNavigationController *nav = [[HSNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
