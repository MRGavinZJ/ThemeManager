//
//  DKFont.h
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/24.
//  Copyright © 2017年 asm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSString DKThemeVersion;

typedef UIFont*(^DKFontPicker)(DKThemeVersion *themeVersion);
@interface DKFont : NSObject

+ (DKFontPicker)preferredFontPickerForTextStyle:(UIFontTextStyle)style NS_AVAILABLE_IOS(7_0);

+ (DKFontPicker)preferredFontPickerForTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(nullable UITraitCollection *)traitCollection NS_AVAILABLE_IOS(10_0) __WATCHOS_PROHIBITED;


+ (nullable DKFontPicker)fontPickerWithName:(NSString *)fontName size:(CGFloat)fontSize;

+ (DKFontPicker)systemFontPickerOfSize:(CGFloat)fontSize;
+ (DKFontPicker)boldSystemFontPickerOfSize:(CGFloat)fontSize;
+ (DKFontPicker)italicSystemFontPickerOfSize:(CGFloat)fontSize;

+ (DKFontPicker)systemFontPickerOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight NS_AVAILABLE_IOS(8_2);
+ (DKFontPicker)monospacedDigitSystemFontPickerOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight NS_AVAILABLE_IOS(9_0);

+ (DKFontPicker)fontPickerWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)pointSize NS_AVAILABLE_IOS(7_0);

@end
