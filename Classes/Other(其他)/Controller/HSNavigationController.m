//
//  HSNavigationController.m
//  HuaShang
//
//  Created by yyj on 16/7/6.
//  Copyright © 2016年 Anthony. All rights reserved.
//

#import "HSNavigationController.h"

@interface HSNavigationController ()

@end

@implementation HSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

  
}

//重写navigationController方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        // push的时候隐藏底部tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
