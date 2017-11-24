//
//  LDSViewController.m
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/13.
//  Copyright © 2017年 asm. All rights reserved.
//

#import "LDSViewController.h"
#import "DKNightVersion.h"

@interface LDSViewController ()

@property(nonatomic, strong) UIButton *btn;

@end

@implementation LDSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.btn setTitle:@"变-as》？A" forState:UIControlStateNormal];
    [self.btn dk_setTitleColorPicker:DKColorPickerWithKey(textColor) forState:UIControlStateNormal];
    self.btn.frame = CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 100);

    [self.btn addTarget:self action:@selector(changeColors:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setBackgroundColor:[UIColor orangeColor]];
    
    [self.view addSubview:self.btn];
    
    UIImageView *imagev = [[UIImageView alloc] init];
    
    [self.view addSubview:imagev];
    imagev.frame = CGRectMake(100,100, 100, 100);
    
    
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(barColor);
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(backgroundColor);
    imagev.dk_imagePicker = DKImagePickerWithKey(backgroundImage);
    [self.btn.titleLabel dk_setTextFontPicker:DKFontPickerWithKey(textFont)];
    
}



int count = 1;
- (IBAction)changeColors:(UIButton *)sender {
//    [self.navigationController pushViewController:[self.class new] animated:YES];
    if ([sender.titleLabel.text isEqualToString:@"purple"]) {
        [self.dk_manager nightFalling];
    }else if ([sender.titleLabel.text isEqualToString:@"blue"]) {
        [self.dk_manager dawnComing];
    }else if ([sender.titleLabel.text isEqualToString:@"yellow"]) {
        [self.dk_manager nightFalling];

    }else if ([sender.titleLabel.text isEqualToString:@"green"]) {
        self.dk_manager.themeVersion = @"RED";
    }
    switch (count%3) {
        case 1:
            [self.dk_manager nightFalling];
            break;
        case 2:
            [self.dk_manager dawnComing];
            break;
            
        default:
            self.dk_manager.themeVersion = @"RED";
            break;
    }
    count ++;
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
