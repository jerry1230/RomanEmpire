//
//  MultithreadingTestVC.m
//  RomanEmpire
//
//  Created by Flying on 2018/2/27.
//  Copyright © 2018年 Flyingbird. All rights reserved.
//

#import "MultithreadingTestVC.h"

@interface MultithreadingTestVC ()

@end

@implementation MultithreadingTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weak_self = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [weak_self taskA];
        [weak_self taskB];
    });
    
//    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
//        [weak_self taskA];
//        [weak_self taskB];
//    });
}

//单线程同步与单线程异步测试
- (void)taskA
{
    NSLog(@"TaskA Start!");
    int i = 0;
    while (i<2) {
        i++;
        sleep(1);
    }
    if (i==2) {
        NSLog(@"TaskA Done!");
    }
}

- (void)taskB
{
    NSLog(@"TaskB Start!");
    int i = 0;
    while (i<3) {
        i++;
        sleep(1);
    }
    if (i==3) {
        NSLog(@"TaskB Done!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
