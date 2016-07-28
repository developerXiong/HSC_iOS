//
//  GoodsListLeftView.m
//  HSC_iOS
//
//  Created by draven on 16/7/26.
//  Copyright © 2016年 draven. All rights reserved.
//

#import "GoodsListLeftView.h"

@interface GoodsListLeftView ()
{
    // 数据源(一个字典，字典中 一个字符串key对应一个数组value)
    NSDictionary *_dataDict;
    // 数据源中的所有的key
    NSMutableArray *_keys;
    // 数据源中的所有的value
    NSMutableArray *_values;
    // 判断是否组是否为展开或是关闭状态 默认为打开
    BOOL isOpen[100];
}
@end

@implementation GoodsListLeftView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataDict:(NSDictionary *)dataDict
{
    if (self = [super initWithFrame:frame style:style]) {
     
        // 将数据赋值给全局的变量
        _dataDict = dataDict;
        
        // 将所有的key放到keys数组中
        _keys = [NSMutableArray arrayWithArray:dataDict.allKeys];
        
        // 将所有的value放到values数组中
        _values = [NSMutableArray arrayWithArray:dataDict.allValues];
        
        // 将列表默认关闭
        for (int i=0; i<4; i++) {
            isOpen[i] = YES;
            isOpen[0] = NO; // 将第一个打开
        }
        
    }
    return self;
}

// 返回行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 判断是否为打开状态
    if (isOpen[section]) {
        return 0;
    }
    // 数据源的values的每组的个数
    return [_values[section] count];
}
// 返回组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}
// 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = [_values[indexPath.section][indexPath.row] description];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}
// 返回自定义头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 创建头视图中可点击的按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:[_keys[section] description] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setFrame:CGRectMake(20, 0, self.bounds.size.width-20, 30)];
    btn.tag = section;
    [btn addTarget:self action:@selector(clickHeader:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor whiteColor]];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;           // 设置按钮内容左对齐
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);                                // 设置按钮内容偏移量
    
    return btn;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
// 点击头视图
-(void)clickHeader:(UIButton *)sender
{
    // 点击的组
    NSInteger index = sender.tag;
    // 将每组对应的打开关闭状态改为与原来不同
    isOpen[index] = !isOpen[index];
    // 刷新对应的组
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationFade];
    
}
// 选中某一行调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(goodsListLeftViewDidSelectRowAtIndexPath:)]) {
        [_delegate goodsListLeftViewDidSelectRowAtIndexPath:indexPath];
    }
}

@end
