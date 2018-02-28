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
    NSLog(@"Current thread:%@",[NSThread currentThread]);
    
//    [self test];
//    [self test1];
//    [self test2];
//    [self test3];
    
    [self semaphoreTest];

}

- (void)semaphoreTest
{
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    
    __weak typeof(self) weak_self = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        long y = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        NSLog(@"taskA receieve signal Current thread:%@",[NSThread currentThread]);
        //y = 0 表示 任务被成功唤醒 否则表示等待超时，自动执行任务
        NSLog(@"y = %ld",y);
        [weak_self taskA];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        long y = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        NSLog(@"taskB receieve signal Current thread:%@",[NSThread currentThread]);
        //y = 0 表示 任务被成功唤醒 否则表示等待超时，自动执行任务
        NSLog(@"y = %ld",y);
        [weak_self taskB];
    });
    
    dispatch_semaphore_signal(signal);

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        long x = dispatch_semaphore_signal(signal);
        //x 代表等待唤醒的任务数量
        NSLog(@"x = %ld",x);
        NSLog(@"send signal Current thread:%@",[NSThread currentThread]);
    });
}

- (void)test
{
    //结果是A执行完再执行B AB任务均在主线程内执行
    [self taskA];
    [self taskB];
}

- (void)test1
{
    //结果并未 异步执行 A和B 结果是A执行完再执行B AB任务在同一线程内执行 （按我理解，单线程不存在并发的概念）
    __weak typeof(self) weak_self = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [weak_self taskA];
        [weak_self taskB];
    });
}

- (void)test2
{
    //结果是A执行完再执行B 但是此写法阻塞了主线程 页面卡死 AB任务执行完之后才能进入主页面
    __weak typeof(self) weak_self = self;
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        [weak_self taskA];
        [weak_self taskB];
    });
}

- (void)test3
{
    //结果是AB异步执行 这才是并发执行AB的正确写法 并且此写法AB任务在不同线程内执行。
    __weak typeof(self) weak_self = self;
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        [weak_self taskA];
    });
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        [weak_self taskB];
    });
}

//单线程同步与单线程异步测试
- (void)taskA
{
    NSLog(@"TaskA Current thread:%@",[NSThread currentThread]);

    NSLog(@"TaskA Start!");
    int i = 0;
    while (i<10) {
        i++;
        sleep(1);
    }
    if (i==10) {
        NSLog(@"TaskA Done!");
    }
}

- (void)taskB
{
    NSLog(@"TaskB Current thread:%@",[NSThread currentThread]);

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

- (void)taskC
{
    NSLog(@"TaskC Current thread:%@",[NSThread currentThread]);
    
    NSLog(@"TaskC Start!");
    int i = 0;
    while (i<5) {
        i++;
        sleep(1);
    }
    if (i==5) {
        NSLog(@"TaskC Done!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
