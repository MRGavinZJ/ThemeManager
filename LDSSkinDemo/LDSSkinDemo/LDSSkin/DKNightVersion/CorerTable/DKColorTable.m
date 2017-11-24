//
//  DKColorTable.m
//  DKNightVersion
//
//  Created by Draveness on 15/12/11.
//  Copyright © 2015年 DeltaX. All rights reserved.
//

#import "DKColorTable.h"

@interface NSString (Trimming)

@end

@implementation NSString (Trimming)

- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (; length > 0; length--) {
        if (![characterSet characterIsMember:charBuffer[length - 1]]) {
            break;
        }
    }
    return [self substringWithRange:NSMakeRange(location, length - location)];
}

@end

@interface DKColorTable ()

@property (nonatomic, strong) NSDictionary<NSString *, UIColor *> *table;
@property (nonatomic, strong, readwrite) NSArray<DKThemeVersion *> *themes;

@end

@implementation DKColorTable

UIColor *DKColorFromRGB(NSUInteger hex) {
    return [UIColor colorWithRed:((CGFloat)((hex >> 16) & 0xFF)/255.0) green:((CGFloat)((hex >> 8) & 0xFF)/255.0) blue:((CGFloat)(hex & 0xFF)/255.0) alpha:1.0];
}

UIColor *DKColorFromRGBA(NSUInteger hex) {
    return [UIColor colorWithRed:((CGFloat)((hex >> 24) & 0xFF)/255.0) green:((CGFloat)((hex >> 16) & 0xFF)/255.0) blue:((CGFloat)((hex >> 8) & 0xFF)/255.0) alpha:((CGFloat)(hex & 0xFF)/255.0)];
}

+ (instancetype)sharedColorTable {
    static DKColorTable *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[DKColorTable alloc] init];
        sharedInstance.file = @"LDSSkinColorTable.plist";
    });
    return sharedInstance;
}

- (NSDictionary *)reloadColorTableWithThemeVersion:(DKThemeVersion *)version {
    
    if ([version isEqualToString:self.themes.lastObject]&&[self.table allKeys].count>0) {
        return self.table;
    }
    // Clear previos color table
    self.table = nil;
    self.themes = nil;

    // Load color table file
    NSString *filepath = [[NSBundle mainBundle] pathForResource:self.file.stringByDeletingPathExtension ofType:self.file.pathExtension];

    NSDictionary <NSString *,NSDictionary <NSString*,NSString*>*>*jsonDic =[[NSDictionary alloc] initWithContentsOfFile:filepath]; //[[NSUserDefaults standardUserDefaults] objectForKey:@"ASM_COLOR"];

    NSLog(@"DKColorTable:\n%@", jsonDic);

    self.themes = @[version];
    
    NSDictionary<NSString*,NSString*> *themeDic = [jsonDic objectForKey:version];
    
    __block NSMutableDictionary <NSString*,UIColor*>*tableDic = [NSMutableDictionary dictionary];
    [themeDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [tableDic setValue:[self colorFromString:obj] forKey:key];
    }];
    
    self.table = tableDic.copy;
    
    return self.table;
}

- (NSArray *)themesFromContents:(NSString *)content {
    NSString *rawThemes = [content componentsSeparatedByString:@"\n"].firstObject;
    return [self separateString:rawThemes];
}

- (NSArray *)colorsFromEntry:(NSString *)entry {
    NSMutableArray *colors = [[self separateString:entry] mutableCopy];
    [colors removeLastObject];
    NSMutableArray *result = [@[] mutableCopy];
    for (NSString *number in colors) {
        [result addObject:[self colorFromString:number]];
    }
    return result;
}


- (DKColorPicker)pickerWithKey:(NSString *)key {
    NSParameterAssert(key);
    DKColorPicker picker = ^(DKThemeVersion *themeVersion) {
                NSDictionary *themeDic = [self reloadColorTableWithThemeVersion:themeVersion];
        return [themeDic valueForKey:key];
    };
    return picker;

}

#pragma mark - Getter/Setter

- (NSDictionary *)table {
    if (!_table) {
        _table = [[NSDictionary alloc] init];
    }
    return _table;
}

- (void)setFile:(NSString *)file {
    _file = file;
    [self reloadColorTableWithThemeVersion:[DKNightVersionManager sharedManager].themeVersion];
}

#pragma mark - Helper

- (UIColor*)colorFromString:(NSString*)hexStr {
    hexStr = [hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([hexStr hasPrefix:@"0x"]) {
        hexStr = [hexStr substringFromIndex:2];
    }
    if([hexStr hasPrefix:@"#"]) {
        hexStr = [hexStr substringFromIndex:1];
    }

    NSUInteger hex = [self intFromHexString:hexStr];
    if(hexStr.length > 6) {
        return DKColorFromRGBA(hex);
    }

    return DKColorFromRGB(hex);
}

- (NSUInteger)intFromHexString:(NSString *)hexStr {
    unsigned int hexInt = 0;

    NSScanner *scanner = [NSScanner scannerWithString:hexStr];

    [scanner scanHexInt:&hexInt];

    return hexInt;
}

- (NSArray *)separateString:(NSString *)string {
    NSArray *array = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
}

@end
