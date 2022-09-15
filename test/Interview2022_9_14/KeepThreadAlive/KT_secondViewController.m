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
        // 添加一个port 保活
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes]; //加上这个,后面都不走了
         //  source1:基于port内核事件,主动唤醒.  数据结构? key(machport)-value(source1)
        // source0用户的,主动出发的触摸  数据结构? 数组
        
        // 如果repeats 为NO, 线程仍然不能保活
//        [runloop addTimer:[NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"111111");
//        }] forMode:NSRunLoopCommonModes];
        NSLog(@"检查runloop%@",runloop);
        [runloop run];
        

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
    // 因为runloop组成: mode包含sources/ timer/ observer; 如果没有sources timer就休眠,省cup
}

// [Demo2 知识点：]
// 子线程保活定义:保持runloop不退出(默认结束source timer observer, runloop会退出)
// 子线程保活: 添加一个machport(或者timer, observer)
// source0: 用户触发,数据结构:数组
// source1: 系统内核,数据结构:key(machport)-value(source1) ; 线程,runloop=> key-value

// TODO: 主线程要保活么
@end
