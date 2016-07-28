//
//  NSString+Extension.m
//  HuaShang
//
//  Created by 周翔 on 16/7/19.
//  Copyright © 2016年 Chainsoft. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString *)getTimeStamp
{
    long long timeStamp = 0;
    
    NSTimeInterval time = [[NSDate date]timeIntervalSince1970];
    
    timeStamp = time *1000;
    
    return [NSString stringWithFormat:@"%lld",timeStamp];
    
}

@end
