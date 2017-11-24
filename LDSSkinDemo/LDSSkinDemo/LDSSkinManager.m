//
//  LDSSkinManager.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/13.
//  Copyright (c) 2017年 asm. All rights reserved.
//

#import "LDSSkinManager.h"

@implementation LDSSkinManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static LDSSkinManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}



@end
