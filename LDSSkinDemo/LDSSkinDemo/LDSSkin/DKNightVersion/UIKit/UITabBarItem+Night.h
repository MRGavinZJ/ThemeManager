//
//  UITabBarItem+Night.h
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/15.
//  Copyright © 2017年 asm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKNightVersion.h"
@interface UITabBarItem (Night)

- (instancetype)dk_initWithTitle:(NSString *)title imagePicker:(DKImagePicker)picker selectImagePicker:(DKImagePicker)selPicker;

@property (nullable, nonatomic, copy, setter = dk_setImagePicker:) DKImagePicker dk_imagePicker;

@property (nonatomic, copy, setter = dk_setSelectImagePicker:) DKImagePicker dk_selectImagePicker;

@end
