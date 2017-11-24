//
//  DKFont.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/24.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "DKFont.h"

@implementation DKFont

+ (DKFontPicker)fontPickerWithUIFont:(UIFont *)font {
    return ^(DKThemeVersion *themeVersion) {
        return font;
    };
}
+ (DKFontPicker)preferredFontPickerForTextStyle:(UIFontTextStyle)style NS_AVAILABLE_IOS(7_0) {
    return [self fontPickerWithUIFont:[UIFont preferredFontForTextStyle:style]];
}

+ (DKFontPicker)preferredFontPickerForTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(nullable UITraitCollection *)traitCollection NS_AVAILABLE_IOS(10_0) __WATCHOS_PROHIBITED {
    return [self fontPickerWithUIFont:[UIFont preferredFontForTextStyle:style compatibleWithTraitCollection:traitCollection]];
}


+ (nullable DKFontPicker)fontPickerWithName:(NSString *)fontName size:(CGFloat)fontSize {
    return [self fontPickerWithUIFont:[UIFont fontWithName:fontName size:fontSize]];
}

+ (DKFontPicker)systemFontPickerOfSize:(CGFloat)fontSize {
    return [self fontPickerWithUIFont:[UIFont systemFontOfSize:fontSize]];
}
+ (DKFontPicker)boldSystemFontPickerOfSize:(CGFloat)fontSize {
    return [self fontPickerWithUIFont:[UIFont boldSystemFontOfSize:fontSize]];
}
+ (DKFontPicker)italicSystemFontPickerOfSize:(CGFloat)fontSize {
    return [self fontPickerWithUIFont:[UIFont italicSystemFontOfSize:fontSize]];
}

+ (DKFontPicker)systemFontPickerOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2) {
    return [self fontPickerWithUIFont:[UIFont systemFontOfSize:fontSize weight:weight]];
}
+ (DKFontPicker)monospacedDigitSystemFontPickerOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0) {
    return [self fontPickerWithUIFont:[UIFont monospacedDigitSystemFontOfSize:fontSize weight:weight]];
}

+ (DKFontPicker)fontPickerWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)pointSize NS_AVAILABLE_IOS(7_0) {
    return [self fontPickerWithUIFont:[UIFont fontWithDescriptor:descriptor size:pointSize]];
}

@end
