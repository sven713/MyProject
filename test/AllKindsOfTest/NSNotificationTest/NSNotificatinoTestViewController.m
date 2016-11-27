//
//  NSNotificatinoTestViewController.m
//  test
//
//  Created by song ximing on 2016/11/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "NSNotificatinoTestViewController.h"

@interface NSNotificatinoTestViewController ()

@end

@implementation NSNotificatinoTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
- (void)configUI {
    self.title = @"通知测试";
    // 最后一个参数 可以指定textField,不监听所有的textfield,只监听当前页面里面的textField的改变  http://www.jianshu.com/p/a2cb99dcd4fe
    // http://www.cnblogs.com/xunziji/p/3257447.html
    // http://www.jianshu.com/p/a4d519e4e0d5
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:nil object:nil]; // name为nil 监听所有的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationTest" object:nil];
    
    [self mutipleThreadWithNotification];
}

- (void)handleNotification:(NSNotification *)notice {
//    NSLog(@"notice.name--%@",notice.name); // 打印了各种通知
}

// 通知在多线程
- (void)mutipleThreadWithNotification {
    // 主线程添加观察者
    // Q:线程和队列？？
    // 直接带block回调的观察者
    [[NSNotificationCenter defaultCenter] addObserverForName:@"kBlockNotification" object:self queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"recieve--currentThread--%@",[NSThread currentThread]); // [NSOperationQueue mainQueue] 打印线程为主线程， queue写nil打印线程为通知发出的线程， 【总结】：如果不指定观察的线程，那么在哪个线程发送的广播，就在哪个线程响应广播，串行的，博客里说同步
        // 同步跟串行  异步跟并发
        // 异步表示开子线程， 并发表示同时执行几个任务
        // 串行是按顺序执行的，同步呢?也是按顺序执行的？
        // 串行并行针对队列queue
        // 异步一定会开启新的线程
        // http://blog.ximu.site/gcd/     http://www.cnblogs.com/hrios/p/thr.html   多线程
    }];
    // 子线程发出通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"post--currentThread--%@",[NSThread currentThread]); // 先Receive 然后 post 写在发送之后
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kBlockNotification" object:self];
    });
}

@end
