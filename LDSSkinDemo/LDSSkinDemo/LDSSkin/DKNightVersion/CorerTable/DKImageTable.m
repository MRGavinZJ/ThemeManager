//
//  DKImageTable.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/15.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "DKImageTable.h"

@interface DKImageTable ()
@property (nonatomic, strong) NSDictionary<NSString *, UIImage *> *table;
@property (nonatomic, strong, readwrite) NSArray<DKThemeVersion *> *themes;
@end

@implementation DKImageTable
+ (instancetype)sharedImageTable {
    static DKImageTable *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[DKImageTable alloc] init];
        sharedInstance.file = @"LDSSkinImageTable.plist";
    });
    return sharedInstance;
}

- (NSDictionary *)reloadImageTableWithThemeVersion:(DKThemeVersion *)version {
    
    if ([version isEqualToString:self.themes.lastObject]&&[self.table allKeys].count>0) {
        return self.table;
    }
    // Clear previos color table
    self.table = nil;
    self.themes = nil;
    
    // Load color table file
    NSString *filepath = [[NSBundle mainBundle] pathForResource:self.file.stringByDeletingPathExtension ofType:self.file.pathExtension];
    
    NSDictionary <NSString *,NSDictionary <NSString*,NSString*>*>*jsonDic = [[NSDictionary alloc] initWithContentsOfFile:filepath];
    //[NSUserDefaults.standardUserDefaults objectForKey:@"ASM_IMAGE"];
    NSLog(@"DKImageTable:\n%@", jsonDic);
    
    self.themes = @[version];
    
    NSDictionary<NSString*,NSString*> *themeDic = [jsonDic objectForKey:version];
    
    __block NSMutableDictionary <NSString*,UIImage*>*tableDic = [NSMutableDictionary dictionary];
    [themeDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        UIImage *image = [UIImage imageNamed:obj];
        NSAssert(image, @"image not found");
        [tableDic setValue:image forKey:key];
    }];
    
    self.table = tableDic.copy;
    
    return self.table;
}


- (DKImagePicker)pickerWithKey:(NSString *)key {
    NSParameterAssert(key);
    DKImagePicker picker = ^(DKThemeVersion *themeVersion) {
        NSDictionary *themeDic = [self reloadImageTableWithThemeVersion:themeVersion];
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
    [self reloadImageTableWithThemeVersion:[DKNightVersionManager sharedManager].themeVersion];
}
@end
