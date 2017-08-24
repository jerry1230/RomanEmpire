//
//  AppDelegate.h
//  RomanEmpire
//
//  Created by Bird on 2017/8/24.
//  Copyright © 2017年 yueqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

