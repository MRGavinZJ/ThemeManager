//
//  UITabBarItem+Night.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/15.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "UITabBarItem+Night.h"
#import "NSObject+Night.h"

@interface UITabBarItem ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *pickers;
@end

@implementation UITabBarItem (Night)
- (instancetype)dk_initWithTitle:(NSString *)title imagePicker:(DKImagePicker)picker selectImagePicker:(DKImagePicker)selPicker {
   UITabBarItem *item = [self initWithTitle:title image:picker(self.dk_manager.themeVersion) selectedImage:selPicker(self.dk_manager.themeVersion)];
    
    item.dk_imagePicker = picker;
    item.dk_selectImagePicker = selPicker;
    return item;
}

- (DKImagePicker)dk_imagePicker {
    return objc_getAssociatedObject(self, @selector(dk_imagePicker));
}

- (void)dk_setImagePicker:(DKImagePicker)picker {
    objc_setAssociatedObject(self, @selector(dk_imagePicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = picker(self.dk_manager.themeVersion);
    [self.pickers setValue:[picker copy] forKey:@"setImage:"];
    
}

- (DKImagePicker)dk_selectImagePicker {
    return objc_getAssociatedObject(self, @selector(dk_selectImagePicker));
}

- (void)dk_setSelectImagePicker:(DKImagePicker)dk_selectImagePicker {
    objc_setAssociatedObject(self, @selector(dk_imagePicker), dk_selectImagePicker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = dk_selectImagePicker(self.dk_manager.themeVersion);
    [self.pickers setValue:[dk_selectImagePicker copy] forKey:@"setSelectedImage:"];
}

@end
