//
//  GuideViewController.m
//  欢迎、引导、登录界面搭建
//
//  Created by draven on 16/7/25.
//  Copyright © 2016年 draven. All rights reserved.
//  引导界面

#import "GuideViewController.h"

#import "HSTabBarController.h"

#define Width self.view.bounds.size.width
#define Height self.view.bounds.size.height

@interface GuideViewController ()

@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建图片数组
    _images = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [_images addObject:image];
    }
    
    // 创建scrollView
    [self addScrollView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)addScrollView
{
    
    UIScrollView *scollV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scollV];
//    scollV.backgroundColor = [UIColor redColor];
    scollV.contentSize = CGSizeMake(4*Width, Height);
//    scollV.alwaysBounceVertical = NO;               // 不允许垂直方向有弹性
//    scollV.alwaysBounceHorizontal = NO;             // 不允许水平方向有弹性
    scollV.bounces = NO;                            // 关闭弹性
    scollV.pagingEnabled = YES;                     // 翻页模式
    
    for (int i = 0; i<_images.count; i++) {
        
        CGFloat x=i*Width, y=0, w=Width, h=Height;
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        imageV.image = _images[i];
        [scollV addSubview:imageV];
        
        if (i==_images.count-1) {
            [self addBtnOnImageV:imageV];
        }
    }
    
}

// 添加按钮
-(void)addBtnOnImageV:(UIImageView *)imageV
{
    imageV.userInteractionEnabled = YES;
    CGFloat x=(SCREEN_WIDTH-60)/2, y=400, w=60, h=44;
    UIButton *button = [QuickCreateKJ createButtonFrame:CGRectMake(x, y, w, h) BackImageName:@"" Title:@"Enter" TitleColor:[UIColor redColor] Font:[UIFont systemFontOfSize:20] Target:self Action:@selector(clickEnter)];
    [imageV addSubview:button];
}

-(void)clickEnter
{
    HSLog(@"lickc enter");
    [UIApplication sharedApplication].keyWindow.rootViewController = [[HSTabBarController alloc]init];
}

@end
