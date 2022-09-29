//
//  DeadlockViewController.m
//  test
//
//  Created by 宋锡铭 on 2022/9/24.
//  Copyright © 2022 sven. All rights reserved.
//
#warning 终于搞定死锁了
#warning 死锁条件: 同步 + 串行队列, 并且同步所在的队列(dispatch_sync外的队列)跟串行队列不是同一个队列
#import "DeadlockViewController.h"

@interface DeadlockViewController ()

@end

@implementation DeadlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//
//    });// 主线程,同步+主队列 = 死锁
    
//    for (NSInteger i = 0; i < 5; i++) {
        
//        [self testDemo3];
//    }
    [self addView];
    
    // 同步 + 主线程 一定堵塞? 不一定, 同步所在的线程如果不是主线程就不会死锁
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//
//    });
    
    dispatch_queue_t queue = dispatch_queue_create(@"svQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        // dispatch_get_main_queue 不死锁
        // queue死锁
//        dispatch_sync(queue, ^{
//
//        });
    });
    
    [self testDemo1];
}

- (void)addView {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(testDemo3) forControlEvents:UIControlEventTouchUpInside];
}

- (void)testDemo1 {
    dispatch_queue_t queue = dispatch_queue_create("zs", DISPATCH_QUEUE_SERIAL);
//    dispatch_sync(queue, ^{
//        NSLog(@"1");
//    }); // 同步+ 串行不一定死锁: 主线程,同步+非主队列的串行队列,不会死锁/ 主队列+主线程会死锁
        
    
    dispatch_queue_t queue1 = dispatch_queue_create("ss", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"2");
        // queue死锁
        // queue1 不会死锁
        dispatch_sync(queue1, ^{

        });
    });
}

- (void)testDemo3 {
    // while循环 打印变量
    // 使用信号量控制线程数
    __block NSInteger a = 0;
    dispatch_semaphore_t sema = dispatch_semaphore_create(2);
    while (a < 10) {
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            a++;
            NSLog(@"a:%zd,当前线程%@",a,[NSThread currentThread]);
            dispatch_semaphore_signal(sema);
        });
    }
//    NSLog(@"----a%zd",a);
    //Q1:循环内打印多少次?  >10次, 因为开多条线程, a值不一定是多少
    //Q2:循环外a是多少?   >= 10, 因为在两个线程中间,a 可能被加了多次; 我开始以为是0,打错特错了,a<10,while循环不会结束啊
}

@end
