//
//  UIWindow+Extension.m
//  HuaShang
//
//  Created by 周翔 on 16/7/20.
//  Copyright © 2016年 Chainsoft. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "GuideViewController.h"
#import "HSTabBarController.h"

@implementation UIWindow (Extension)

-(void)switchRootViewController
{
    // 判断是不是第一次安装APP，是的话先进入引导界面，不是的话直接进入主界面（登录界面？）
    NSString *key = @"CFBundleVersion";
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {
        self.rootViewController = [[HSTabBarController alloc]init];
    }else{
        self.rootViewController = [[GuideViewController alloc]init];
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
}

@end
