//
//  GoodsListViewController.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsListViewController.h"

#import "GoodsListLeftView.h"
#import "GoodsListTopView.h"
#import "GoodsListRightView.h"

#import "GoodsDetailViewController.h"

@interface GoodsListViewController () <GoodsListLeftViewDelegate,BaseButtonViewDelegate,GoodsListRightViewDelegate>

@end

@implementation GoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加顶部的视图
    NSArray *buttons = @[@"默认",@"销量",@"评价",@"价格"];
    GoodsListTopView *topView = [[GoodsListTopView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44) buttons:buttons];
    topView.index = 0;              // 设置选中第几个（可设置偏好设置）
    topView.delegate = self;
    [self.view addSubview:topView];
    
    // 添加左边的tableView
    NSArray *arr1 = @[@"水",@"桶装水",@"瓶装水",@"饮料",@"碳酸饮料",@"乳品饮料"];
    NSArray *arr2 = @[@"上衣",@"裤子",@"短袖",@"裙子",@"牛仔裤",@"帽子"];
    NSArray *arr3 = @[@"奔驰",@"宝马",@"比亚迪",@"凯迪拉克",@"奥迪",@"大众"];
    NSArray *arr4 = @[@"耐克",@"361",@"乔丹",@"呵呵",@"还有啥",@"真的不知道了"];
    NSDictionary *dict = @{@"饮料饮品":arr1,@"衣物":arr2,@"轿车":arr3,@"鞋子":arr4};
    GoodsListLeftView *leftView = [[GoodsListLeftView alloc] initWithFrame:CGRectMake(0, MAXY(topView), 100, SCREEN_HEIGHT-44-64-50) style:UITableViewStylePlain dataDict:dict];
    leftView.delegate = self;
    [self.view addSubview:leftView];
    
    // 添加右边的tableView
    GoodsListRightView *rightView = [[GoodsListRightView alloc] initWithFrame:CGRectMake(MAXX(leftView), MAXY(topView), SCREEN_WIDTH-MAXX(leftView), SCREEN_HEIGHT-44-64-50) style:UITableViewStylePlain];
    rightView.delegate = self;
    [self.view addSubview:rightView];
    
}

// 左边视图的delegate
-(void)goodsListLeftViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HSLog(@"click left button %ld----%ld",indexPath.section,indexPath.row);
}

// 顶部视图的delegate
-(void)baseButtonViewClickBtnAtIndex:(NSInteger)index
{
    HSLog(@"click top button ---- index%ld",index);
}

// 右边视图的delegate
-(void)goodsListRightViewDidSelectAddtoCarAtRow:(NSInteger)row
{
    // 选中购物车按钮调用
}
-(void)goodsListRightViewDidSelectAtIndexPath:(NSIndexPath *)indexPath
{
    // 选中单元格调用
    GoodsDetailViewController *gdVc = [[GoodsDetailViewController alloc] init];
    [self.navigationController pushViewController:gdVc animated:YES];
}


@end
