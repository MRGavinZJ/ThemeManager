//
//  LDSNavigationController.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/13.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "LDSNavigationController.h"

@interface LDSNavigationController ()

@end

@implementation LDSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *colors=@{
                             @"NIGHT":    @{
                                 @"backgroundColor":@"#343434",
                                 @"barColor":@"#444444",
                                 @"hightLightColor":@"#222222",
                                 @"separatorColor":@"#313131",
                                 @"textColor":@"#ffffff",
                                 @"tintColor":@"#ffffff",
                             },
                             @"NORMAL":    @{
                                 @"backgroundColor":@"#ffffff",
                                 @"barColor":@"0x004aff",
                                 @"hightLightColor":@"#f0f0f0",
                                 @"separatorColor":@"0x004aff",
                                 @"textColor":@"#000000",
                                 @"tintColor":@"#0000ff",
                             },
                             @"RED":    @{
                                 @"backgroundColor":@"#009688",
                                 @"barColor":@"#ffffff",
                                 @"hightLightColor":@"#dedede",
                                 @"separatorColor":@"#aaaaaa",
                                 @"textColor":@"#000000",
                                 @"tintColor":@"#fa0000",
                             },
                             };
    
    NSDictionary *images = @{
                             @"NIGHT":    @{
                                     @"backgroundImage": @"home_img_bg",
                                     @"itemImage": @"tab_icon_home_selected",
                                     @"itemSelectedImage": @"tab_icon_home_default",
                             },
                             @"NORMAL":     @{
                                     @"backgroundImage": @"leftbackiamge",
                                     @"itemImage": @"tab_icon_room_selected",
                                     @"itemSelectedImage": @"tab_icon_room_default",
                             },
                             @"RED":    @{
                                     @"backgroundImage": @"leftbackiamge",
                                     @"itemImage": @"tab_icon_video_selected",
                                     @"itemSelectedImage": @"tab_icon_video_default",
                             },
                             };
    [[NSUserDefaults standardUserDefaults] setValue:colors forKey:@"ASM_COLOR"];
    [[NSUserDefaults standardUserDefaults] setValue:images forKey:@"ASM_IMAGE"];
    
    [NSUserDefaults.standardUserDefaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
