//
//  KT_thirdViewController.m
//  test
//
//  Created by 宋锡铭 on 2022/9/17.
//  Copyright © 2022 sven. All rights reserved.
//

#import "KT_thirdViewController.h"
#import "TestTheread.h"

@interface KT_thirdViewController ()
@property (nonatomic, strong) TestTheread *thread;

@property (nonatomic, assign ) BOOL stopped;

@end

@implementation KT_thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    
    [self GCDkeepAlive];
}

- (void)addView {
    UIButton *keepBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:keepBtn];
    [keepBtn setTitle:@"启动runloop" forState:UIControlStateNormal];
    [keepBtn addTarget:self action:@selector(startRunloopTap) forControlEvents:UIControlEventTouchUpInside];
    keepBtn.backgroundColor = [UIColor orangeColor];
    
    UIButton *excuteBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:excuteBtn];
    [excuteBtn addTarget:self action:@selector(excuteTap)
        forControlEvents:UIControlEventTouchUpInside];
    excuteBtn.backgroundColor = [UIColor orangeColor];
    [excuteBtn setTitle:@"执行任务" forState:UIControlStateNormal];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    [self.view addSubview:stopBtn];
    [stopBtn addTarget:self action:@selector(stopTap)
        forControlEvents:UIControlEventTouchUpInside];
    stopBtn.backgroundColor = [UIColor orangeColor];
    [stopBtn setTitle:@"停止runloop" forState:UIControlStateNormal];
}

- (void)startRunloopTap {
    // 问题1: 直接走了 "结束了"
    // 问题2:  NSRunLoopCommonModes 会崩溃
    // 问题3: 会卡死
    // 问题4: 执行后,不能再次开启
    // 问题5: 不加port也保活了
    
    // !!!:不加port, 无while循环,点一下子线程任务会崩溃; 因为runloop运行完就结束了,线程死了
    // !!!:加port, 无while循环, 点一下,可以,第二下会崩溃?猜想 是的
    // !!!:加port, 加while循环,可以保证,线程保活了
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 线程-对应一个runloop
        __weak typeof(self) weakSelf = self;
        self.thread = [[TestTheread alloc] initWithBlock:^{
            
            NSRunLoop *runloop = [NSRunLoop currentRunLoop];
            [runloop addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            
            while (!weakSelf.stopped) {
                [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            NSLog(@"runloop设置结束");
        }];
        
        
        [self.thread setName:@"3保活线程"];
        [self.thread start];
        
        NSLog(@"结束了");
    });
}


- (void)excuteTap {
    [self performSelector:@selector(threadAction) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)threadAction {
    NSLog(@"保活线程行为,耗时操作等等%@",[NSThread currentThread]);
}

- (void)stopTap {
    // 下面两行直接执行不行, 应该在相关线程,而不是主线程
//    self.stopped = YES;
//    self.thread = nil;
    
    [self performSelector:@selector(stopAction) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)stopAction {
    self.stopped = YES;
    self.thread = nil;
    
    CFRunLoopStop(CFRunLoopGetCurrent());
}


- (void)GCDkeepAlive{
    NSLog(@"main的runloop%@",[NSRunLoop mainRunLoop]);
    NSLog(@"main的runloop%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//        NSLog(@"gcd的runloop%@",runloop);
        NSLog(@"GCD的runloop%@",[NSThread currentThread]);
    });
}

@end
