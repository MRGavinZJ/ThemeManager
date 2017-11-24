//
//  AppDelegate.h
//  LDSSkinDemo
//
//  Created by leedarson on 2017/11/13.
//  Copyright © 2017年 asm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

