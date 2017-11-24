//
//  DKFontTable.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/15.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "DKFontTable.h"

@interface DKFontTable ()
@property (nonatomic, strong) NSDictionary<NSString *, UIFont *> *table;
@property (nonatomic, strong, readwrite) NSArray<DKThemeVersion *> *themes;

@end

@implementation DKFontTable
+ (instancetype)sharedFontTable {
    static DKFontTable *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[DKFontTable alloc] init];
        sharedInstance.file = @"LDSSkinFontTable.plist";
    });
    return sharedInstance;
}

- (NSDictionary *)reloadFontTableWithThemeVersion:(DKThemeVersion *)version {
    
    if ([version isEqualToString:self.themes.lastObject]&&[self.table allKeys].count>0) {
        return self.table;
    }
    // Clear previos color table
    self.table = nil;
    self.themes = nil;
    
    // Load color table file
    NSString *filepath = [[NSBundle mainBundle] pathForResource:self.file.stringByDeletingPathExtension ofType:self.file.pathExtension];
    
    NSDictionary <NSString *,NSDictionary <NSString*,NSDictionary*>*>*jsonDic = [[NSDictionary alloc] initWithContentsOfFile:filepath];
    //[NSUserDefaults.standardUserDefaults objectForKey:@"ASM_Font"];
    NSLog(@"DKFontTable:\n%@", jsonDic);
    
    self.themes = @[version];
    
    NSDictionary<NSString*,NSDictionary*> *themeDic = [jsonDic objectForKey:version];
    
    __block NSMutableDictionary <NSString*,UIFont*>*tableDic = [NSMutableDictionary dictionary];
    [themeDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSDictionary * _Nonnull obj, BOOL * _Nonnull stop) {
        UIFont *font = nil;
        NSString *name = obj[@"name"];
        CGFloat size = [obj[@"size"] floatValue];
        font = [UIFont fontWithName:name size:size]?:[UIFont systemFontOfSize:size];
        
        [tableDic setValue:font forKey:key];
    }];
    
    self.table = tableDic.copy;
    
    return self.table;
}


- (DKFontPicker)pickerWithKey:(NSString *)key {
    NSParameterAssert(key);
    DKFontPicker picker = ^(DKThemeVersion *themeVersion) {
        NSDictionary *themeDic = [self reloadFontTableWithThemeVersion:themeVersion];
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
    [self reloadFontTableWithThemeVersion:[DKNightVersionManager sharedManager].themeVersion];
}
@end
