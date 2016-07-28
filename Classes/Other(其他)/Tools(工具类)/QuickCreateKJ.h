//
//  QuickCreateKJ.h
//  HuaShang
//
//  Created by apple on 16/7/11.
//  Copyright © 2016年 Chainsoft. All rights reserved.
//

#import "BaseViewController.h"

@interface QuickCreateKJ : BaseViewController

/** 快速创建Button */
+ (UIButton *)createButtonFrame:(CGRect)frame BackImageName:(NSString *)imageName Title:(NSString *)title TitleColor:(UIColor *)color Font:(UIFont *)font Target:(id)target Action:(SEL)action;

/** 快速创建UITextField */
+ (UITextField *)createTextFieldWithFont:(CGFloat)font Placeholder:(NSString *)placeholder;


/** 快速创建UIImageView */
+ (UIImageView *)createImageViewFrme:(CGRect)frame ImageName:(NSString *)imageName Color:(UIColor *)color;
+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName Color:(UIColor *)color;


/** 快速创建UILabel */
+ (UILabel *)createLableFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)textColor Font:(CGFloat)font;

/** 快速创建UIProgressView */
+ (UIProgressView *)createProgressViewWithFrame:(CGRect)frame TintColor:(UIColor *)tintColor TrackTintColor:(UIColor *)trackTintColor;
+ (UIProgressView *)createProgressViewWithTintColor:(UIColor *)tintColor TrackTintColor:(UIColor *)trackTintColor;


@end
