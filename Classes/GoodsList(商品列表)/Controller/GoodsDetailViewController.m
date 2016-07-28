//
//  GoodsDetailViewController.m
//  HSC_iOS
//
//  Created by draven on 16/7/27.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsDetailViewController.h"

#import "GoodsDetailNavView.h"
#import "GoodsDetailView.h"
#import "GoodsCommentView.h"
#import "GoodsAfterSaleView.h"
#import "GoodsDetailBottomView.h"

@interface GoodsDetailViewController () <UIScrollViewDelegate>
{
    // 存放 详情、评价、售后等三个按钮的名称
    NSArray *buttons;
    // 存放 详情、评价、售后等三个视图
    NSMutableArray *views;
}
@property (nonatomic, strong) GoodsDetailNavView *navV;

@property (nonatomic, strong) UIScrollView *scrollV;

@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置子视图
    [self setUpChildViews];
    
    HSLog(@"%s",__func__);
}

-(void)setUpChildViews
{
    // 添加导航视图
    buttons = @[@"详情",@"评论",@"售后"];
    GoodsDetailNavView *navV = [[GoodsDetailNavView alloc] initWithFrame:CGRectMake(60, 0, SCREEN_WIDTH-120, 44) buttons:buttons];
    _navV = navV;
    navV.index = 0;
    self.navigationItem.titleView = navV;
    
    // 主视图
    CGFloat w = SCREEN_WIDTH, h = SCREEN_HEIGHT-BottomH-64;
    UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, w, h)];
    [self.view addSubview:scrollV];
    _scrollV = scrollV;
    scrollV.contentSize = CGSizeMake(buttons.count*SCREEN_WIDTH, SCREEN_HEIGHT);
    scrollV.pagingEnabled = YES;
    scrollV.showsVerticalScrollIndicator = NO;
    scrollV.showsHorizontalScrollIndicator = NO;
    scrollV.bounces = NO;
    scrollV.delegate = self;
    scrollV.scrollEnabled = NO;
    
    // 详情视图
    GoodsDetailView *detailV = [[GoodsDetailView alloc] initWithFrame:CGRectMake(0, -64, w, h) style:UITableViewStylePlain];
    [scrollV addSubview:detailV];
    
    // 评论视图
    GoodsCommentView *commentV = [[GoodsCommentView alloc] initWithFrame:CGRectMake(w, 0, w, h) style:UITableViewStylePlain];
    [scrollV addSubview:commentV];
    
    // 售后视图
    GoodsAfterSaleView *saleV = [[GoodsAfterSaleView alloc] initWithFrame:CGRectMake(w*2, 0, w, h)];
    [scrollV addSubview:saleV];
    
    // 将视图放入数组中
    views = [NSMutableArray array];
    [views addObject:detailV];
    [views addObject:commentV];
    [views addObject:saleV];
    // 按钮点击
    navV.btnClick = ^(NSInteger index) {
        CGRect frame = [views[index] frame];
        [scrollV scrollRectToVisible:frame animated:YES];
        // 问题：在scrollView上面放tableView，一开始进入视图会出现问题（y下移64）
        // 解决1：调用scrollRectToVisible:animated:方法之后恢复正常
        // 所以在一开始的时候将tableView的Y值设为-64，调用方法之后复原
        // 解决2：在viewDidApper:animated方法中 调用scrollRectToVisible:animated:
        // 让scrollView一开始就进行滚动，只能在viewDidApper:animated方法中调用成功，所以会有延时。
        detailV.frame = CGRectMake(0, 0, w, h);
    };

    // 底部视图
    GoodsDetailBottomView *bottomView = [[GoodsDetailBottomView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-BottomH, SCREEN_WIDTH, BottomH)];
    [self.view addSubview:bottomView];
    
}

#pragma mark scrllView代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.contentOffset.x;
    
    if (x==0) {
        _navV.index = 0;
    }else if (x==SCREEN_WIDTH){
        _navV.index = 1;
    }else if (x==SCREEN_WIDTH*2){
        _navV.index = 2;
    }
    
    //  navgationBar上面的线随着scrollview的滚动而滚动，滚动的比例是：
    //  线的第一个停留点的最大X到第二个停留点的最小X的距离/屏幕宽度
    _navV.line.x = x*(WIDTH(_navV)/buttons.count)/SCREEN_WIDTH+Margin/2;

}


@end
