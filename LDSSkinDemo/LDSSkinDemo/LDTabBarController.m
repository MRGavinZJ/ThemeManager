//
//  LDTabBarController.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/13.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "LDTabBarController.h"
#import "LDSViewController.h"
#import "DKNightVersion.h"
@interface LDTabBarController ()

@end

@implementation LDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arr = @[@"home",@"sence",@"room",@"video"];
    NSMutableArray *vcs = @[].mutableCopy;
    for (int i = 0; i <arr.count ; i ++) {
        LDSViewController *vc = [LDSViewController new];
        NSString *title = [arr objectAtIndex:i];
        vc.title = [NSString stringWithFormat:@"title-%@",title];

        UITabBarItem *item = [[UITabBarItem alloc] dk_initWithTitle:title
                                                        imagePicker:
                              DKImagePickerWithKey(itemImage)
                                                  selectImagePicker:
                              DKImagePickerWithKey(itemSelectedImage)];
        
        vc.tabBarItem = item;
        [vcs addObject:vc];
        }
    self.viewControllers = vcs;
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
