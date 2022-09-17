//
//  KT_secondViewController.m
//  test
//
//  Created by 宋锡铭 on 2022/9/15.
//  Copyright © 2022 sven. All rights reserved.
//

#import "KT_secondViewController.h"
#import "TestTheread.h"

@interface KT_secondViewController ()

@end


@implementation KT_secondViewController{
    TestTheread *testTheread;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //子线程保活, testThread  13-28min
    
    [self addView];
}

- (void)addView {
    UIButton *keepBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:keepBtn];
    [keepBtn setTitle:@"线程保活" forState:UIControlStateNormal];
    [keepBtn addTarget:self action:@selector(keepTapAction) forControlEvents:UIControlEventTouchUpInside];
    keepBtn.backgroundColor = [UIColor orangeColor];
    
    UIButton *excuteBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:excuteBtn];
    [excuteBtn addTarget:self action:@selector(excuteTap)
        forControlEvents:UIControlEventTouchUpInside];
    excuteBtn.backgroundColor = [UIColor orangeColor];
    [excuteBtn setTitle:@"执行任务" forState:UIControlStateNormal];
}


- (void)keepTapAction {
    // 创建线程
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        testTheread = [[TestTheread alloc] initWithTarget:self selector:@selector(doSomething) object:nil];
        [testTheread setName:@"保活线程"];
        [testTheread start];
        NSLog(@"保活线程启动");
    });
}

- (void)doSomething{
    @autoreleasepool {
        NSLog(@"线程%@",[NSThread currentThread]);
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        // 添加一个port 保活; 不加就死了,子线程任务不会执行
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes]; //加上这个,后面都不走了
         //  source1:基于port内核事件,主动唤醒.  数据结构? key(machport)-value(source1)
        // source0用户的,主动出发的触摸  数据结构? 数组
        
        // 如果repeats 为NO, 线程仍然不能保活
//        [runloop addTimer:[NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"111111");
//        }] forMode:NSRunLoopCommonModes];
        NSLog(@"检查runloop%@",runloop);
//        [runloop runUntilDate:<#(nonnull NSDate *)#>];
        [runloop run];
//        [runloop runMode:<#(nonnull NSRunLoopMode)#> beforeDate:<#(nonnull NSDate *)#>];
//        NSDate *data = [NSDate da];
//        [runloop runMode:NSRunLoopCommonModes beforeDate:<#(nonnull NSDate *)#>];
        

        // 添加了machport, 就不会走这里,线程保活了
        // 添加事件源,让Runloop存活不销毁
        NSLog(@"结束");
    }
}



- (void)excuteTap {
    // 让子线程执行任务
    [self performSelector:@selector(addSubThreadAction) onThread:testTheread withObject:nil waitUntilDone:NO];
}


- (void)addSubThreadAction {
    NSLog(@"子线程操作%@",[NSThread currentThread]);
    // 没有调用这里,是因为runloop休眠了; 为啥休眠了?
    // 因为runloop组成: modes包含sources/ timer/ observer; 如果没有sources timer就休眠,省cup
}

// [Demo2 知识点：]
// 子线程保活定义:保持runloop不退出(默认结束source timer observer, runloop会退出)
// 子线程保活: 添加一个machport(或者timer, observer)
// source0: 用户触发,数据结构:数组
// source1: 系统内核,数据结构:key(machport)-value(source1) ; 线程,runloop=> key-value

// 主线程要保活么? 不需要,看源码isEmpty; 主线程return false;  子线程,sources, timers 有return false
// 子线程创建后,不会默认启动,创建直接启动浪费资源,任务结束,线程销毁,节省资源, 线程保活,避免频繁创建销毁线程,节省资源
// Q:子线程任务结束, runloop应该销毁-线程销毁? 如何销毁runloop? 不能销毁的问题出在启动方式
// 直接Start的runloop不会销毁, 只有用runMode可以, 别的方法底层都是while循环


//- (void)run;
//- (void)runUntilDate:(NSDate *)limitDate;
//- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate;
//底层源码可见(https://github.com/apple/swift-corelibs-foundation/blob/main/Sources/Foundation/RunLoop.swift),前两个方法都是在使用while循环调用第三个方法

// Q:CF VS NS  CF线程安全, NS线程不安全, ns面向对象.  线程不安全是啥意思? 多个线程对同一个数据的写操作,可能造成数据不一致
@end
