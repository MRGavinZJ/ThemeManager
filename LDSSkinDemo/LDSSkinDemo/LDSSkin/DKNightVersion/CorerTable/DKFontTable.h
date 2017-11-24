//
//  DKFontTable.h
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/15.
//  Copyright © 2017年 asm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DKNightVersionManager.h"

/**
 *  A convinient macro to create DKFontPicker block.
 *
 *  @param key Key for corresponding entry in table
 *
 *  @return DKFontPicker
 */
#define DKFontPickerWithKey(key) [[DKFontTable sharedFontTable] pickerWithKey:@#key]

/**
 *  DKFontTable is a new feature in 2.x, which providing you a very convinient and
 *  delightful approach to manage all your color in an iOS project. Besides that, we
 *  support multiple themes with DKFontTable, change your `DKFontTable.txt` file
 *  like this:
 *
 *  Ex:
 *
 *      NORMAL   NIGHT   RED
 *      #ffffff  #343434 #ff0000 BG
 *      #aaaaaa  #313131 #ff0000 SEP
 *
 *  And you can directly change `[DKNightVersionManager sharedManager].themeVersion` to
 *  what you want, like: `RED` `NORMAL` and `NIGHT`. And trigger to post notification
 *  and update corresponding color.
 */
@interface DKFontTable : NSObject

/**
 *  Call `- reloadFontTable` will trigger `DKFontTable` to load this file,
 *  default is `DKFontTable.txt`. Don't need to call `- reloadFontTable` after
 *  setting this property, cuz we have already do it for you.
 */
@property (nonatomic, strong) NSString *file;

/**
 *  An array of DKThemeVersion, order is exactly the same in `file`.
 */
@property (nonatomic, strong, readonly) NSArray<DKThemeVersion *> *themes;

/**
 *  Return color table instance, you MUST use this method instead of `- init`,
 *  `- init` method may have negative impact on your performance.
 *
 *  @return An instance of DKFontTable
 */
+ (instancetype)sharedFontTable;

/**
 *  Return a `DKFontPicker` with `key`, but I suggest you use marcho `DKFontPickerWithKey(key)`
 *  instead of calling this method.
 *
 *  Ex:
 *
 *      NORMAL   NIGHT
 *      #ffffff  #343434 BG
 *      #aaaaaa  #313131 SEP
 *
 *      self.view.dk_FontPicker = DKFontPickerWithKey(BG);
 *
 *  @param key Which indicates the entry you refer to
 *
 *  @return An DKFontPicker block
 */
- (DKFontPicker)pickerWithKey:(NSString *)key;
@end
