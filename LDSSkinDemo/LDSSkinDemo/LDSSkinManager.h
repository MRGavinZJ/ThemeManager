//
//  LDSSkinManager.h
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/13.
//  Copyright (c) 2017年 asm. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface LDSSkinManager : NSObject

+ (instancetype)sharedInstance;

@property(nonatomic, strong) UIColor *naviBackgroudColor;

@end
