//
//  QuickCreateKJ.m
//  HuaShang
//
//  Created by apple on 16/7/11.
//  Copyright © 2016年 Chainsoft. All rights reserved.
//

#import "QuickCreateKJ.h"

@interface QuickCreateKJ ()

@end

@implementation QuickCreateKJ

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (UIButton *)createButtonFrame:(CGRect)frame BackImageName:(NSString *)imageName Title:(NSString *)title TitleColor:(UIColor *)color Font:(UIFont *)font Target:(id)target Action:(SEL)action
{
    UIButton * button = [[UIButton alloc]init];
    [button setFrame:frame];;
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UITextField *)createTextFieldWithFont:(CGFloat)font Placeholder:(NSString *)placeholder
{
    UITextField * textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:font];
    textField.textColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    return textField;
}


+ (UIImageView *)createImageViewFrme:(CGRect)frame ImageName:(NSString *)imageName Color:(UIColor *)color
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.backgroundColor = color;
    
    return imageView;
}

+ (UIImageView *)createImageViewWithImageName:(NSString *)imageName Color:(UIColor *)color
{
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.backgroundColor = color;
    
    return imageView;
}

+ (UILabel *)createLableFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)textColor Font:(CGFloat)font
{
    UILabel * lable = [[UILabel alloc] init];
    lable.frame = frame;
    lable.text = text;
    lable.textColor = textColor;
    lable.font = [UIFont systemFontOfSize:font];
    
    
    return lable;
}

+ (UIProgressView *)createProgressViewWithFrame:(CGRect)frame TintColor:(UIColor *)tintColor TrackTintColor:(UIColor *)trackTintColor
{
    UIProgressView * progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame = frame;
    progressView.tintColor = tintColor;
    progressView.trackTintColor = trackTintColor;
    
    return progressView;
}

+ (UIProgressView *)createProgressViewWithTintColor:(UIColor *)tintColor TrackTintColor:(UIColor *)trackTintColor
{
    UIProgressView * progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.tintColor = tintColor;
    progressView.trackTintColor = trackTintColor;
    
    return progressView;
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
